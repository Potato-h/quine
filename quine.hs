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
    let raw = "?"
    let (pref, qsuff) = breakOn "?" raw
    let suff = drop 1 qsuff
    putStr . unpack $ T.concat [pref, escape raw, suff]
