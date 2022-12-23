using CSV
using DataFrames
using Plots

function draw(stick::Vector{Float64}, sonic::Vector{Float64}, car::String, date::String)
    plot(x, xlabel="before & after", [stick sonic], color=[:red :green], ylabel="oil percentage", title=car * "_" * date, linewidth=3, label=["stick" "sonic"])
    plot!(lengend=:outerbottom, legendcolumns=2)
    savefig("./" * car * "_" * date * ".png")
end

function drawByCar(heights::Vector{Vector{Float64}}, car::String, date::Matrix{String}, no::String)
    plot(x, xlabel="before & after", heights, ylabel="oil percentage", title=car, linewidth=3, label=date)
    plot!(lengend=:outerbottom, legendcolumns=length(date))
    savefig("byCar/" * car * no * ".png")
end


function writeData(columnCar::Vector{String}, columnDate::Vector{String}, columnStickSlope::Vector{Float64}, columnSonicSlope::Vector{Float64}, columnGape::Vector{Float64})
    df = DataFrame(Car=columnCar, Date=columnDate, Stick=columnStickSlope, Sonic=columnSonicSlope, Gape=columnGape)
    CSV.write("./slope.csv", df)
end
