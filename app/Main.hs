module Main (
	main
) where

import Macky
import Macky.Args
import Options.Applicative

main :: IO ()
main = start =<< execParser opts
  	where
    opts = info (parseArguments <**> helper)
      ( fullDesc
     <> progDesc "A mac address tool for linux"
     <> header "" )

start :: Arguments -> IO ()
start args = do
	change args