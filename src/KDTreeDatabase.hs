module KDTreeDatabase (KDTreeDatabase.serve) where

import qualified Data.KdMap.Static as KDM
import Network.MessagePack.Server as MPS
import Data.IORef
import Control.Monad.IO.Class

serve port = do
    tree <- newIORef $ KDM.buildWithDist point3dAsList point3dSquaredDistance []
    MPS.serve port [method "getK" (getK tree), method "build" (build tree),
               method "hello" hello]

getK :: (IORef DBMap) -> Double -> Double -> Double -> Int -> Server [String]
getK ref x y z k = do
    tree <- liftIO $ readIORef ref
    let rs = KDM.kNearest tree k (Point3d x y z)
    return $ map snd rs

build :: IORef DBMap -> [(Double, Double, Double, String)] -> Server Int
build ref xs = do
    let ps = map (\(x,y,z,s) -> (Point3d x y z, s)) xs
    liftIO $ writeIORef ref $ KDM.buildWithDist point3dAsList point3dSquaredDistance ps
    return $ length xs

hello :: String -> Server String
hello s = return $ "Hello kdbase:" ++ s

data Point3d = Point3d { x :: Double
                       , y :: Double
                       , z :: Double
                       } deriving Show

type DBMap = KDM.KdMap Double Point3d String

point3dAsList :: Point3d -> [Double]
point3dAsList (Point3d x y z) = [x, y, z]

point3dSquaredDistance :: Point3d -> Point3d -> Double
point3dSquaredDistance (Point3d x1 y1 z1) (Point3d x2 y2 z2) =
      let dx = x1 - x2
          dy = y1 - y2
          dz = z1 - z2
      in  (abs dx)*(abs x2)  + (abs dy)*(abs y2) + (abs dz)*(abs z2)

