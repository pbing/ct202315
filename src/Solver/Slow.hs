-- Puzzle solver

module Solver.Slow where

import Data.List
import Puzzle

-- Brute force solution
solve :: Puzzle -> Maybe Puzzle
solve = find isValidPuzzle . possiblePlacements 

possiblePlacements :: Puzzle -> [Puzzle]
possiblePlacements = concatMap rotateTiles . permutations

rotateTiles :: Puzzle -> [Puzzle]
rotateTiles [x00, x01, x02, x10, x11, x12, x20, x21, x22] =
  [ [ rotate a x00,
      rotate b x01,
      rotate c x02,
      rotate d x10,
      rotate e x11,
      rotate f x12,
      rotate g x20,
      rotate h x21,
      rotate i x22
    ]
    | a <- [0 .. 3],
      b <- [0 .. 3],
      c <- [0 .. 3],
      d <- [0 .. 3],
      e <- [0 .. 3],
      f <- [0 .. 3],
      g <- [0 .. 3],
      h <- [0 .. 3],
      i <- [0 .. 3]
  ]
rotateTiles _ = undefined
