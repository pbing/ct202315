-- Puzzle solver

module Solver where

import Data.List

-- Brute force solution
solve :: Puzzle -> Maybe Puzzle
solve = find isValidPuzzle . concatMap rotateTiles . permutations

type Edge = Int

-- Edge        : [north, east, south, west]
-- convex      : positve
-- concave     : negative
-- round       : 1
-- triangular  : 2
-- rectangular : 3
-- trapezoid   : 4
type Tile = [Edge]

type Puzzle = [Tile]

isFitEdge :: Edge -> Edge -> Bool
isFitEdge e1 e2 = e1 + e2 == 0

isValidPuzzle :: Puzzle -> Bool
isValidPuzzle xs =
  -- 1st row
  east x00 `isFitEdge` west x01 &&
  east x01 `isFitEdge` west x02  &&
  -- 2nd row
  east x10 `isFitEdge` west x11 &&
  east x11 `isFitEdge` west x12 &&
  -- 3rd row
  east x20 `isFitEdge` west x21  &&
  east x21 `isFitEdge` west x22  &&
  -- 1st col
  south x00 `isFitEdge` north x10 &&
  south x10 `isFitEdge` north x20 &&
  -- 2nd col
  south x01 `isFitEdge` north x11 &&
  south x11 `isFitEdge` north x21 &&
  -- 3rd col
  south x02 `isFitEdge` north x12 &&
  south x12 `isFitEdge` north x22
  where
    x00 = head xs
    x01 = xs !! 1
    x02 = xs !! 2
    x10 = xs !! 3
    x11 = xs !! 4
    x12 = xs !! 5
    x20 = xs !! 6
    x21 = xs !! 7
    x22 = xs !! 8
    north = head
    east = (!! 1)
    south = (!! 2)
    west = (!! 3)

rotate :: Int -> Tile -> Tile
rotate n = take 4 . drop n . cycle

rotateTiles :: Puzzle -> [Puzzle]
rotateTiles [x00, x01, x02, x10, x11, x12, x20, x21, x22] =
  [[rotate a x00,
    rotate b x01,
    rotate c x02,
    rotate d x10,
    rotate e x11,
    rotate f x12,
    rotate g x20,
    rotate h x21,
    rotate i x22]
  | a <- [0..3],
    b <- [0..3],
    c <- [0..3],
    d <- [0..3],
    e <- [0..3],
    f <- [0..3],
    g <- [0..3],
    h <- [0..3],
    i <- [0..3]]
rotateTiles _ = undefined
