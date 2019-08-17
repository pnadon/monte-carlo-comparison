/*
 * Main.java
 *
 * Philippe Nadon
 * April 1, 2018
 *
 * modified April 10, 2018 - added alternative Buffon's needle method
 *
 * Uses Monte Carlo methods to obtain calculated results
 * See PresentationExamples.java for the methods themselves
 */


import java.util.Random;
import java.util.Arrays;

public class MonteCarlo {

  public static void main(String[] args) {
    double[] res = {0, 0};
    for (int i = 0; i < 20; i++) {
      double[] pi_res = findPi(1000, 50000);
      res[0] += pi_res[0] / 20;
      res[1] += pi_res[1] / 20;
    }
    System.out.println(Arrays.toString(res));
  }

  private static double[] findPi(int num_samples, int trials_per_sample){

    double[] samples = new double[num_samples];
    double mean = 0;

    for( int sample = 0; sample < num_samples; sample++){
      samples[sample] = integrateCircle(trials_per_sample);
      mean = mean + samples[sample] / (double)num_samples;
    }

    double std_dev = getStdDev( mean, samples);

    double[] res = new double[2];
    res[0] = mean;
    res[1] = std_dev;

    return res;
  }

  private static double integrateCircle(int points_placed) {
    Random rand = new Random();
    int counter = 0;

    for (int trial = 0; trial < points_placed; trial++) {

      double yPos = rand.nextDouble();
      double xPos = rand.nextDouble();

      if (yPos * yPos + xPos * xPos <= 1)
        counter++;
    }

    return (4.0 * ((double) counter / (double) points_placed));
  }

  private static double getStdDev(double mean, double[] samples) {

    int num_samples = samples.length;
    double variance = 0;

    for (double sample : samples)
      variance += (sample - mean) * (sample - mean);

    variance =  variance / (double) num_samples;
    return Math.sqrt( variance);
  }
}
