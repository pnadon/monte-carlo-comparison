import math
import random
from numba import njit
import numpy as np

@njit
def findPi(num_samples, trials_per_sample):
  samples = np.zeros((num_samples))
  mean = 0.0

  for sample in range(num_samples):
    samples[sample] = integrateCircle(trials_per_sample)

  mean = samples.sum() / samples.shape[0]

  std_dev = getStdDev(mean, samples)

  return mean, std_dev

@njit
def getStdDev(mean, samples):
  variance = 0

  for sample in samples:
    variance += (sample - mean) ** 2

  variance /= samples.shape[0]
  return math.sqrt(variance)

@njit
def integrateCircle(points_placed):
  counter = 0

  for trial in range(points_placed):
    y_pos = random.random()
    x_pos = random.random()

    dist = y_pos ** 2 + x_pos ** 2
    if dist <= 1:
      counter += 1

  return 4.0 * counter / points_placed

res = [0, 0]
for i in range(20):
  res1, res2 = findPi(1000, 50000)
  res[0] += res1 / 20
  res[1] += res2 / 20
print(res)
