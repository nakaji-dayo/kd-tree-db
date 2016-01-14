module Main where

import KDTreeDatabase
import System.Environment

main :: IO ()
main = do
    port:_ <- getArgs
    serve $ read port

