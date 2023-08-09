-- c't 15/2023, pp. 74

module Main where

import System.Environment
import Decoder (decode)
import Puzzle (Puzzle)
import qualified Solver.Fast as Fast (solve)
import qualified Solver.Slow as Slow (solve)

-- see "doc/3x3_ra_tsel_final.pdf"
puzzleInput :: Puzzle
puzzleInput = [[1, -1, -2, 3], [4, -4, -3, 3], [-4, 1, 4, -3],
               [-2, 1, 1, -3], [4, -2, -2, 3], [-2, 2, 3, -4],
               [4, -1, -3, 1], [2, -2, -4, 4], [3, -1, -3, 2]]

solution :: [String]
solution = ["51", "76", "72", "59", "62", "72",
            "66", "68", "61", "74", "3a", "41",
            "52", "48", "5a", "42", "41", "51"]

main :: IO ()
main = do
  progName <- getProgName
  args <- getArgs
  let usage = putStrLn ("Usage: " ++ progName ++ " { slow | fast | decode }")
  if null args
    then usage
    else case head args of
      "slow" -> print (Slow.solve puzzleInput)
      "fast" -> print (Fast.solve puzzleInput)
      "decode" -> print (decode solution)
      _ -> usage
