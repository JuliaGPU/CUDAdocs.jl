using CUDA.CUSPARSE
using LinearAlgebra, SparseArrays

@testset "LinearAlgebra" begin
    @testset "$f(A)+$h(B) $elty" for elty in [Float32, Float64, ComplexF32, ComplexF64],
                                     f in (identity, transpose, adjoint),
                                     h in (identity, transpose, adjoint)
        n = 10
        alpha = rand()
        beta = rand()
        A = sprand(elty, n, n, rand())
        B = sprand(elty, n, n, rand())

        dA = CUSPARSE.CuSparseMatrixCSR(A)
        dB = CUSPARSE.CuSparseMatrixCSR(B)

        C = f(A) + h(B)
        dC = f(dA) + h(dB)
        @test C ≈ collect(dC)
    end

    @testset "$f(A)*b $elty" for elty in [Float32, Float64, ComplexF32, ComplexF64],
                                 f in (identity, transpose, adjoint)
        n = 10
        alpha = rand()
        beta = rand()
        A = sprand(elty, n, n, rand())
        b = rand(elty, n)
        c = rand(elty, n)
        alpha = beta = 1.0
        c = zeros(elty, n)

        dA = CuSparseMatrixCSR(A)
        db = CuArray(b)
        dc = CuArray(c)

        # test with empty inputs
        @test Array(dA * CUDA.zeros(elty, n, 0)) == zeros(elty, n, 0)

        mul!(c, f(A), b, alpha, beta)
        mul!(dc, f(dA), db, alpha, beta)
        @test c ≈ collect(dc)

        A = A + transpose(A)
        dA = CuSparseMatrixCSR(A)

        @assert issymmetric(A)
        mul!(c, f(Symmetric(A)), b, alpha, beta)
        mul!(dc, f(Symmetric(dA)), db, alpha, beta)
        @test c ≈ collect(dc)
    end

    @testset "$f(A)*$h(B) $elty" for elty in [Float32, Float64, ComplexF32, ComplexF64],
                                     f in (identity, transpose, adjoint),
                                     h in (identity, transpose, adjoint)
        if CUSPARSE.version() <= v"10.3.1" &&
            (h ∈ (transpose, adjoint) && f != identity) ||
            (h == adjoint && elty <: Complex)
            # These combinations are not implemented in CUDA10
            continue
        end

        n = 10
        alpha = rand()
        beta = rand()
        A = sprand(elty, n, n, rand())
        B = rand(elty, n, n)
        C = rand(elty, n, n)

        dA = CuSparseMatrixCSR(A)
        dB = CuArray(B)
        dC = CuArray(C)

        mul!(C, f(A), h(B), alpha, beta)
        mul!(dC, f(dA), h(dB), alpha, beta)
        @test C ≈ collect(dC)

        A = A + transpose(A)
        dA = CuSparseMatrixCSR(A)

        @assert issymmetric(A)
        mul!(C, f(Symmetric(A)), h(B), alpha, beta)
        mul!(dC, f(Symmetric(dA)), h(dB), alpha, beta)
        @test C ≈ collect(dC)
    end

    @testset "issue #1095 ($elty)" for elty in [Float32, Float64, ComplexF32, ComplexF64]
        # Test non-square matrices
        n, m, p = 10, 20, 4
        alpha = rand()
        beta = rand()
        A = sprand(elty, n, m, rand())
        B = rand(elty, m, p)
        C = rand(elty, n, p)

        dA = CuSparseMatrixCSR(A)
        dB = CuArray(B)
        dC = CuArray(C)

        mul!(C, A, B, alpha, beta)
        mul!(dC, dA, dB, alpha, beta)
        @test C ≈ collect(dC)

        mul!(B, transpose(A), C, alpha, beta)
        mul!(dB, transpose(dA), dC, alpha, beta)
        @test B ≈ collect(dB)

        mul!(B, adjoint(A), C, alpha, beta)
        mul!(dB, adjoint(dA), dC, alpha, beta)
        @test B ≈ collect(dB)
    end
end

