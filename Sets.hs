module Sets where 
import System.IO ()


main :: IO ()
main = do     
    writeFile "results.txt"  $ concatMap printSet (filter isSet unpackedSets)

data Color = Red | Blue | Green | Black deriving (Enum, Show, Eq)
data Shape = Diamond | Squiggle | Oval deriving (Enum, Show, Eq)
data Shading = Solid | Empty | Striped deriving (Enum, Show, Eq)
data Number = One | Two | Three deriving (Enum, Show, Eq)

data Card = Card { color :: Color, shape :: Shape, shading :: Shading,  number :: Number } deriving (Show)


instance Eq Card where
  Card colorA shapeA shadeA numberA == Card colorB shapeB shadeB numberB =
    colorA == colorB && shapeA == shapeB && shadeA == shadeB && numberA == numberB || 
      colorA /= colorB && shapeA /= shapeB && shadeA /= shadeB && numberA /= numberB


colors :: [Color]
colors = enumFrom Red

shapes :: [Shape]
shapes = enumFrom Diamond

shadings :: [Shading]
shadings = enumFrom Solid

numbers :: [Number]
numbers = enumFrom One 

allCards :: [Card]
allCards = [Card color shape shading number | color <- colors, shape <- shapes, shading <- shadings, number <- numbers]

subset :: Int -> [a] -> [[a]]
subset 0 _ = [[]]
subset _ [] = []
subset n (x:xs) = map (x:) (subset (n-1) xs) ++ subset n xs

possibleSets :: [[[Card]]]
possibleSets =  map (subset 3) $ subset 12 allCards

unpackedSets :: [[Card]]
unpackedSets = unpackSubsets possibleSets

checkSet :: Card -> Card -> Card -> Bool
checkSet a b c = (a == b && b == c) || (a /= b && a /= c && b /= c)

isSet :: [Card] -> Bool
isSet (a:b:c) = checkSet a b $ head c

unpackSubsets :: [[a]] -> [a]
unpackSubsets ([]:xs) = unpackSubsets xs
unpackSubsets [] = []
unpackSubsets ((y:ys):xs) = y : unpackSubsets (ys:xs)

printCard :: Card -> String
printCard a = show (color a) ++ "\n"
            ++ show (shape a) ++ "\n"
            ++ show (shading a) ++ "\n"
            ++ show (number a) ++ "\n"

printSet :: [Card] -> String
printSet (a:b:c) =             "------------------------------------------------------------" 
                    ++ "\n" ++ "|                          SET                             |"
                    ++ "\n" ++ "------------------------------------------------------------" 
                    ++ "\n" ++ "|                   |                   |                  |"
                    ++ "\n" ++ "|                   |                   |                  |" 
                    ++ "\n" ++ "|       " ++ show (color a) ++ "         |       " ++ show (color a) ++ "         |       " ++ show (color (head c)) ++ "        |" 
                    ++ "\n" ++ "|       " ++ show (shape a) ++ "     |       " ++ show (shape b) ++ "     |       " ++ show (shape (head c)) ++"    |" 
                    ++ "\n" ++ "|       " ++ show (shading a) ++ "       |       " ++ show (shading a) ++ "       |       " ++ show (shading (head c)) ++"      |" 
                    ++ "\n" ++ "|       " ++ show (number a) ++ "         |       " ++ show (number b) ++ "         |       " ++ show (number (head c)) ++"      |" 
                    ++ "\n" ++ "|                   |                   |                  |"
                    ++ "\n" ++ "|                   |                   |                  |"
                    ++ "\n" ++ "------------------------------------------------------------" 
                    ++ "\n"
                    
                   


{-
  Card Template 
  ------------------------------------------------
  |                    SET                       |
  ------------------------------------------------
  |             |                |               |
  |             |                |               |
  |             |                |               |
  |             |                |               |
  |             |                |               |
  ------------------------------------------------

-}

{-
-------------------
|                 |
|                 |
|                 |
|                 |
|                 |
-------------------
-}



{-
unpackSubsets [[1,2], [2,3]]
=> 1 : unpackSubsets [[2], [2,3]]
=> 1 : 2 : unpackSubsets [[], [2,3]]
=> 1 : 2 : [] : unpackSubsets [[2,3]]
=> 1 : 2 : 2 : unpackSubsets [[3]]
=> 1 : 2 : 2 : 3 unpackSubsets [[]]
=> 1 : 2 : 2 : 3 : []
=> [1, 2, 2, 3]
-}







    
