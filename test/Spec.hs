import Test.Hspec

import Macky

main :: IO ()
main = hspec $ do
    describe "test checkInterface" $ do
        it "should return false for first and true for second interface" $ do
            checkInterface "wlan0" `shouldBe` True
            checkInterface "non-existant-interface" `shouldBe` False
    
    describe "test checkMac" $ do
        it "should correcly recognize mac address using regex" $ do
            checkMac "22:22:22:22:22:22" `shouldBe` True
            checkMac "not-a-mac" `shouldBe` False
            checkMac "22:22:22:22:22:22:22" `shouldBe` False