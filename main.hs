{--Data definitions--}
data Respuesta respuesta = Digito Int | Palabras String
data MenuOption = Op1 | Op2 | Op3
--charOp:: String -> Char
  --charOp 'Op1' = "1";
  --charOp 'Op2' = "2";
  --charOp 'Op3' = "3";
{--Main question--}
ask  = "¿Qué te gustaría conocer más?"
say :: MenuOption -> String

{--Menu options--}
say Op1 = "1. Proceso de inscripción a cursos"
say Op2 = "2. Beneficios de Coursera + MinTIC"
say Op3 = "3. Listado de cursos"
{--Match--}
--exactMatch :: String -> [String] -> Maybe String
--exactMatch [] _ = Nothing
  
{--Main method--}
main :: IO ()
main = do
    putStrLn ask
    putStrLn ""
    putStrLn (say Op1)
    putStrLn (say Op2)
    putStrLn (say Op3)
    putStrLn ""
    putStrLn "Selecciona una Opcion:"
    --putStrLn (charOp1)
    respuesta <- getLine
    putStrLn ""
    putStrLn respuesta