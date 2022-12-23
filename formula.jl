const stickCell::Float64 = 4095

function converse(stickV::Vector{Float64}, sonicH::Vector{Float64}, temperature::Vector{Float64}, boxH::Float64)
	newTemp = tempReconstruct(temperature)
	correct(newTemp, sonicH)
	toPercentage(stickV, sonicH, boxH)
end

function tempReconstruct(temp::Vector{Float64})::Vector{Float64}
	newTemp = [getCorrectionCoeffiction(temp[1]), getCorrectionCoeffiction(temp[2])]
	return newTemp
end

function getCorrectionCoeffiction(temperature::Float64)::Float64
	correctionCoefficient::Float64 = 1
	if 20 <= temperature < 31.1
		correctionCoefficient = 1.031 - (1.031 - 1) / 11.1 * (temperature - 20 == 0 ? 1 : temperature - 20)
	elseif 31 <= temperature < 35.7
		correctionCoefficient = 1 - (1 - 0.979) / 4.6 * (temperature - 31 == 0 ? 1 : temperature - 31)
	elseif 35.7 <= temperature < 54.6
		correctionCoefficient =
			0.979 - (0.979 - 0.872) / 18.9 * (temperature - 35.7 == 0 ? 1 : temperature - 35.7)
	elseif 54.6 <= temperature < 80
		correctionCoefficient =
			0.872 - (0.872 - 0.830) / 25.4 * (temperature - 54.6 == 0 ? 1 : temperature - 54.6)
	end
	return correctionCoefficient
end

function correct(tempCoeffiction::Vector{Float64}, sonicHeight::Vector{Float64})
	tempCoeffiction[1] *= sonicHeight[1]
	tempCoeffiction[2] *= sonicHeight[2]
end

function toPercentage(stickVolt::Vector{Float64}, sonicHeight::Vector{Float64}, boxHeight::Float64)
	for i in 1:length(stickVolt)
		global stickVolt[i] /= stickCell
	end

	for j in 1:length(sonicHeight)
		global sonicHeight[j] /= boxHeight
	end
end
