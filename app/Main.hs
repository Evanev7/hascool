module Main where

import System.Directory (getHomeDirectory)

main :: IO ()
main = do
        directory <- getHomeDirectory
        putStrLn directory
