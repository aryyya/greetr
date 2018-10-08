-- Greetr - Greet someone on the command-line!
-- Compile and execute with:
--   $ ghc greetr.hs -o greetr && ./greetr Jane

module Main where

import System.Environment
import System.Exit

main :: IO ()
main = do
  args <- getArgs
  checkArgs args
  let name = args !! 0
  putStrLn $ greet name

checkArgs :: Foldable t => t a -> IO ()
checkArgs args =
  if (length args) > 0
    then
      return ()
    else do
      putStrLn "  error: not enough arguments"
      putStrLn "  usage: greetr [name]"
      putStrLn "example: greetr Jane"
      exitFailure

greet :: String -> String
greet name = "Hello, " ++ name ++ "!"
