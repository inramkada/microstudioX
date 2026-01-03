module Core.Interop.CKernel where

import GHC.Wasm.Prim (JSVal)

foreign import javascript unsafe
  "window.ckernel.fast_add($1, $2)"
  c_fastAdd :: Double -> Double -> IO Double
