function correction(temperature::Float32)
    correctionCoefficient::Float32=1
    if 20 <= temperature < 31.1
        correctionCoefficient = 1.031 - (1.031 - 1) / 11.1 * (temperature - 20 == 0 ? 1 : temperature - 20)
    elseif 31 <= temperature < 35.7
        correctionCoefficient = 1 - (1 - 0.979) / 4.6 * (temperature - 31 == 0 ? 1 : temperature - 31)
    elseif 35.7 <= temperature < 54.6
        correctionCoefficient =
                0.979 - (0.979 - 0.872) / 18.9 *  (temperature - 35.7 == 0 ? 1 : temperature - 35.7)
    elseif 54.6 <= temperature < 80
        correctionCoefficient =
                0.872 - (0.872 - 0.830) / 25.4 * (temperature - 54.6 == 0 ? 1 : temperature - 54.6)
    end
    return correctionCoefficient
end