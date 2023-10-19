module Macky.Args (
    Arguments(..),
    parseArguments
) where

import Options.Applicative

data Arguments = Arguments
    { interface :: String
    , mac :: String
    , vendor :: Bool
    , verbose :: Bool
    } deriving (Eq, Show, Read)

parseArguments :: Parser Arguments
parseArguments = Arguments
    <$> parseInterface
    <*> parseMac
    <*> parseVendor
    <*> parseVerbose

parseInterface :: Parser String
parseInterface = strOption
    ( long "interface"
   <> short 'i'
   <> metavar "INTERFACE"
   <> value "wlan0"
   <> help "Interface to change mac address" )

parseMac :: Parser String
parseMac = strOption
    ( long "mac"
   <> short 'm'
   <> metavar "MAC"
   <> value "00:00:00:00:00:00"
   <> help "Mac address to change to" )

parseVendor :: Parser Bool
parseVendor = switch
    ( long "vendor"
   <> short 'v'
   <> help "Show vendor of mac address" )

parseVerbose :: Parser Bool
parseVerbose = switch
    ( long "verbose"
   <> short 'V'
   <> help "Verbose output" )