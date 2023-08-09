-- Fast Solver

module Solver.Fast where

import Data.List.Extra
import Data.Tree
import Puzzle

solve :: Puzzle -> Maybe Puzzle
solve = findTree isValidPuzzle . possiblePlacements

findTree :: (a -> Bool) -> Tree a -> Maybe a
findTree f (Node x ts)
  | not (f x) = Nothing
  | null ts = Just x
  | otherwise = firstJust id (map (findTree f) ts)

{- Number nodes per level for k = 9 levels
   (9 · 4) · (8 · 4) · (7 · 4) ... ((10 - k) · 4) = 9! · 4^k / (9 - k)!
   k = 0 : root node
   k = 1 : 36 nodes
   k = 2 : 1152 nodes
   k = 3 : 32256 nodes
   k = 4 : 774144 nodes
   ...
-- check nodes per level
numNodes :: Int -> Puzzle -> Int
numNodes n = length . (!! n) . levels . possiblePlacements
-}
possiblePlacements :: Puzzle -> Tree Puzzle
possiblePlacements av = unfoldTree buildNode (av, [])

type Build = ([Tile], Puzzle) -- (available, placed)

buildNode :: Build -> (Puzzle, [Build])
buildNode (as, ns)
  | null as = (ns, [])
  | otherwise = (ns, bs)
  where
    as' = [delete x as | x <- as]
    as'' = concatMap (replicate 4) as'
    avail = concatMap rotations as
    ns' = map (snoc ns) avail
    bs = zip as'' ns'
