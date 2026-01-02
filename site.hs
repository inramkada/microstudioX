{-# LANGUAGE OverloadedStrings #-}

import Hakyll

main :: IO ()
main = hakyll $ do
  -- Static assets (video, images, css, js...)
  match "assets/**" $ do
    route idRoute
    compile copyFileCompiler

  -- Root index (your HTML)
  match "src/index.html" $ do
    route $ constRoute "index.html"
    compile $ getResourceBody
      >>= relativizeUrls
      
  --  (ik)
  match "CNAME" $ do
    route idRoute
    compile copyFileCompiler
