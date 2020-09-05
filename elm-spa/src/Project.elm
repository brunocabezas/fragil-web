module Project exposing (mocks)


type alias Project =
    { name : String, text : String, date : Int }


mocks : List Project
mocks =
    [ { name = "name1", text = "text", date = 1 } ]
