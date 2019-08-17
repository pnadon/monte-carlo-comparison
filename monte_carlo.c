#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double integrateCircle(int points_placed) {
    int counter = 0;

    for (int trial = 0; trial < points_placed; trial++) {

        double yPos = (double) rand() / (RAND_MAX);
        double xPos = (double) rand() / (RAND_MAX);
        if ((yPos * yPos + xPos * xPos) <= 1)
            counter++;
    }

    return (4.0 * ((double) counter / (double) points_placed));
}

double getStdDev(double mean, double samples[], int num_samples) {
    double variance = 0;

    for (int sample = 0; sample < num_samples; sample++)
        variance += (samples[sample] - mean) * (samples[sample] - mean);

    variance =  variance / (double) num_samples;
    return sqrt(variance);
}

void findPi(int num_samples, int trials_per_sample, double res[]){

    double samples[num_samples];
    double mean = 0;

    for( int sample = 0; sample < num_samples; sample++){
        samples[sample] = integrateCircle(trials_per_sample);
        mean = mean + samples[sample] / (double)num_samples;
    }

    double std_dev = getStdDev( mean, samples, num_samples);

    res[0] = mean;
    res[1] = std_dev;
}

void main(void) {
    double res[2] = {0, 0};
    double pi_res[2] = {0, 0};
    for (int i = 0; i < 20; i++) {
        findPi(1000, 50000, pi_res);
        res[0] += pi_res[0] / 20;
        res[1] += pi_res[1] / 20;
    }
    printf("%lf %lf\n", res[0], res[1]);
}
