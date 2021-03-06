module GeodesicBase

import Parameters: @with_kw
import SciMLBase

include("metric-params.jl")
include("physical-quantities.jl")
include("geodesic-solutions.jl")

export AbstractMetricParams, metric_params, metric


end # module
