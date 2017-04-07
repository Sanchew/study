{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_Learn (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
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
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/clearlove/.cabal/bin"
libdir     = "/Users/clearlove/.cabal/lib/x86_64-osx-ghc-8.0.1/Learn-0.1.0.0-BaxsaMtrrgn6H7yA8rL3jL"
datadir    = "/Users/clearlove/.cabal/share/x86_64-osx-ghc-8.0.1/Learn-0.1.0.0"
libexecdir = "/Users/clearlove/.cabal/libexec"
sysconfdir = "/Users/clearlove/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Learn_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Learn_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Learn_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Learn_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Learn_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
