-- Puzzle definitions

module Puzzle where

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

north, east, west, south :: Tile -> Edge
north = head
east = (!! 1)
south = (!! 2)
west = (!! 3)

isFitEdge :: Edge -> Edge -> Bool
isFitEdge e1 e2 = e1 + e2 == 0

rotate :: Int -> Tile -> Tile
rotate n = take 4 . drop n . cycle

rotations :: Tile -> [Tile]
rotations x = [rotate n x | n <- [0 .. 3]]

isValidPuzzle :: Puzzle -> Bool
isValidPuzzle [] = True
isValidPuzzle [_] = True
isValidPuzzle [x00, x01] =
  -- 1st row
  east x00 `isFitEdge` west x01
isValidPuzzle [x00, x01, x02] =
  -- 1st row
  east x00 `isFitEdge` west x01 &&
  east x01 `isFitEdge` west x02
isValidPuzzle [x00, x01, x02, x10] =
  -- 1st row
  east x00 `isFitEdge` west x01 &&
  east x01 `isFitEdge` west x02  &&
  -- 1st col
  south x00 `isFitEdge` north x10
isValidPuzzle [x00, x01, x02, x10, x11] =
  -- 1st row
  east x00 `isFitEdge` west x01 &&
  east x01 `isFitEdge` west x02  &&
  -- 2nd row
  east x10 `isFitEdge` west x11 &&
  -- 1st col
  south x00 `isFitEdge` north x10 &&
  -- 2nd col
  south x01 `isFitEdge` north x11
isValidPuzzle [x00, x01, x02, x10, x11, x12] =
  -- 1st row
  east x00 `isFitEdge` west x01 &&
  east x01 `isFitEdge` west x02  &&
  -- 2nd row
  east x10 `isFitEdge` west x11 &&
  east x11 `isFitEdge` west x12 &&
  -- 1st col
  south x00 `isFitEdge` north x10 &&
  -- 2nd col
  south x01 `isFitEdge` north x11 &&
  -- 3rd col
  south x02 `isFitEdge` north x12
isValidPuzzle [x00, x01, x02, x10, x11, x12, x20] =
  -- 1st row
  east x00 `isFitEdge` west x01 &&
  east x01 `isFitEdge` west x02  &&
  -- 2nd row
  east x10 `isFitEdge` west x11 &&
  east x11 `isFitEdge` west x12 &&
  -- 1st col
  south x00 `isFitEdge` north x10 &&
  south x10 `isFitEdge` north x20 &&
  -- 2nd col
  south x01 `isFitEdge` north x11 &&
  -- 3rd col
  south x02 `isFitEdge` north x12
isValidPuzzle [x00, x01, x02, x10, x11, x12, x20, x21] =
  -- 1st row
  east x00 `isFitEdge` west x01 &&
  east x01 `isFitEdge` west x02  &&
  -- 2nd row
  east x10 `isFitEdge` west x11 &&
  east x11 `isFitEdge` west x12 &&
  -- 3rd row
  east x20 `isFitEdge` west x21  &&
  -- 1st col
  south x00 `isFitEdge` north x10 &&
  south x10 `isFitEdge` north x20 &&
  -- 2nd col
  south x01 `isFitEdge` north x11 &&
  south x11 `isFitEdge` north x21 &&
  -- 3rd col
  south x02 `isFitEdge` north x12
isValidPuzzle [x00, x01, x02, x10, x11, x12, x20, x21, x22] =
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
isValidPuzzle _ = False
