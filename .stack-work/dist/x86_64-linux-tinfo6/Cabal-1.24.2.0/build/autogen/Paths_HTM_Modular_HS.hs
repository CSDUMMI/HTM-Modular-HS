{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_HTM_Modular_HS (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/joris/Documents/HTM-Modular-HS/.stack-work/install/x86_64-linux-tinfo6/lts-9.21/8.0.2/bin"
libdir     = "/home/joris/Documents/HTM-Modular-HS/.stack-work/install/x86_64-linux-tinfo6/lts-9.21/8.0.2/lib/x86_64-linux-ghc-8.0.2/HTM-Modular-HS-0.1.0.0"
dynlibdir  = "/home/joris/Documents/HTM-Modular-HS/.stack-work/install/x86_64-linux-tinfo6/lts-9.21/8.0.2/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/joris/Documents/HTM-Modular-HS/.stack-work/install/x86_64-linux-tinfo6/lts-9.21/8.0.2/share/x86_64-linux-ghc-8.0.2/HTM-Modular-HS-0.1.0.0"
libexecdir = "/home/joris/Documents/HTM-Modular-HS/.stack-work/install/x86_64-linux-tinfo6/lts-9.21/8.0.2/libexec"
sysconfdir = "/home/joris/Documents/HTM-Modular-HS/.stack-work/install/x86_64-linux-tinfo6/lts-9.21/8.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HTM_Modular_HS_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HTM_Modular_HS_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "HTM_Modular_HS_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "HTM_Modular_HS_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HTM_Modular_HS_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HTM_Modular_HS_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
