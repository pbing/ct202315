-- c't 15/2023, pp. 74
{-# OPTIONS_GHC -Wno-unused-imports #-}

module Main where

import Solver (solve, Puzzle)
import Decoder (decode)

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
  print (solve puzzleInput)
  -- print (decode solution)
