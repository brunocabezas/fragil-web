module Main exposing (Flags, Model, Msg(..), Response, init, main, makeRequest, query, update)

import CustomScalarCodecs
import Graphql.Document as Document
import Graphql.Http
import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import Helpers.Main
import RemoteData exposing (RemoteData)
import Swapi.Enum.Language as Language
import Swapi.Interface.Character as Character
import Swapi.Object.Human
import Swapi.Query as Query



{-
   The `query` definition in our Elm code
   is selecting a single top-level field, `hello`.
   The generated schema (generated by https://npmjs.com/package/@dillonkearns/elm-graphql)
   is aware that the type it will return is a
   `String` if it succeeds, hence the type annotation.
   query {
     hello
   }
-}


type alias Response =
    Maybe CustomScalarCodecs.Id


query : SelectionSet (Maybe CustomScalarCodecs.Id) RootQuery
query =
    Query.human { id = CustomScalarCodecs.Id 1001 } Swapi.Object.Human.id


makeRequest : Cmd Msg
makeRequest =
    query
        |> Graphql.Http.queryRequest "https://elm-graphql.herokuapp.com"
        |> Graphql.Http.send (RemoteData.fromResult >> GotResponse)



-- Elm Architecture Setup


type Msg
    = GotResponse Model


type alias Model =
    RemoteData (Graphql.Http.Error Response) Response


type alias Flags =
    ()


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( RemoteData.Loading, makeRequest )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResponse response ->
            ( response, Cmd.none )


main : Helpers.Main.Program Flags Model Msg
main =
    Helpers.Main.document
        { init = init
        , update = update
        , queryString = Document.serializeQuery query
        }
