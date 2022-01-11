"""
    abstract type AbstractMetricParams{T} end

Abstract type used to dispatch different geodesic problems.
"""
abstract type AbstractMetricParams{T} end


"""
    geodesic_eq(m::AbstractMetricParams{T})

Return components of the geodesic equation for the metric described by `m`.
"""
geodesic_eq(m::AbstractMetricParams{T}) = error("Not implemented for metric parameters $(typeof(m))")


"""
    constrain(m::AbstractMetricParams{T}, u, v; μ=0.0)

Give time component which would constrain a velocity vector `v` at position `x` to be a
geodesic with mass `μ`.
"""
constrain(m::AbstractMetricParams{T}, u, v; μ=0.0) = error("Not implemented for metric parameters $(typeof(m))")


"""
    on_chart(m::AbstractMetricParams{T}, u::AbstractVector)

Check if point `u` is a valid point for the metric described by `m`.

Returns false is `u` is a singularity.
"""
on_chart(m::AbstractMetricParams{T}, u) = error("Not implemented for metric parameters $(typeof(m))")


"""
    metric_type(m::AbstractMetricParams{T})

Return the [`AbstractMetric`](@ref) type associated with the metric parameters `m`.
"""
metric_type(m::AbstractMetricParams{T}) = error("Not implemented for metric parameters $(typeof(m))")
