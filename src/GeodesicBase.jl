module GeodesicBase

include("metric-params.jl")

# contains the full metric components (this type needed for DiffGeoSymbolics)
abstract type AbstractMetric{T} <: AbstractMatrix{T} end

abstract type AbstractGeodesicParams{M,T} end 

metric_params(m::AbstractMetric{T}) where {T} = error("Not implemented for metric $(typeof(m))")

export AbstractMetricParams, AbstractGeodesicParams, metric_params


end # module
