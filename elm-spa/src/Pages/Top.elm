module Pages.Top exposing (Model, Msg, Params, page)

import Html exposing (..)
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url exposing (Url)
import Project


type alias Params =
    ()


type alias Model =
    Url Params


type alias Msg =
    Never


page : Page Params Model Msg
page =
    Page.static
        { view = view
        }



-- VIEW


view : Url Params -> Document Msg
view { params } =
    { title = "Proyectos"
    , body = [ text "Lista de proyectos", projectList ]
    }



printProject: Project.Project -> Html Msg
printProject p =
    div []
        [ text p.name ]

projectList : Html Msg
projectList =
  div []
    (List.map printProject Project.mocks)
    