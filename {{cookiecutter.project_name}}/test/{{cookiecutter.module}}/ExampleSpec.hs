module {{cookiecutter.module}}.ExampleSpec where

import qualified Hedgehog.Gen           as Gen
import qualified Hedgehog.Range         as Range
import           Test.Hspec             (before, describe, hspec, it, shouldBe, Spec)
import           Test.Hspec.Hedgehog    (PropertyT, diff, forAll, hedgehog, (/==), (===))

spec :: Spec
spec = do
  describe "unit tests" $ do
    it "should work" $ do
      True `shouldBe` True
  describe "hedgehog property tests" $ do
    it "should work" $ hedgehog $ do
      x <- forAll $ Gen.integral (Range.linear 0 1000)
      y <- forAll $ Gen.integral (Range.linear 0 5000)
      diff (x + y) (>=) x
