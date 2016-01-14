import KDTreeDatabase
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Test.QuickCheck.Monadic (assert, monadicIO, run)
import Network.MessagePack.Client
import Control.Monad.IO.Class
import Control.Concurrent

main = putStrLn "not implemented yet"

-- build :: [(Double, Double, Double, String)] -> Client Int
-- build = call "build"

-- getK :: Double -> Double -> Double -> Int -> Client [String]
-- getK = call "getK"

-- port :: Int
-- port = 5001

-- main :: IO ()
-- main = do
--     forkIO $ serve port
--     threadDelay $ 2 * 1000 * 1000
--     hspec $ do
--         describe "search nearest neighbor" $ do
--             it "returns the first element of an *arbitrary* list" $ do            
--                 property $ check


-- check :: [(Double, Double, Double, String)] -> (Double, Double, Double) -> Property
-- check xs (kx, ky, kz) = monadicIO $ do    
--     ret <- run $ do
--         ret <- execClient "127.0.0.1" port $ do
--             _ <- build xs
--             liftIO $ threadDelay $ 1000 * 1000
--             ret <- getK kx ky kz (min 10 (length xs))            
--             liftIO $ print ret
--         return "test"
--     assert $ True
