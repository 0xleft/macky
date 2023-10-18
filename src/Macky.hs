module Macky (
    change,
    bruteforce,
    checkMac,
    checkInterface
) where

import System.Process
import Macky.Args
import Text.Regex.TDFA

change :: Arguments -> IO ()
change args = do
    let mac = mac args
    let interface = interface args

    -- check if valid mac
    -- check if valid interface
    if not (checkMac mac) then do
        print "Invalid mac address"
        return ()
    else if not (checkInterface interface) then do
        print "Invalid interface"
        return ()
    else do

    -- "sudo ip link set dev wlan0 address 22:22:22:22:22:22"
    out <- readProcessWithExitCode "ip" ["link", "set", "dev", interface, "address", mac] ""
    print "Changed mac address"

checkMac :: String -> Bool
checkMac mac = do
    mac =~ "^([0-9A-Fa-f]{2}:){5}([0-9A-Fa-f]{2})$" :: Bool

checkInterface :: String -> Bool
checkInterface interface = do
    out <- readProcessWithExitCode "ip" ["link", "show", "dev", interface] ""
    "does not exist" `notElem` out

bruteforce :: Arguments -> IO ()
bruteforce args = do
    print args