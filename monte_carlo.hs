-- https://rosettacode.org/wiki/Monte_Carlo_methods#Haskell
import System.Random
import Control.Monad
 
main = get_pi 50000000
get_pi throws = do results <- replicateM throws one_trial
                   return (4 * fromIntegral (foldl (+) 0 results) / fromIntegral throws)
  where
    one_trial = do rand_x <- randomRIO (-1, 1)
                   rand_y <- randomRIO (-1, 1)
                   let dist :: Double
                       dist = sqrt (rand_x*rand_x + rand_y*rand_y)
                   return (if dist < 1 then 1 else 0)