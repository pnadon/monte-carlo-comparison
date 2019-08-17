include Math
include Random

def findPi(num_samples, trials_per_sample)
    samples = Array.new(num_samples, 0.0)
    mean = 0.0

    sample = 0
    while sample < num_samples
        samples[sample] = integrateCircle(trials_per_sample)
        sample += 1
    end
    mean = samples.sum / samples.size

    return mean, getStdDev(mean, samples)
end

def getStdDev(mean, samples)
    variance = 0

    sample = 0
    while sample < samples.size
        variance += (samples[sample] - mean) * (samples[sample] - mean)
        sample += 1
    end

    Math.sqrt(variance / samples.size)
end

def integrateCircle(points_placed)
    r = Random.new
    counter = 0
    trial = 0
    while trial < points_placed
        y_pos = r.rand
        x_pos = r.rand
        if (y_pos * y_pos + x_pos * x_pos) <= 1
            counter += 1
        end
        trial += 1
    end

    4.0 * counter / points_placed
end

def monteCarlo()
    res = [0.0, 0.0]
    i = 0
    while i < 20
        res1, res2 = findPi(1000, 50000)
        res[0] += res1 / 20.0
        res[1] += res2 / 20.0
        i += 1
    end
    puts(res)
end

monteCarlo()

