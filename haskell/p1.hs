sumar :: IO Int
sumar = do
    putStr"Escribe primer numero: "
    n1 <- getLine
    putStr"Escribe primer numero: "
    n2 <- getLine
    return ((read n1 :: Int) + (read n2 :: Int))
