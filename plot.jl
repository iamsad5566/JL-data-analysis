include("formula.jl")
include("parameters.jl")
include("dataProcess.jl")

# 51D-62952 11/30 與 12/12 最低油量對不起來
# 51D-62952 -2.5
# 51C40916 -1.3
# 51C-546.66 -3
# 50H-06453 -2
# 50H-06422 -2.5
# 51D-62952 -3.5
# 51C-50477 -2.5

const y1denominator::Float64 = 4095
const x = ["Before", "After"]
p = Parameters()

#=
========================================================
Ploting by car and date for x axis
=#

for (car, boxH) in p.height
	xAxis::Vector{String} = []
	stickSlope::Vector{Float64} = []
	sonicSlope::Vector{Float64} = []

	for (date, data) in p.data[car]
		push!(xAxis, date)
		converse(data[1], data[2], data[3], boxH)
		push!(stickSlope, data[1][2] - data[1][1])
		push!(sonicSlope, data[2][2] - data[2][1])
	end

	plot(xAxis, xlabel = "Dates", [stickSlope sonicSlope], ylabel = "percentage change", ylims = (0, 1.0), yticks = 0:0.05:1, grid = true, title = car, color = [:red :green], linewidth = 3, label = ["stick" "sonic"])
	plot!(lengend = :outerbottom, legendcolumns = 2)
	savefig("line_chart/" * car * ".png")
end


#=
========================================================
Ploting by date
=#

# for (car, boxH) in p.height
# 	for (date, data) in p.data[car]
# 		converse(data[1], data[2], data[3], boxH)
# 		draw(data[1], data[2], car, date)
# 	end
# end

#=
========================================================
Exporting CSV
=#

# cars::Vector{String} = []
# dates::Vector{String} = []
# sticks::Vector{Float64} = []
# sonics::Vector{Float64} = []
# gape::Vector{Float64} = []

# for (car, boxH) in p.height
# 	for (date, data) in p.data[car]
# 		converse(data[1], data[2], data[3], boxH)
# 		push!(cars, car)
# 		push!(dates, date)
# 		push!(sticks, data[1][2] - data[1][1])
# 		push!(sonics, data[2][2] - data[2][1])
# 		push!(gape, data[1][2] - data[1][1] - data[2][2] + data[2][1])
# 	end
# end
# writeData(cars, dates, sticks, sonics, gape)

#=
========================================================
Ploting by car
=#

# for (car, boxH) in p.height
# 	stick::Vector{Vector{Float64}} = []
# 	sonic::Vector{Vector{Float64}} = []
# 	dates::Vector{String} = []

# 	for (date, data) in p.data[car]
# 		converse(data[1], data[2], data[3], boxH)
# 		push!(stick, data[1])
# 		push!(sonic, data[2])
# 		push!(dates, date)
# 	end

# 	dateM::Matrix{String} = reshape(dates, (1, length(p.data[car])))
# 	drawByCar(stick, car, dateM, "_stick")
# 	drawByCar(sonic, car, dateM, "_sonic")

# end

#=
========================================================
Adjust
=#

testCar = "51C-50477"
boxH::Float64 = p.height[testCar]

boxH -= 2.5

dt = p.data[testCar]


for (date, data) in dt
	converse(data[1], data[2], data[3], boxH)
	plot(x, [data[1] data[2]], title = testCar * "_" * date * "_adjust", linewidth = 3, label = ["stick" "sonic"])
	plot!(legend = :outerbottom, legendcolumns = 2)
	savefig("adjust/" * testCar * "_" * date * "_adjust.png")
end

