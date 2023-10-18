import Test.Hspec

import Macky

main :: IO ()
main = hspec $ do
    describe "test checkInterface" $ do
        it "should return true for valid interface" $ do
            isInterfaceValid <- checkInterface "lo" --wsl
            isInterfaceValid `shouldBe` True

        it "should return false for invalid interface" $ do
            isInterfaceValid <- checkInterface "not-an-interface"
            isInterfaceValid `shouldBe` False

    describe "test checkMac" $ do
        it "should correcly recognize mac address using regex" $ do
            checkMac "22:22:22:22:22:22" `shouldBe` True
            checkMac "not-a-mac" `shouldBe` False
            checkMac "22:22:22:22:22:22:22" `shouldBe` False