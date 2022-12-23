using CSV
using DataFrames

function draw(stick::Vector{Float64}, sonic::Vector{Float64}, car::String, date::String)
	plot(x, xlabel="before & after", [stick sonic], ylabel = "oil percentage", title = car * "_" * date, linewidth = 3, label = ["stick" "sonic"])
	plot!(lengend = :outerbottom, legendcolumns = 2)
	savefig("./" * car * "_" * date * ".png")
end

function writeData(columnCar::Vector{String}, columnDate::Vector{String}, columnStickSlope::Vector{Float64}, columnSonicSlope::Vector{Float64}, columnGape::Vector{Float64})
	df = DataFrame(Car = columnCar, Date = columnDate, Stick = columnStickSlope, Sonic = columnSonicSlope, Gape = columnGape)
	CSV.write("./slope.csv", df)
end
