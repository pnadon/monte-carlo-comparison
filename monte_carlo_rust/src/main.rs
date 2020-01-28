use rand::prelude::*;

fn integrate_circle(points_placed: i64) -> f64 {
  let mut counter = 0;
  let mut rng = rand::thread_rng();
  let mut y_pos: f64;
  let mut x_pos: f64;

  for _trial in 0..points_placed {
    y_pos = rng.gen();
    x_pos = rng.gen();

    if y_pos * y_pos + x_pos * x_pos <= 1.0 {
      counter += 1;
    }
  }
  4.0 * (counter as f64) / (points_placed as f64)
}

fn get_std_dev(mean: f64, samples: Vec<f64>) -> f64 {
  let num_samples: i64 = samples.len() as i64;
  let variance: f64 = samples.iter()
    .fold(0.0, |acc, sample| acc + (sample - mean) * (sample - mean));

  (variance / (num_samples as f64)).sqrt()
}

fn find_pi(num_samples: i64, trials_per_sample: i64) -> (f64, f64) {
  let samples: Vec<f64> = (0..num_samples).map(|_| integrate_circle(trials_per_sample)).collect();
  let mean: f64 = samples.iter().sum::<f64>() / (num_samples as f64);
  
  (mean, get_std_dev(mean, samples))
}

fn main() {
  let mut res = (0.0, 0.0);
  for _i in 0..20 {
    let pi_res = find_pi(1000, 50000);
    res.0 += pi_res.0;
    res.1 += pi_res.1;
  }
  res.0 /= 20.0;
  res.1 /= 20.0;

  println!("{} {}", res.0, res.1);
}