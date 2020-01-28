package main

import (
	"fmt"
	"math"
	"math/rand"
)

func getStdDev(mean float64, samples []float64) float64 {
	numSamples := len(samples)
	variance := 0.0

	for i := 0; i < numSamples; i++ {
		variance += (samples[i] - mean) * (samples[i] - mean)
	}
	return math.Sqrt(variance / float64(numSamples))
}

func integrateCircle(pointsPlaced int) float64 {
	counter := 0

	for i := 0; i < pointsPlaced; i++ {
		yPos := rand.Float64()
		xPos := rand.Float64()

		if yPos*yPos+xPos*xPos <= 1.0 {
			counter++
		}
	}

	return 4.0 * float64(counter) / float64(pointsPlaced)
}

func findPi(numSamples int, trialsPerSample int) (float64, float64) {
	samples := make([]float64, numSamples)
	mean := 0.0

	for sample := 0; sample < numSamples; sample++ {
		samples[sample] = integrateCircle(trialsPerSample)
		mean += samples[sample] / float64(numSamples)
	}

	stdDev := getStdDev(mean, samples)

	return mean, stdDev
}

func main() {
	resMean := 0.0
	resStdDev := 0.0
	for i := 0; i < 20; i++ {
		mean, stdDev := findPi(1000, 50000)
		resMean += mean
		resStdDev += stdDev
	}
	resMean /= 20.0
	resStdDev /= 20.0
	fmt.Println(resMean, resStdDev)
}
