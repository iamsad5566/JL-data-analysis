include("formula.jl")
include("parameters.jl")
include("dataProcess.jl")

# 51D-62952 11/30 與 12/12 最低油量對不起來
# 51D-62952 -3
# 51C40916 -1.5
# 51C-546.66 -3
# 50H-06453 -3
# 50H-06422 -3.5

const y1denominator::Float64 = 4095
const x = ["Before", "After"]
p = Parameters()

# cars::Vector{String} = []
# dates::Vector{String} = []
# sticks::Vector{Float64} = []
# sonics::Vector{Float64} = []
# gape::Vector{Float64} = []

#=
========================================================
Ploting by date
=#

# for (car, boxH) in p.height
#     for (date, data) in p.data[car]
#         converse(data[1], data[2], data[3], boxH)
#         draw(data[1], data[2], car, date)
#         # push!(cars, car)
#         # push!(dates, date)
#         # push!(sticks, data[1][2] - data[1][1])
#         # push!(sonics, data[2][2] - data[2][1])
#         # push!(gape, data[1][2] - data[1][1] - data[2][2] + data[2][1])
#     end
# end

#=
========================================================
=#

#=
========================================================
Ploting by car
=#

for (car, boxH) in p.height
    stick::Vector{Vector{Float64}} = []
    sonic::Vector{Vector{Float64}} = []
    dates::Vector{String} = []

    for (date, data) in p.data[car]
        converse(data[1], data[2], data[3], boxH)
        push!(stick, data[1])
        push!(sonic, data[2])
        push!(dates, date)
    end

    dateM::Matrix{String} = reshape(dates, (1, length(p.data[car])))
    drawByCar(stick, car, dateM, "_stick")
    drawByCar(sonic, car, dateM, "_sonic")

end

#=
========================================================
=#


# writeData(cars, dates, sticks, sonics, gape)

# testCar = "50H-06422"
# date = "1207"
# boxH::Float64 = p.height[testCar]

# boxH -= 3.5

# dt = p.data[testCar]
# # dt = p.data[testCar][date]


# for (date, data) in dt
# 	converse(data[1], data[2], data[3], boxH)
# 	plot(x, [data[1] data[2]], title = testCar * "_" * date * "_adjust", linewidth = 3, label = ["stick" "sonic"])
# 	plot!(legend = :outerbottom, legendcolumns = 2)
# 	savefig("adjust/" * testCar * "_" * date * "_adjust.png")
# end

