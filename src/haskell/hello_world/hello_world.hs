import Data.Maybe
import Options.Applicative
import Text.Printf

data Config = Config
    { name  :: Maybe String
    } deriving Show

configParser :: Parser Config
configParser = Config
    <$> (optional $ strOption $ long "name" <> short 'n' <> metavar "NAME" <> help "Name of the person")

main :: IO ()
main = do
    conf <- execParser (info configParser fullDesc)
    printf "Hello, %s!\n" (fromMaybe "World" (name conf))
