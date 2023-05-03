{-# LANGUAGE OverloadedStrings #-}

import Data.Text as T

escape :: Text -> Text
escape = T.concatMap escapeChar
    where
        escapeChar '\n' = "\\n"
        escapeChar '\'' = "\\\'"
        escapeChar '"'  = "\\\""
        escapeChar '\\' = "\\\\"
        escapeChar c    = T.singleton c

main :: IO ()
main = do
    let raw = "{-# LANGUAGE OverloadedStrings #-}\n\nimport Data.Text as T\n\nescape :: Text -> Text\nescape = T.concatMap escapeChar\n    where\n        escapeChar \'\\n\' = \"\\\\n\"\n        escapeChar \'\\\'\' = \"\\\\\\\'\"\n        escapeChar \'\"\'  = \"\\\\\\\"\"\n        escapeChar \'\\\\\' = \"\\\\\\\\\"\n        escapeChar c    = T.singleton c\n\nmain :: IO ()\nmain = do\n    let raw = \"?\"\n    let (pref, qsuff) = breakOn \"?\" raw\n    let suff = T.drop 1 qsuff\n    putStrLn . unpack $ T.concat [pref, escape raw, suff]\n"
    let (pref, qsuff) = breakOn "?" raw
    let suff = T.drop 1 qsuff
    putStr . unpack $ T.concat [pref, escape raw, suff]
