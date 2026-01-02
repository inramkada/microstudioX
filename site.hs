{-# LANGUAGE OverloadedStrings #-}

import Hakyll

main :: IO ()
main = hakyll $ do

  match "assets/**" $ do
    route idRoute
    compile copyFileCompiler

  match "src/index.html" $ do
    route $ constRoute "index.html"
    compile $ getResourceBody
      >>= relativizeUrls

  match "CNAME" $ do
    route idRoute
    compile copyFileCompiler

