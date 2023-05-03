escape :: String -> String
escape str = str >>= escapeChar
    where
        escapeChar '\n' = "\\n"
        escapeChar '\'' = "\\\'"
        escapeChar '"'  = "\\\""
        escapeChar '\\' = "\\\\"
        escapeChar x = [x]

main :: IO ()
main = do
    contents <- getContents
    putStrLn $ escape contents
 