import Network.HostName

main :: IO ()
main = do
  putStrLn "Hello from Haskell inside a Nix flake!"
  h <- getHostName
  putStrLn $ "Your hostname is: " ++ h
