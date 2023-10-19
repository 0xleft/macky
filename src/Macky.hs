{-# OPTIONS_GHC -Wno-unused-do-bind #-}

module Macky (
    change,
    checkMac,
    checkInterface
) where

import System.Process
import Macky.Args
import Text.Regex.TDFA
import System.Exit

change :: Arguments -> IO ()
change args = do
    let new_mac = mac args
    let new_interface = interface args

    isInterfaceValid <- checkInterface new_interface

    if not (checkMac new_mac) then do
        print "Invalid mac address"
        return ()
    else if not isInterfaceValid then do
        print "Invalid interface"
        return ()
    else do
        readProcessWithExitCode "ip" ["link", "set", "dev", new_interface, "address", new_mac] ""
        print "Changed mac address"

checkMac :: String -> Bool
checkMac mac = do
    mac =~ "^([0-9A-Fa-f]{2}:){5}([0-9A-Fa-f]{2})$" :: Bool

checkInterface :: String -> IO Bool
checkInterface interface = do
    (exit_code, _, _) <- readProcessWithExitCode "ip" ["link", "show", interface] ""
    return $ exit_code == ExitSuccess