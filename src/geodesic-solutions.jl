abstract type AbstractGeodesic{T} end

@with_kw struct GeodesicPoint{T,P} <: AbstractGeodesic{T}
    u::AbstractVector{T}
    v::AbstractVector{T}
    t::T
    p::P
end

# TODO: GeodesicPath structure for the full geodesic path
# do we want to support this?

function unpack_solution(sol::SciMLBase.AbstractODESolution{T,N,S}) where {T,N,S}
    u = sol.u
    p = sol.prob.p
    t = sol.t
    (u, t, p)
end

function unpack_solution(simsol::SciMLBase.AbstractEnsembleSolution{T,N,V}) where {T,N,V}
    map(unpack_solution, simsol)
end

function get_endpoint(m::AbstractMetricParams{T}, sol::SciMLBase.AbstractODESolution{T,N,S}) where {T,N,S}
    us, ts, p = unpack_solution(sol)
    u = us[end].x[2]
    v = us[end].x[1]
    t = ts[end]
    GeodesicPoint(u, v, t, p)
end

function get_endpoint(m::AbstractMetricParams{T}, simsol::SciMLBase.AbstractEnsembleSolution{T,N,S}) where {T,N,S}
    map(sol -> get_endpoint(m, sol), simsol)
end

export get_endpoint, GeodesicPoint