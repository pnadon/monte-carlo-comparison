function findPi(num_samples, trials_per_sample)
  samples = Array{Float64}(undef, num_samples)
  mean = 0.0

  for sample = 1:num_samples
    samples[sample] = integrateCircle(trials_per_sample)
  end

  mean = sum(samples) / size(samples)[1]

  std_dev = getStdDev(mean, samples)

  return mean, std_dev
end

function getStdDev(mean, samples)
  variance = 0

  for sample in samples
    variance += (sample - mean) ^ 2
  end

  variance /= size(samples)[1]
  return sqrt(variance)
end

function integrateCircle(points_placed)
  counter = 0

  for trial = 1:points_placed
    y_pos = rand()
    x_pos = rand()

    dist = y_pos ^ 2 + x_pos ^ 2
    if dist <= 1
      counter += 1
    end
  end

  return 4.0 * counter / points_placed
end

function monte_carlo()
  res = [0.0, 0.0]
  for i in 1:20
    res1, res2 = findPi(1000, 50000)
    res[1] += res1 / 20.0
    res[2] += res2 / 20.0
  end
  print(res)
end
