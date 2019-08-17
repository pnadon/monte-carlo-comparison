function findPi(num_samples, trials_per_sample) {
    let samples = [];

    for (let sample = 0; sample < num_samples; sample++) {
        samples[sample] = integrateCircle(trials_per_sample);
    }

    const sum: number =  samples.reduce((a, b) => a + b, 0);
    const mean = sum / samples.length;
    const std_dev = getStdDev(mean, samples);
    return [mean, std_dev];
}

function integrateCircle(points_placed) {
    let counter = 0;

    for (let trial = 0; trial < points_placed; trial++) {
        const y_pos = Math.random();
        const x_pos = Math.random();
        if (y_pos * y_pos + x_pos * x_pos <= 1) counter++;
    }

    return 4.0 * counter / points_placed;
}

function getStdDev(mean, samples) {
    let variance = 0;

    for (let sample = 0; sample < samples.length; sample++) {
        variance += (samples[sample] - mean) * (samples[sample] - mean);
    }

    variance /= samples.length;
    return Math.sqrt(variance);
}

let res = [0, 0];
let res1 = 0;
let res2 = 0;
for (let i = 0; i < 20; i++) {
    [res1, res2] = findPi(1000, 50000);
    res[0] += res1 / 20;
    res[1] += res2 / 20;
}

console.log(res);