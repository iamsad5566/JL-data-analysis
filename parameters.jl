struct Parameters
    height::Dict{String,Float64}
    data::Dict{String,Dict{String,Vector{Vector{Float64}}}}
    bill::Dict{String,Dict{String,Float64}}

    Parameters() = new(
        Dict("50H-06422" => 39.5, "50H-06453" => 40, "51C-50477" => 42.5, "51C-546.66" => 57, "51C40916" => 58.7, "51D-62952" => 42.5),
        Dict("50H-06422" => Dict("1207" => [[1988, 4095], [18.4, 39.2], [29.4, 29.2]], "1210" => [[1314, 4004], [12.9, 38.4], [36.2, 35]]),
            "50H-06453" => Dict("1207" => [[2226, 4095], [21.6, 39.9], [38.7, 31.9]], "1210" => [[2098, 4095], [20.8, 40.4], [40.7, 37.8]], "1214" => [[1213, 4095], [11.8, 40.3], [37.8, 34]]),
            "51C-50477" => Dict(
                "1129" => [[2082, 3764], [24.6, 42.5], [41.2, 40]],
                "1205" => [[1380, 3820], [16.2, 43.0], [32.8, 35.2]],
                "1208" => [[1514, 3631], [18.0, 39.1], [29, 32.4]],
                "1209" => [[1621, 3750], [19.9, 42.2], [35.5, 35.3]],
                "1212" => [[2768, 3766], [32.0, 42.8], [36.1, 33.6]],
            ),
            "51C40916" => Dict("1130" => [[1369, 3956], [21.3, 59.1], [41.7, 37.6]], "1207" => [[1331, 3813], [20.4, 56.1], [31.6, 33.4]]),
            "51D-62952" => Dict("1128" => [[1220, 3975], [15.7, 42.5], [42.8, 39]], "1130" => [[884, 3962], [9.9, 41.0], [29.2, 29]], "1203" => [[1359, 3990], [15.3, 41.3], [30, 30.8]], "1212" => [[771, 3921], [10.5, 42.4], [41.6, 34.6]]),
            "51C-546.66" => Dict("1130" => [[1823, 3880], [26.6, 55.3], [36.5, 35.5]], "1207" => [[616, 3033], [9.6, 43.0], [29.6, 30.8]], "1221" => [[576, 3268], [8.9, 47.5], [40.3, 38]])),
        Dict("50H-06422" => Dict("1207" => 142, "1210" => 180), "50H-06453" => Dict("1207" => 129, "1210" => 137, "1214" => 198), "51C-50477" => Dict("1129" => 83, "1205" => 123, "1208" => 106, "1209" => 107, "1212" => 50),
            "51C40916" => Dict("1130" => 267, "1207" => 101), "51D-62952" => Dict("1128" => 133, "1130" => 151, "1203" => 125, "1212" => 152),
            "51C-546.66" => Dict("1130" => 202, "1207" => 123, "1221" => 274))
    )

end

#=
Initial: Dict("50H-06422" => 42, "50H-06453" => 42, "51C-50477" => 45, "51C-546.66" => 60, "51C40916" => 60, "51D-62952" => 45)
Adjusted: Dict("50H-06422" => 39.5, "50H-06453" => 40, "51C-50477" => 42.5, "51C-546.66" => 57, "51C40916" => 58.7, "51D-62952" => 42.5)
=#
