
# both energy and angular momentum 
# assume time only coupled to radial coordinate
# need to think of a nice way to keep this efficient
# whilst allowing metrics with other couplings

function E(m::AbstractMatrix{T}, v) where {T}
    @inbounds metric[1, 1] * v[1] + metric[1, 4] * v[4]
end


"""
    Lz(m::AbstractMetricParams{T}, v)

Compute the angular momentum for a 
"""
function Lz(m::AbstractMatrix{T}, v) where {T}
    @inbounds -metric[4,4] * v[4] - metric[1,4] * v[1]
end