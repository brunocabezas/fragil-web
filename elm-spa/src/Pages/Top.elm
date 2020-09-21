module Pages.Top exposing (Model, Msg, Params, page)

import Array exposing (fromList, get)
import Html exposing (..)
import Html.Attributes exposing (src)
import Html.Events as Events
import Project exposing (Project)
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url exposing (Url)


type alias Params =
    ()


type alias Model =
    { projects : List Project.Project
    }


type Msg
    = CarouselNextClick Int


page : Page Params Model Msg
page =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


init : Url Params -> ( Model, Cmd Msg )
init params =
    ( { projects = Project.mocks
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CarouselNextClick value ->
            ( { model | projects = [] }, Cmd.none )



--  NextTestimonial ->
--       { model | testimonials = Carousel.next model.testimonials }
--     PreviousTestimonial ->
--       { model | testimonials = Carousel.previous model.testimonials }
--     SelectTestimonial index ->
--       { model | testimonials = Carousel.select index model.testimonials }
-- VIEW


view : Model -> Document Msg
view model =
    { title = "Proyectos"
    , body = [ projectList model.projects ]
    }


projectList : List Project.Project -> Html Msg
projectList projects =
    div []
        [ div [] (List.map printProject projects), div [] [] ]


printProject : Project.Project -> Html Msg
printProject p =
    div [ Events.onClick (CarouselNextClick p.id) ]
        [ img [ src (printListFirstElement p.gallery) ] []
        ]


printListFirstElement : List String -> String
printListFirstElement x =
    case List.head x of
        Just y ->
            y

        Nothing ->
            ""
