using Plots

include("formula.jl")
include("parameters.jl")

# 


p = Parameters()
print(p.height, p.data["50H-06422"]["1207"][1])

# const y1denominator::Float64 = 4095
# data = Dict(
#     "51C-546.66" => [[Dict("y1" => [1130, 1823, 3880]), Dict("y2" => [1130,])], [Dict("y1" => [1207, 614, 3046])]]
# )




# const y2denominator::Float64 = 41.0
# car::String = "50H-06453_1214tt"


# x = ["Before", "After"]

# y1 = [1213.0, 4095.0]
# y2 = [11.8, 40.5]

# function dataPrecess(y1::Vector{Float64}, y2::Vector{Float64})
#     for i in 1:length(y1)
#         y1[i] /= y1denominator
#     end

#     for i in 1:length(y2)
#         y2[i] /= y2denominator
#     end
# end

# dataPrecess(y1, y2)

# plot(x, [y1 y2], title=car, linewidth=3, label=["stick" "sonic"])
# plot!(legend=:outerbottom, legendcolumns=3)

# savefig("./" * car * ".png")
