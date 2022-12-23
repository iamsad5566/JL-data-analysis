include("formula.jl")
include("parameters.jl")
include("dataProcess.jl")

# 51D-62952 11/30 與 12/12 最低油量對不起來

const y1denominator::Float64 = 4095
const x = ["Before", "After"]
p = Parameters()

cars::Vector{String} = []
dates::Vector{String} = []
sticks::Vector{Float64} = []
sonics::Vector{Float64} = []
gape::Vector{Float64} = []

for (car, boxH) in p.height
	for (date, data) in p.data[car]
		converse(data[1], data[2], data[3], boxH)
		draw(data[1], data[2], car, date)
		# push!(cars, car)
		# push!(dates, date)
		# push!(sticks, data[1][2] - data[1][1])
		# push!(sonics, data[2][2] - data[2][1])
		# push!(gape, data[1][2] - data[1][1] - data[2][2] + data[2][1])
	end
end

# writeData(cars, dates, sticks, sonics, gape)

# testCar = "51D-62952"
# boxH::Float64 = p.height[testCar]

# boxH -= 3

# dt = p.data[testCar]

# for (date, data) in dt
# 	converse(data[1], data[2], data[3], boxH)
# 	plot(x, [data[1] data[2]], title = testCar * "_" * date * "_adjust", linewidth = 3, label = ["stick" "sonic"])
# 	plot!(legend = :outerbottom, legendcolumns = 2)
# 	savefig("adjust/" * testCar * "_" * date * "_adjust.png")
# end
