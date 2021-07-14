import Data.Char

{--Data definitions--}
data Respuesta = Digito Int | Palabra String
data MenuOption = Op1 | Op2 | Op3

{--Main question--}
ask  = "¿Qué te gustaría conocer más?"

{--Main menu--}
menu  = ["1. Proceso de inscripción a cursos", "2. Beneficios de Coursera + MinTIC", "3. Listado de cursos"]

{--Print the menu--}
printMenu :: Int -> IO ()
printMenu i = do
    if(i < length menu)
        then do
            if(i == 0)
                then do
                    putStrLn ask
                    putStrLn ""
                    putStrLn (menu !! i)
                    printMenu (i + 1)

            else do
                putStrLn (menu !! i)
                printMenu (i + 1)

    else putStrLn ""

{--Recursive function to get a matching word in the menu--}
matchWord :: Int -> String -> [String] -> IO ()
matchWord i strM a = do
    if(i < length a)
        then do
            if(strM == (a !! i))
                then do
                    let (_:ys, wmenu) = splitAt 1 (words (menu !! i))
                    let q = unwords wmenu
                    putStrLn q
                else matchWord (i + 1) strM a
            else putStrLn "No se ha encontrado ninguna palabra!"


{-- Match a given keyword in the menu --}
match :: Int -> String -> [String] -> IO ()
match i strMatch arr = do
    if(i < length arr)
        then do
            let (_:ys, wmenu) = splitAt 1 (words (menu !! i))
            matchWord i strMatch wmenu
        else putStrLn "No se ha encontrado ninguna palabra!"
    

{--Main method--}
main :: IO ()
main = do
    printMenu 0
    respuesta <- getLine

    {--Only check for digits from 0 to 9--}
    if(length respuesta <= 1)
        then do
            if(all isDigit respuesta)
                then do
                    if(read respuesta >= 0 || read respuesta < 3)
                        then do
                            let (_:ys, opEl) = splitAt 1 (words (menu !! (read respuesta - 1)))
                            let q = unwords opEl
                            putStrLn ""
                            putStrLn q
                    else putStrLn ""
            else putStrLn "Opcion fuera de rango!"
        else do
            match 0 respuesta menu