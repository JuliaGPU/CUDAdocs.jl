# This file is automatically generated. Do not edit!
# To re-generated, execute res/wrap.jl

using CEnum

mutable struct cublasLtContext end

const cublasLtHandle_t = Ptr{cublasLtContext}

@checked function cublasLtCreate(lightHandle)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtCreate(lightHandle::Ptr{cublasLtHandle_t})::cublasStatus_t
end

@checked function cublasLtDestroy(lightHandle)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtDestroy(lightHandle::cublasLtHandle_t)::cublasStatus_t
end

function cublasLtGetStatusName(status)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtGetStatusName(status::cublasStatus_t)::Cstring
end

function cublasLtGetStatusString(status)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtGetStatusString(status::cublasStatus_t)::Cstring
end

function cublasLtGetVersion()
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtGetVersion()::Csize_t
end

function cublasLtGetCudartVersion()
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtGetCudartVersion()::Csize_t
end

@checked function cublasLtGetProperty(type, value)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtGetProperty(type::libraryPropertyType,
                                                  value::Ptr{Cint})::cublasStatus_t
end

@checked function cublasLtHeuristicsCacheGetCapacity(capacity)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtHeuristicsCacheGetCapacity(capacity::Ptr{Csize_t})::cublasStatus_t
end

@checked function cublasLtHeuristicsCacheSetCapacity(capacity)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtHeuristicsCacheSetCapacity(capacity::Csize_t)::cublasStatus_t
end

function cublasLtDisableCpuInstructionsSetMask(mask)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtDisableCpuInstructionsSetMask(mask::Cuint)::Cuint
end

struct cublasLtMatrixLayoutOpaque_t
    data::NTuple{8,UInt64}
end

const cublasLtMatrixLayout_t = Ptr{cublasLtMatrixLayoutOpaque_t}

struct cublasLtMatmulAlgo_t
    data::NTuple{8,UInt64}
end

struct cublasLtMatmulDescOpaque_t
    data::NTuple{32,UInt64}
end

const cublasLtMatmulDesc_t = Ptr{cublasLtMatmulDescOpaque_t}

struct cublasLtMatrixTransformDescOpaque_t
    data::NTuple{8,UInt64}
end

const cublasLtMatrixTransformDesc_t = Ptr{cublasLtMatrixTransformDescOpaque_t}

struct cublasLtMatmulPreferenceOpaque_t
    data::NTuple{8,UInt64}
end

const cublasLtMatmulPreference_t = Ptr{cublasLtMatmulPreferenceOpaque_t}

@cenum cublasLtMatmulTile_t::UInt32 begin
    CUBLASLT_MATMUL_TILE_UNDEFINED = 0
    CUBLASLT_MATMUL_TILE_8x8 = 1
    CUBLASLT_MATMUL_TILE_8x16 = 2
    CUBLASLT_MATMUL_TILE_16x8 = 3
    CUBLASLT_MATMUL_TILE_8x32 = 4
    CUBLASLT_MATMUL_TILE_16x16 = 5
    CUBLASLT_MATMUL_TILE_32x8 = 6
    CUBLASLT_MATMUL_TILE_8x64 = 7
    CUBLASLT_MATMUL_TILE_16x32 = 8
    CUBLASLT_MATMUL_TILE_32x16 = 9
    CUBLASLT_MATMUL_TILE_64x8 = 10
    CUBLASLT_MATMUL_TILE_32x32 = 11
    CUBLASLT_MATMUL_TILE_32x64 = 12
    CUBLASLT_MATMUL_TILE_64x32 = 13
    CUBLASLT_MATMUL_TILE_32x128 = 14
    CUBLASLT_MATMUL_TILE_64x64 = 15
    CUBLASLT_MATMUL_TILE_128x32 = 16
    CUBLASLT_MATMUL_TILE_64x128 = 17
    CUBLASLT_MATMUL_TILE_128x64 = 18
    CUBLASLT_MATMUL_TILE_64x256 = 19
    CUBLASLT_MATMUL_TILE_128x128 = 20
    CUBLASLT_MATMUL_TILE_256x64 = 21
    CUBLASLT_MATMUL_TILE_64x512 = 22
    CUBLASLT_MATMUL_TILE_128x256 = 23
    CUBLASLT_MATMUL_TILE_256x128 = 24
    CUBLASLT_MATMUL_TILE_512x64 = 25
    CUBLASLT_MATMUL_TILE_64x96 = 26
    CUBLASLT_MATMUL_TILE_96x64 = 27
    CUBLASLT_MATMUL_TILE_96x128 = 28
    CUBLASLT_MATMUL_TILE_128x160 = 29
    CUBLASLT_MATMUL_TILE_160x128 = 30
    CUBLASLT_MATMUL_TILE_192x128 = 31
    CUBLASLT_MATMUL_TILE_128x192 = 32
    CUBLASLT_MATMUL_TILE_128x96 = 33
    CUBLASLT_MATMUL_TILE_32x256 = 34
    CUBLASLT_MATMUL_TILE_256x32 = 35
    CUBLASLT_MATMUL_TILE_END = 36
end

@cenum cublasLtMatmulStages_t::UInt32 begin
    CUBLASLT_MATMUL_STAGES_UNDEFINED = 0
    CUBLASLT_MATMUL_STAGES_16x1 = 1
    CUBLASLT_MATMUL_STAGES_16x2 = 2
    CUBLASLT_MATMUL_STAGES_16x3 = 3
    CUBLASLT_MATMUL_STAGES_16x4 = 4
    CUBLASLT_MATMUL_STAGES_16x5 = 5
    CUBLASLT_MATMUL_STAGES_16x6 = 6
    CUBLASLT_MATMUL_STAGES_32x1 = 7
    CUBLASLT_MATMUL_STAGES_32x2 = 8
    CUBLASLT_MATMUL_STAGES_32x3 = 9
    CUBLASLT_MATMUL_STAGES_32x4 = 10
    CUBLASLT_MATMUL_STAGES_32x5 = 11
    CUBLASLT_MATMUL_STAGES_32x6 = 12
    CUBLASLT_MATMUL_STAGES_64x1 = 13
    CUBLASLT_MATMUL_STAGES_64x2 = 14
    CUBLASLT_MATMUL_STAGES_64x3 = 15
    CUBLASLT_MATMUL_STAGES_64x4 = 16
    CUBLASLT_MATMUL_STAGES_64x5 = 17
    CUBLASLT_MATMUL_STAGES_64x6 = 18
    CUBLASLT_MATMUL_STAGES_128x1 = 19
    CUBLASLT_MATMUL_STAGES_128x2 = 20
    CUBLASLT_MATMUL_STAGES_128x3 = 21
    CUBLASLT_MATMUL_STAGES_128x4 = 22
    CUBLASLT_MATMUL_STAGES_128x5 = 23
    CUBLASLT_MATMUL_STAGES_128x6 = 24
    CUBLASLT_MATMUL_STAGES_32x10 = 25
    CUBLASLT_MATMUL_STAGES_8x4 = 26
    CUBLASLT_MATMUL_STAGES_16x10 = 27
    CUBLASLT_MATMUL_STAGES_8x5 = 28
    CUBLASLT_MATMUL_STAGES_8x3 = 31
    CUBLASLT_MATMUL_STAGES_8xAUTO = 32
    CUBLASLT_MATMUL_STAGES_16xAUTO = 33
    CUBLASLT_MATMUL_STAGES_32xAUTO = 34
    CUBLASLT_MATMUL_STAGES_64xAUTO = 35
    CUBLASLT_MATMUL_STAGES_128xAUTO = 36
    CUBLASLT_MATMUL_STAGES_END = 37
end

@cenum cublasLtClusterShape_t::UInt32 begin
    CUBLASLT_CLUSTER_SHAPE_AUTO = 0
    CUBLASLT_CLUSTER_SHAPE_1x1x1 = 2
    CUBLASLT_CLUSTER_SHAPE_2x1x1 = 3
    CUBLASLT_CLUSTER_SHAPE_4x1x1 = 4
    CUBLASLT_CLUSTER_SHAPE_1x2x1 = 5
    CUBLASLT_CLUSTER_SHAPE_2x2x1 = 6
    CUBLASLT_CLUSTER_SHAPE_4x2x1 = 7
    CUBLASLT_CLUSTER_SHAPE_1x4x1 = 8
    CUBLASLT_CLUSTER_SHAPE_2x4x1 = 9
    CUBLASLT_CLUSTER_SHAPE_4x4x1 = 10
    CUBLASLT_CLUSTER_SHAPE_8x1x1 = 11
    CUBLASLT_CLUSTER_SHAPE_1x8x1 = 12
    CUBLASLT_CLUSTER_SHAPE_8x2x1 = 13
    CUBLASLT_CLUSTER_SHAPE_2x8x1 = 14
    CUBLASLT_CLUSTER_SHAPE_16x1x1 = 15
    CUBLASLT_CLUSTER_SHAPE_1x16x1 = 16
    CUBLASLT_CLUSTER_SHAPE_3x1x1 = 17
    CUBLASLT_CLUSTER_SHAPE_5x1x1 = 18
    CUBLASLT_CLUSTER_SHAPE_6x1x1 = 19
    CUBLASLT_CLUSTER_SHAPE_7x1x1 = 20
    CUBLASLT_CLUSTER_SHAPE_9x1x1 = 21
    CUBLASLT_CLUSTER_SHAPE_10x1x1 = 22
    CUBLASLT_CLUSTER_SHAPE_11x1x1 = 23
    CUBLASLT_CLUSTER_SHAPE_12x1x1 = 24
    CUBLASLT_CLUSTER_SHAPE_13x1x1 = 25
    CUBLASLT_CLUSTER_SHAPE_14x1x1 = 26
    CUBLASLT_CLUSTER_SHAPE_15x1x1 = 27
    CUBLASLT_CLUSTER_SHAPE_3x2x1 = 28
    CUBLASLT_CLUSTER_SHAPE_5x2x1 = 29
    CUBLASLT_CLUSTER_SHAPE_6x2x1 = 30
    CUBLASLT_CLUSTER_SHAPE_7x2x1 = 31
    CUBLASLT_CLUSTER_SHAPE_1x3x1 = 32
    CUBLASLT_CLUSTER_SHAPE_2x3x1 = 33
    CUBLASLT_CLUSTER_SHAPE_3x3x1 = 34
    CUBLASLT_CLUSTER_SHAPE_4x3x1 = 35
    CUBLASLT_CLUSTER_SHAPE_5x3x1 = 36
    CUBLASLT_CLUSTER_SHAPE_3x4x1 = 37
    CUBLASLT_CLUSTER_SHAPE_1x5x1 = 38
    CUBLASLT_CLUSTER_SHAPE_2x5x1 = 39
    CUBLASLT_CLUSTER_SHAPE_3x5x1 = 40
    CUBLASLT_CLUSTER_SHAPE_1x6x1 = 41
    CUBLASLT_CLUSTER_SHAPE_2x6x1 = 42
    CUBLASLT_CLUSTER_SHAPE_1x7x1 = 43
    CUBLASLT_CLUSTER_SHAPE_2x7x1 = 44
    CUBLASLT_CLUSTER_SHAPE_1x9x1 = 45
    CUBLASLT_CLUSTER_SHAPE_1x10x1 = 46
    CUBLASLT_CLUSTER_SHAPE_1x11x1 = 47
    CUBLASLT_CLUSTER_SHAPE_1x12x1 = 48
    CUBLASLT_CLUSTER_SHAPE_1x13x1 = 49
    CUBLASLT_CLUSTER_SHAPE_1x14x1 = 50
    CUBLASLT_CLUSTER_SHAPE_1x15x1 = 51
    CUBLASLT_CLUSTER_SHAPE_END = 52
end

@cenum cublasLtMatmulInnerShape_t::UInt32 begin
    CUBLASLT_MATMUL_INNER_SHAPE_UNDEFINED = 0
    CUBLASLT_MATMUL_INNER_SHAPE_MMA884 = 1
    CUBLASLT_MATMUL_INNER_SHAPE_MMA1684 = 2
    CUBLASLT_MATMUL_INNER_SHAPE_MMA1688 = 3
    CUBLASLT_MATMUL_INNER_SHAPE_MMA16816 = 4
    CUBLASLT_MATMUL_INNER_SHAPE_END = 5
end

@cenum cublasLtPointerMode_t::UInt32 begin
    CUBLASLT_POINTER_MODE_HOST = 0
    CUBLASLT_POINTER_MODE_DEVICE = 1
    CUBLASLT_POINTER_MODE_DEVICE_VECTOR = 2
    CUBLASLT_POINTER_MODE_ALPHA_DEVICE_VECTOR_BETA_ZERO = 3
    CUBLASLT_POINTER_MODE_ALPHA_DEVICE_VECTOR_BETA_HOST = 4
end

@cenum cublasLtPointerModeMask_t::UInt32 begin
    CUBLASLT_POINTER_MODE_MASK_HOST = 1
    CUBLASLT_POINTER_MODE_MASK_DEVICE = 2
    CUBLASLT_POINTER_MODE_MASK_DEVICE_VECTOR = 4
    CUBLASLT_POINTER_MODE_MASK_ALPHA_DEVICE_VECTOR_BETA_ZERO = 8
    CUBLASLT_POINTER_MODE_MASK_ALPHA_DEVICE_VECTOR_BETA_HOST = 16
end

const cublasLtNumericalImplFlags_t = UInt64

@checked function cublasLtMatmul(lightHandle, computeDesc, alpha, A, Adesc, B, Bdesc, beta,
                                 C, Cdesc, D, Ddesc, algo, workspace, workspaceSizeInBytes,
                                 stream)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmul(lightHandle::cublasLtHandle_t,
                                             computeDesc::cublasLtMatmulDesc_t,
                                             alpha::PtrOrCuPtr{Cvoid}, A::CuPtr{Cvoid},
                                             Adesc::cublasLtMatrixLayout_t, B::CuPtr{Cvoid},
                                             Bdesc::cublasLtMatrixLayout_t,
                                             beta::PtrOrCuPtr{Cvoid}, C::CuPtr{Cvoid},
                                             Cdesc::cublasLtMatrixLayout_t, D::CuPtr{Cvoid},
                                             Ddesc::cublasLtMatrixLayout_t,
                                             algo::Ptr{cublasLtMatmulAlgo_t},
                                             workspace::CuPtr{Cvoid},
                                             workspaceSizeInBytes::Csize_t,
                                             stream::cudaStream_t)::cublasStatus_t
end

@checked function cublasLtMatrixTransform(lightHandle, transformDesc, alpha, A, Adesc, beta,
                                          B, Bdesc, C, Cdesc, stream)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixTransform(lightHandle::cublasLtHandle_t,
                                                      transformDesc::cublasLtMatrixTransformDesc_t,
                                                      alpha::PtrOrCuPtr{Cvoid},
                                                      A::CuPtr{Cvoid},
                                                      Adesc::cublasLtMatrixLayout_t,
                                                      beta::PtrOrCuPtr{Cvoid},
                                                      B::CuPtr{Cvoid},
                                                      Bdesc::cublasLtMatrixLayout_t,
                                                      C::CuPtr{Cvoid},
                                                      Cdesc::cublasLtMatrixLayout_t,
                                                      stream::cudaStream_t)::cublasStatus_t
end

@cenum cublasLtOrder_t::UInt32 begin
    CUBLASLT_ORDER_COL = 0
    CUBLASLT_ORDER_ROW = 1
    CUBLASLT_ORDER_COL32 = 2
    CUBLASLT_ORDER_COL4_4R2_8C = 3
    CUBLASLT_ORDER_COL32_2R_4R4 = 4
end

@cenum cublasLtMatrixLayoutAttribute_t::UInt32 begin
    CUBLASLT_MATRIX_LAYOUT_TYPE = 0
    CUBLASLT_MATRIX_LAYOUT_ORDER = 1
    CUBLASLT_MATRIX_LAYOUT_ROWS = 2
    CUBLASLT_MATRIX_LAYOUT_COLS = 3
    CUBLASLT_MATRIX_LAYOUT_LD = 4
    CUBLASLT_MATRIX_LAYOUT_BATCH_COUNT = 5
    CUBLASLT_MATRIX_LAYOUT_STRIDED_BATCH_OFFSET = 6
    CUBLASLT_MATRIX_LAYOUT_PLANE_OFFSET = 7
end

@checked function cublasLtMatrixLayoutInit_internal(matLayout, size, type, rows, cols, ld)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixLayoutInit_internal(matLayout::cublasLtMatrixLayout_t,
                                                                size::Csize_t,
                                                                type::cudaDataType,
                                                                rows::UInt64, cols::UInt64,
                                                                ld::Int64)::cublasStatus_t
end

@checked function cublasLtMatrixLayoutInit(matLayout, type, rows, cols, ld)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixLayoutInit(matLayout::cublasLtMatrixLayout_t,
                                                       type::cudaDataType, rows::UInt64,
                                                       cols::UInt64,
                                                       ld::Int64)::cublasStatus_t
end

@checked function cublasLtMatrixLayoutCreate(matLayout, type, rows, cols, ld)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixLayoutCreate(matLayout::Ptr{cublasLtMatrixLayout_t},
                                                         type::cudaDataType, rows::UInt64,
                                                         cols::UInt64,
                                                         ld::Int64)::cublasStatus_t
end

@checked function cublasLtMatrixLayoutDestroy(matLayout)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixLayoutDestroy(matLayout::cublasLtMatrixLayout_t)::cublasStatus_t
end

@checked function cublasLtMatrixLayoutSetAttribute(matLayout, attr, buf, sizeInBytes)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixLayoutSetAttribute(matLayout::cublasLtMatrixLayout_t,
                                                               attr::cublasLtMatrixLayoutAttribute_t,
                                                               buf::Ptr{Cvoid},
                                                               sizeInBytes::Csize_t)::cublasStatus_t
end

@checked function cublasLtMatrixLayoutGetAttribute(matLayout, attr, buf, sizeInBytes,
                                                   sizeWritten)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixLayoutGetAttribute(matLayout::cublasLtMatrixLayout_t,
                                                               attr::cublasLtMatrixLayoutAttribute_t,
                                                               buf::Ptr{Cvoid},
                                                               sizeInBytes::Csize_t,
                                                               sizeWritten::Ptr{Csize_t})::cublasStatus_t
end

@cenum cublasLtMatmulDescAttributes_t::UInt32 begin
    CUBLASLT_MATMUL_DESC_COMPUTE_TYPE = 0
    CUBLASLT_MATMUL_DESC_SCALE_TYPE = 1
    CUBLASLT_MATMUL_DESC_POINTER_MODE = 2
    CUBLASLT_MATMUL_DESC_TRANSA = 3
    CUBLASLT_MATMUL_DESC_TRANSB = 4
    CUBLASLT_MATMUL_DESC_TRANSC = 5
    CUBLASLT_MATMUL_DESC_FILL_MODE = 6
    CUBLASLT_MATMUL_DESC_EPILOGUE = 7
    CUBLASLT_MATMUL_DESC_BIAS_POINTER = 8
    CUBLASLT_MATMUL_DESC_BIAS_BATCH_STRIDE = 10
    CUBLASLT_MATMUL_DESC_EPILOGUE_AUX_POINTER = 11
    CUBLASLT_MATMUL_DESC_EPILOGUE_AUX_LD = 12
    CUBLASLT_MATMUL_DESC_EPILOGUE_AUX_BATCH_STRIDE = 13
    CUBLASLT_MATMUL_DESC_ALPHA_VECTOR_BATCH_STRIDE = 14
    CUBLASLT_MATMUL_DESC_SM_COUNT_TARGET = 15
    CUBLASLT_MATMUL_DESC_A_SCALE_POINTER = 17
    CUBLASLT_MATMUL_DESC_B_SCALE_POINTER = 18
    CUBLASLT_MATMUL_DESC_C_SCALE_POINTER = 19
    CUBLASLT_MATMUL_DESC_D_SCALE_POINTER = 20
    CUBLASLT_MATMUL_DESC_AMAX_D_POINTER = 21
    CUBLASLT_MATMUL_DESC_EPILOGUE_AUX_DATA_TYPE = 22
    CUBLASLT_MATMUL_DESC_EPILOGUE_AUX_SCALE_POINTER = 23
    CUBLASLT_MATMUL_DESC_EPILOGUE_AUX_AMAX_POINTER = 24
    CUBLASLT_MATMUL_DESC_FAST_ACCUM = 25
    CUBLASLT_MATMUL_DESC_BIAS_DATA_TYPE = 26
    CUBLASLT_MATMUL_DESC_ATOMIC_SYNC_NUM_CHUNKS_D_ROWS = 27
    CUBLASLT_MATMUL_DESC_ATOMIC_SYNC_NUM_CHUNKS_D_COLS = 28
    CUBLASLT_MATMUL_DESC_ATOMIC_SYNC_IN_COUNTERS_POINTER = 29
    CUBLASLT_MATMUL_DESC_ATOMIC_SYNC_OUT_COUNTERS_POINTER = 30
end

@checked function cublasLtMatmulDescInit_internal(matmulDesc, size, computeType, scaleType)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulDescInit_internal(matmulDesc::cublasLtMatmulDesc_t,
                                                              size::Csize_t,
                                                              computeType::cublasComputeType_t,
                                                              scaleType::cudaDataType_t)::cublasStatus_t
end

@checked function cublasLtMatmulDescInit(matmulDesc, computeType, scaleType)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulDescInit(matmulDesc::cublasLtMatmulDesc_t,
                                                     computeType::cublasComputeType_t,
                                                     scaleType::cudaDataType_t)::cublasStatus_t
end

@checked function cublasLtMatmulDescCreate(matmulDesc, computeType, scaleType)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulDescCreate(matmulDesc::Ptr{cublasLtMatmulDesc_t},
                                                       computeType::cublasComputeType_t,
                                                       scaleType::cudaDataType_t)::cublasStatus_t
end

@checked function cublasLtMatmulDescDestroy(matmulDesc)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulDescDestroy(matmulDesc::cublasLtMatmulDesc_t)::cublasStatus_t
end

@checked function cublasLtMatmulDescSetAttribute(matmulDesc, attr, buf, sizeInBytes)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulDescSetAttribute(matmulDesc::cublasLtMatmulDesc_t,
                                                             attr::cublasLtMatmulDescAttributes_t,
                                                             buf::PtrOrCuPtr{Cvoid},
                                                             sizeInBytes::Csize_t)::cublasStatus_t
end

@checked function cublasLtMatmulDescGetAttribute(matmulDesc, attr, buf, sizeInBytes,
                                                 sizeWritten)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulDescGetAttribute(matmulDesc::cublasLtMatmulDesc_t,
                                                             attr::cublasLtMatmulDescAttributes_t,
                                                             buf::Ptr{Cvoid},
                                                             sizeInBytes::Csize_t,
                                                             sizeWritten::Ptr{Csize_t})::cublasStatus_t
end

@cenum cublasLtMatrixTransformDescAttributes_t::UInt32 begin
    CUBLASLT_MATRIX_TRANSFORM_DESC_SCALE_TYPE = 0
    CUBLASLT_MATRIX_TRANSFORM_DESC_POINTER_MODE = 1
    CUBLASLT_MATRIX_TRANSFORM_DESC_TRANSA = 2
    CUBLASLT_MATRIX_TRANSFORM_DESC_TRANSB = 3
end

@checked function cublasLtMatrixTransformDescInit_internal(transformDesc, size, scaleType)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixTransformDescInit_internal(transformDesc::cublasLtMatrixTransformDesc_t,
                                                                       size::Csize_t,
                                                                       scaleType::cudaDataType)::cublasStatus_t
end

@checked function cublasLtMatrixTransformDescInit(transformDesc, scaleType)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixTransformDescInit(transformDesc::cublasLtMatrixTransformDesc_t,
                                                              scaleType::cudaDataType)::cublasStatus_t
end

@checked function cublasLtMatrixTransformDescCreate(transformDesc, scaleType)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixTransformDescCreate(transformDesc::Ptr{cublasLtMatrixTransformDesc_t},
                                                                scaleType::cudaDataType)::cublasStatus_t
end

@checked function cublasLtMatrixTransformDescDestroy(transformDesc)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixTransformDescDestroy(transformDesc::cublasLtMatrixTransformDesc_t)::cublasStatus_t
end

@checked function cublasLtMatrixTransformDescSetAttribute(transformDesc, attr, buf,
                                                          sizeInBytes)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixTransformDescSetAttribute(transformDesc::cublasLtMatrixTransformDesc_t,
                                                                      attr::cublasLtMatrixTransformDescAttributes_t,
                                                                      buf::Ptr{Cvoid},
                                                                      sizeInBytes::Csize_t)::cublasStatus_t
end

@checked function cublasLtMatrixTransformDescGetAttribute(transformDesc, attr, buf,
                                                          sizeInBytes, sizeWritten)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatrixTransformDescGetAttribute(transformDesc::cublasLtMatrixTransformDesc_t,
                                                                      attr::cublasLtMatrixTransformDescAttributes_t,
                                                                      buf::Ptr{Cvoid},
                                                                      sizeInBytes::Csize_t,
                                                                      sizeWritten::Ptr{Csize_t})::cublasStatus_t
end

@cenum cublasLtReductionScheme_t::UInt32 begin
    CUBLASLT_REDUCTION_SCHEME_NONE = 0
    CUBLASLT_REDUCTION_SCHEME_INPLACE = 1
    CUBLASLT_REDUCTION_SCHEME_COMPUTE_TYPE = 2
    CUBLASLT_REDUCTION_SCHEME_OUTPUT_TYPE = 4
    CUBLASLT_REDUCTION_SCHEME_MASK = 7
end

@cenum cublasLtEpilogue_t::UInt32 begin
    CUBLASLT_EPILOGUE_DEFAULT = 1
    CUBLASLT_EPILOGUE_RELU = 2
    CUBLASLT_EPILOGUE_RELU_AUX = 130
    CUBLASLT_EPILOGUE_BIAS = 4
    CUBLASLT_EPILOGUE_RELU_BIAS = 6
    CUBLASLT_EPILOGUE_RELU_AUX_BIAS = 134
    CUBLASLT_EPILOGUE_DRELU = 136
    CUBLASLT_EPILOGUE_DRELU_BGRAD = 152
    CUBLASLT_EPILOGUE_GELU = 32
    CUBLASLT_EPILOGUE_GELU_AUX = 160
    CUBLASLT_EPILOGUE_GELU_BIAS = 36
    CUBLASLT_EPILOGUE_GELU_AUX_BIAS = 164
    CUBLASLT_EPILOGUE_DGELU = 192
    CUBLASLT_EPILOGUE_DGELU_BGRAD = 208
    CUBLASLT_EPILOGUE_BGRADA = 256
    CUBLASLT_EPILOGUE_BGRADB = 512
end

@cenum cublasLtMatmulSearch_t::UInt32 begin
    CUBLASLT_SEARCH_BEST_FIT = 0
    CUBLASLT_SEARCH_LIMITED_BY_ALGO_ID = 1
    CUBLASLT_SEARCH_RESERVED_02 = 2
    CUBLASLT_SEARCH_RESERVED_03 = 3
    CUBLASLT_SEARCH_RESERVED_04 = 4
    CUBLASLT_SEARCH_RESERVED_05 = 5
end

@cenum cublasLtMatmulPreferenceAttributes_t::UInt32 begin
    CUBLASLT_MATMUL_PREF_SEARCH_MODE = 0
    CUBLASLT_MATMUL_PREF_MAX_WORKSPACE_BYTES = 1
    CUBLASLT_MATMUL_PREF_REDUCTION_SCHEME_MASK = 3
    CUBLASLT_MATMUL_PREF_MIN_ALIGNMENT_A_BYTES = 5
    CUBLASLT_MATMUL_PREF_MIN_ALIGNMENT_B_BYTES = 6
    CUBLASLT_MATMUL_PREF_MIN_ALIGNMENT_C_BYTES = 7
    CUBLASLT_MATMUL_PREF_MIN_ALIGNMENT_D_BYTES = 8
    CUBLASLT_MATMUL_PREF_MAX_WAVES_COUNT = 9
    CUBLASLT_MATMUL_PREF_IMPL_MASK = 12
end

@checked function cublasLtMatmulPreferenceInit_internal(pref, size)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulPreferenceInit_internal(pref::cublasLtMatmulPreference_t,
                                                                    size::Csize_t)::cublasStatus_t
end

@checked function cublasLtMatmulPreferenceInit(pref)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulPreferenceInit(pref::cublasLtMatmulPreference_t)::cublasStatus_t
end

@checked function cublasLtMatmulPreferenceCreate(pref)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulPreferenceCreate(pref::Ptr{cublasLtMatmulPreference_t})::cublasStatus_t
end

@checked function cublasLtMatmulPreferenceDestroy(pref)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulPreferenceDestroy(pref::cublasLtMatmulPreference_t)::cublasStatus_t
end

@checked function cublasLtMatmulPreferenceSetAttribute(pref, attr, buf, sizeInBytes)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulPreferenceSetAttribute(pref::cublasLtMatmulPreference_t,
                                                                   attr::cublasLtMatmulPreferenceAttributes_t,
                                                                   buf::Ptr{Cvoid},
                                                                   sizeInBytes::Csize_t)::cublasStatus_t
end

@checked function cublasLtMatmulPreferenceGetAttribute(pref, attr, buf, sizeInBytes,
                                                       sizeWritten)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulPreferenceGetAttribute(pref::cublasLtMatmulPreference_t,
                                                                   attr::cublasLtMatmulPreferenceAttributes_t,
                                                                   buf::Ptr{Cvoid},
                                                                   sizeInBytes::Csize_t,
                                                                   sizeWritten::Ptr{Csize_t})::cublasStatus_t
end

struct cublasLtMatmulHeuristicResult_t
    algo::cublasLtMatmulAlgo_t
    workspaceSize::Csize_t
    state::cublasStatus_t
    wavesCount::Cfloat
    reserved::NTuple{4,Cint}
end

@checked function cublasLtMatmulAlgoGetHeuristic(lightHandle, operationDesc, Adesc, Bdesc,
                                                 Cdesc, Ddesc, preference,
                                                 requestedAlgoCount, heuristicResultsArray,
                                                 returnAlgoCount)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulAlgoGetHeuristic(lightHandle::cublasLtHandle_t,
                                                             operationDesc::cublasLtMatmulDesc_t,
                                                             Adesc::cublasLtMatrixLayout_t,
                                                             Bdesc::cublasLtMatrixLayout_t,
                                                             Cdesc::cublasLtMatrixLayout_t,
                                                             Ddesc::cublasLtMatrixLayout_t,
                                                             preference::cublasLtMatmulPreference_t,
                                                             requestedAlgoCount::Cint,
                                                             heuristicResultsArray::Ptr{cublasLtMatmulHeuristicResult_t},
                                                             returnAlgoCount::Ptr{Cint})::cublasStatus_t
end

@checked function cublasLtMatmulAlgoGetIds(lightHandle, computeType, scaleType, Atype,
                                           Btype, Ctype, Dtype, requestedAlgoCount,
                                           algoIdsArray, returnAlgoCount)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulAlgoGetIds(lightHandle::cublasLtHandle_t,
                                                       computeType::cublasComputeType_t,
                                                       scaleType::cudaDataType_t,
                                                       Atype::cudaDataType_t,
                                                       Btype::cudaDataType_t,
                                                       Ctype::cudaDataType_t,
                                                       Dtype::cudaDataType_t,
                                                       requestedAlgoCount::Cint,
                                                       algoIdsArray::Ptr{Cint},
                                                       returnAlgoCount::Ptr{Cint})::cublasStatus_t
end

@checked function cublasLtMatmulAlgoInit(lightHandle, computeType, scaleType, Atype, Btype,
                                         Ctype, Dtype, algoId, algo)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulAlgoInit(lightHandle::cublasLtHandle_t,
                                                     computeType::cublasComputeType_t,
                                                     scaleType::cudaDataType_t,
                                                     Atype::cudaDataType_t,
                                                     Btype::cudaDataType_t,
                                                     Ctype::cudaDataType_t,
                                                     Dtype::cudaDataType_t, algoId::Cint,
                                                     algo::Ptr{cublasLtMatmulAlgo_t})::cublasStatus_t
end

@checked function cublasLtMatmulAlgoCheck(lightHandle, operationDesc, Adesc, Bdesc, Cdesc,
                                          Ddesc, algo, result)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulAlgoCheck(lightHandle::cublasLtHandle_t,
                                                      operationDesc::cublasLtMatmulDesc_t,
                                                      Adesc::cublasLtMatrixLayout_t,
                                                      Bdesc::cublasLtMatrixLayout_t,
                                                      Cdesc::cublasLtMatrixLayout_t,
                                                      Ddesc::cublasLtMatrixLayout_t,
                                                      algo::Ptr{cublasLtMatmulAlgo_t},
                                                      result::Ptr{cublasLtMatmulHeuristicResult_t})::cublasStatus_t
end

@cenum cublasLtMatmulAlgoCapAttributes_t::UInt32 begin
    CUBLASLT_ALGO_CAP_SPLITK_SUPPORT = 0
    CUBLASLT_ALGO_CAP_REDUCTION_SCHEME_MASK = 1
    CUBLASLT_ALGO_CAP_CTA_SWIZZLING_SUPPORT = 2
    CUBLASLT_ALGO_CAP_STRIDED_BATCH_SUPPORT = 3
    CUBLASLT_ALGO_CAP_OUT_OF_PLACE_RESULT_SUPPORT = 4
    CUBLASLT_ALGO_CAP_UPLO_SUPPORT = 5
    CUBLASLT_ALGO_CAP_TILE_IDS = 6
    CUBLASLT_ALGO_CAP_CUSTOM_OPTION_MAX = 7
    CUBLASLT_ALGO_CAP_CUSTOM_MEMORY_ORDER = 10
    CUBLASLT_ALGO_CAP_POINTER_MODE_MASK = 11
    CUBLASLT_ALGO_CAP_EPILOGUE_MASK = 12
    CUBLASLT_ALGO_CAP_STAGES_IDS = 13
    CUBLASLT_ALGO_CAP_LD_NEGATIVE = 14
    CUBLASLT_ALGO_CAP_NUMERICAL_IMPL_FLAGS = 15
    CUBLASLT_ALGO_CAP_MIN_ALIGNMENT_A_BYTES = 16
    CUBLASLT_ALGO_CAP_MIN_ALIGNMENT_B_BYTES = 17
    CUBLASLT_ALGO_CAP_MIN_ALIGNMENT_C_BYTES = 18
    CUBLASLT_ALGO_CAP_MIN_ALIGNMENT_D_BYTES = 19
    CUBLASLT_ALGO_CAP_ATOMIC_SYNC = 20
end

@checked function cublasLtMatmulAlgoCapGetAttribute(algo, attr, buf, sizeInBytes,
                                                    sizeWritten)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulAlgoCapGetAttribute(algo::Ptr{cublasLtMatmulAlgo_t},
                                                                attr::cublasLtMatmulAlgoCapAttributes_t,
                                                                buf::Ptr{Cvoid},
                                                                sizeInBytes::Csize_t,
                                                                sizeWritten::Ptr{Csize_t})::cublasStatus_t
end

@cenum cublasLtMatmulAlgoConfigAttributes_t::UInt32 begin
    CUBLASLT_ALGO_CONFIG_ID = 0
    CUBLASLT_ALGO_CONFIG_TILE_ID = 1
    CUBLASLT_ALGO_CONFIG_SPLITK_NUM = 2
    CUBLASLT_ALGO_CONFIG_REDUCTION_SCHEME = 3
    CUBLASLT_ALGO_CONFIG_CTA_SWIZZLING = 4
    CUBLASLT_ALGO_CONFIG_CUSTOM_OPTION = 5
    CUBLASLT_ALGO_CONFIG_STAGES_ID = 6
    CUBLASLT_ALGO_CONFIG_INNER_SHAPE_ID = 7
    CUBLASLT_ALGO_CONFIG_CLUSTER_SHAPE_ID = 8
end

@checked function cublasLtMatmulAlgoConfigSetAttribute(algo, attr, buf, sizeInBytes)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulAlgoConfigSetAttribute(algo::Ptr{cublasLtMatmulAlgo_t},
                                                                   attr::cublasLtMatmulAlgoConfigAttributes_t,
                                                                   buf::Ptr{Cvoid},
                                                                   sizeInBytes::Csize_t)::cublasStatus_t
end

@checked function cublasLtMatmulAlgoConfigGetAttribute(algo, attr, buf, sizeInBytes,
                                                       sizeWritten)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtMatmulAlgoConfigGetAttribute(algo::Ptr{cublasLtMatmulAlgo_t},
                                                                   attr::cublasLtMatmulAlgoConfigAttributes_t,
                                                                   buf::Ptr{Cvoid},
                                                                   sizeInBytes::Csize_t,
                                                                   sizeWritten::Ptr{Csize_t})::cublasStatus_t
end

# typedef void ( * cublasLtLoggerCallback_t ) ( int logLevel , const char * functionName , const char * message )
const cublasLtLoggerCallback_t = Ptr{Cvoid}

@checked function cublasLtLoggerSetCallback(callback)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtLoggerSetCallback(callback::cublasLtLoggerCallback_t)::cublasStatus_t
end

@checked function cublasLtLoggerSetFile(file)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtLoggerSetFile(file::Ptr{Libc.FILE})::cublasStatus_t
end

@checked function cublasLtLoggerOpenFile(logFile)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtLoggerOpenFile(logFile::Cstring)::cublasStatus_t
end

@checked function cublasLtLoggerSetLevel(level)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtLoggerSetLevel(level::Cint)::cublasStatus_t
end

@checked function cublasLtLoggerSetMask(mask)
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtLoggerSetMask(mask::Cint)::cublasStatus_t
end

# no prototype is found for this function at cublasLt.h:1841:29, please use with caution
@checked function cublasLtLoggerForceDisable()
    initialize_context()
    @gcsafe_ccall libcublasLt.cublasLtLoggerForceDisable()::cublasStatus_t
end

const CUBLASLT_NUMERICAL_IMPL_FLAGS_FMA = Culonglong(0x01) << 0

const CUBLASLT_NUMERICAL_IMPL_FLAGS_HMMA = Culonglong(0x02) << 0

const CUBLASLT_NUMERICAL_IMPL_FLAGS_IMMA = Culonglong(0x04) << 0

const CUBLASLT_NUMERICAL_IMPL_FLAGS_DMMA = Culonglong(0x08) << 0

const CUBLASLT_NUMERICAL_IMPL_FLAGS_TENSOR_OP_MASK = Culonglong(0xfe) << 0

const CUBLASLT_NUMERICAL_IMPL_FLAGS_OP_TYPE_MASK = Culonglong(0xff) << 0

const CUBLASLT_NUMERICAL_IMPL_FLAGS_ACCUMULATOR_16F = Culonglong(0x01) << 8

const CUBLASLT_NUMERICAL_IMPL_FLAGS_ACCUMULATOR_32F = Culonglong(0x02) << 8

const CUBLASLT_NUMERICAL_IMPL_FLAGS_ACCUMULATOR_64F = Culonglong(0x04) << 8

const CUBLASLT_NUMERICAL_IMPL_FLAGS_ACCUMULATOR_32I = Culonglong(0x08) << 8

const CUBLASLT_NUMERICAL_IMPL_FLAGS_ACCUMULATOR_TYPE_MASK = Culonglong(0xff) << 8

const CUBLASLT_NUMERICAL_IMPL_FLAGS_INPUT_16F = Culonglong(0x01) << 16

const CUBLASLT_NUMERICAL_IMPL_FLAGS_INPUT_16BF = Culonglong(0x02) << 16

const CUBLASLT_NUMERICAL_IMPL_FLAGS_INPUT_TF32 = Culonglong(0x04) << 16

const CUBLASLT_NUMERICAL_IMPL_FLAGS_INPUT_32F = Culonglong(0x08) << 16

const CUBLASLT_NUMERICAL_IMPL_FLAGS_INPUT_64F = Culonglong(0x10) << 16

const CUBLASLT_NUMERICAL_IMPL_FLAGS_INPUT_8I = Culonglong(0x20) << 16

const CUBLASLT_NUMERICAL_IMPL_FLAGS_INPUT_8F_E4M3 = Culonglong(0x40) << 16

const CUBLASLT_NUMERICAL_IMPL_FLAGS_INPUT_8F_E5M2 = Culonglong(0x80) << 16

const CUBLASLT_NUMERICAL_IMPL_FLAGS_OP_INPUT_TYPE_MASK = Culonglong(0xff) << 16

const CUBLASLT_NUMERICAL_IMPL_FLAGS_GAUSSIAN = Culonglong(0x01) << 32
