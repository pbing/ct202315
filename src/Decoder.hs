-- Decoder

module Decoder where

import Data.Char

decode :: [String] -> String
decode = rot13 . map (chr . read . ("0x"++))

rot13 :: String -> String
rot13 = map go
  where
    go :: Char -> Char
    go c | isAlpha c = chr $ if 'm' >= toLower c then
                         ord c + 13
                       else
                         ord c - 13
         | otherwise = c
