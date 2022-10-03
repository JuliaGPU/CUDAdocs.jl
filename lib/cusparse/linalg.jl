using LinearAlgebra

function sum_dim1(A::CuSparseMatrixCSR)
    function kernel(Tnorm, out, dA)
        idx = (blockIdx().x-1) * blockDim().x + threadIdx().x
        idx < length(dA.rowPtr) || return
        s = zero(Tnorm)
        for k in dA.rowPtr[idx]:dA.rowPtr[idx+1]-1
            s += abs(dA.nzVal[k])
        end
        out[idx] = s
        return
    end

    m, n = size(A)
    Tnorm = typeof(float(real(zero(eltype(A)))))
    Tsum = promote_type(Float64,Tnorm)
    rowsum = CUDA.CuArray{Tsum}(undef, m)
    kernel_f = @cuda launch=false kernel(Tnorm, rowsum, A)
    
    config = launch_configuration(kernel_f.fun)
    threads = min(n, config.threads)
    blocks = cld(n, threads)
    kernel_f(Tnorm, rowsum, A; threads, blocks)
    return rowsum
end

function sum_dim2(A::CuSparseMatrixCSR)
    function kernel(Tnorm, out, dA)
        idx = (blockIdx().x-1) * blockDim().x + threadIdx().x
        idx < length(dA.colPtr) || return
        s = zero(Tnorm)
        for k in dA.colPtr[idx]:dA.colPtr[idx+1]-1
            s += abs(dA.nzVal[k])
        end
        out[idx] = s
        return
    end

    A = CuSparseMatrixCSC(A)
    m, n = size(A)
    Tnorm = typeof(float(real(zero(eltype(A)))))
    Tsum = promote_type(Float64,Tnorm)
    colsum = CUDA.CuArray{Tsum}(undef, n)
    kernel_f = @cuda launch=false kernel(Tnorm, colsum, A)
    
    config = launch_configuration(kernel_f.fun)
    threads = min(m, config.threads)
    blocks = cld(m, threads)
    kernel_f(Tnorm, colsum, A; threads, blocks)
    return colsum
end

function LinearAlgebra.opnorm(A::CuSparseMatrixCSR, p::Real=2)
    if p == Inf
        return maximum(sum_dim1(A))
    elseif p == 1
        return maximum(sum_dim2(A))
    else
        error("p=$p is not supported")
    end
end

LinearAlgebra.opnorm(A::CuSparseMatrixCSC, p::Real=2) = opnorm(CuSparseMatrixCSR(A), p)

function LinearAlgebra.norm(A::AbstractCuSparseMatrix{T,M}, p::Real=2) where {T,M}
    if p == Inf
        return maximum(abs.(A.nzVal))
    elseif p == -Inf
        return minimum(abs.(A.nzVal))
    elseif p == 0
        return Float64(A.nnz)
    else
        return sum(abs.(A.nzVal).^p)^(1/p)
    end
end

function LinearAlgebra.triu(A::CuSparseMatrixCOO{T,M}, k::Integer) where {T,M}
    mask = A.rowInd .+ k .<= A.colInd
    rows = A.rowInd[mask]
    cols = A.colInd[mask]
    datas = A.nzVal[mask]
    CuSparseMatrixCOO(sparse(rows, cols, datas, size(A, 1), size(A, 2)))
end

function LinearAlgebra.tril(A::CuSparseMatrixCOO{T,M}, k::Integer) where {T,M}
    mask = A.rowInd .+ k .>= A.colInd
    rows = A.rowInd[mask]
    cols = A.colInd[mask]
    datas = A.nzVal[mask]
    CuSparseMatrixCOO(sparse(rows, cols, datas, size(A, 1), size(A, 2)))
end

LinearAlgebra.triu(A::CuSparseMatrixCOO{T,M}) where {T,M} = triu(A, 0)
LinearAlgebra.tril(A::CuSparseMatrixCOO{T,M}) where {T,M} = tril(A, 0)

function LinearAlgebra.kron(A::CuSparseMatrixCOO{T,M}, B::CuSparseMatrixCOO{T,M}) where {T,M}
    out_shape = (size(A, 1) * size(B, 1), size(A, 2) * size(B, 2))
    Annz = Int64(A.nnz)
    Bnnz = Int64(B.nnz)

    if A.nnz == 0 || B.nnz == 0
        return CuSparseMatrixCOO(spzeros(T, out_shape))
    end

    row = (A.rowInd .- 1) .* size(B, 1)
    row = repeat(row, inner = Bnnz)
    col = (A.colInd .- 1) .* size(B, 2)
    col = repeat(col, inner = Bnnz)
    data = repeat(A.nzVal, inner = Bnnz)

    row, col = reshape(row, Annz, Bnnz), reshape(col, Annz, Bnnz)
    row .+= reshape(repeat(reverse(B.rowInd) .- 1, outer = Annz), Annz, Bnnz)
    col .+= reshape(repeat(reverse(B.colInd) .- 1, outer = Annz), Annz, Bnnz)
    row, col = reshape(row, Annz * Bnnz) .+ 1, reshape(col, Annz * Bnnz) .+ 1

    data = reshape(data, Annz, Bnnz) .* reshape(repeat(reverse(B.nzVal), outer = Annz), Annz, Bnnz)
    data = reshape(data, Annz * Bnnz)
    CuSparseMatrixCOO(sparse(row, col, data, out_shape[1], out_shape[2]))
end

for SparseMatrixType in [:CuSparseMatrixCSC, :CuSparseMatrixCSR]
    @eval begin
        LinearAlgebra.triu(A::$SparseMatrixType{T,M}, k::Integer) where {T,M} = $SparseMatrixType( triu(CuSparseMatrixCOO(A), k) )
        LinearAlgebra.tril(A::$SparseMatrixType{T,M}, k::Integer) where {T,M} = $SparseMatrixType( tril(CuSparseMatrixCOO(A), k) )
        LinearAlgebra.triu(A::$SparseMatrixType{T,M}) where {T,M} = $SparseMatrixType( triu(CuSparseMatrixCOO(A), 0) )
        LinearAlgebra.tril(A::$SparseMatrixType{T,M}) where {T,M} = $SparseMatrixType( tril(CuSparseMatrixCOO(A), 0) )

        LinearAlgebra.kron(A::$SparseMatrixType{T,M}, B::$SparseMatrixType{T,M}) where {T,M} = $SparseMatrixType( kron(CuSparseMatrixCOO(A), CuSparseMatrixCOO(B)) )
    
        function LinearAlgebra.exp(A::$SparseMatrixType{T,M}; threshold = 1e-7, nonzero_tol = 1e-14) where {T,M}
            rows = LinearAlgebra.checksquare(A) # Throws exception if not square
            typeA = eltype(A)
        
            mat_norm = norm(A, Inf)
            scaling_factor = nextpow(2, mat_norm) # Native routine, faster
            A = A ./ scaling_factor
            delta = 1
        
            P = $SparseMatrixType(spdiagm(0 => ones(eltype(A), rows)))
            next_term = P
            n = 1
        
            while delta > threshold
                next_term = typeA(1 / n) * A * next_term
                droptol!(next_term, nonzero_tol)
                delta = norm(next_term, Inf)
                copyto!(P, P + next_term)
                n = n + 1
            end
            for n = 1:log2(scaling_factor)
                P = P * P;
                if nnz(P) / length(P) < 0.25
                    droptol!(P, nonzero_tol)
                end
            end
            P
        end
        
    end
end