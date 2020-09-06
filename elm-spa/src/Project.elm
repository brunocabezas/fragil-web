module Project exposing (Project, mocks)


type alias Project =
    { id : Int, name : String, text : String, gallery : List String, abstract : String }


mocks : List Project
mocks =
    [ { id = 1, name = "name1", abstract = "hola", text = "text", gallery = [ "https://collection-wakawaka.world/media/d/36.jpg?22", "https://collection-wakawaka.world/media/d/37.jpg?22" ] }
    , { id = 2, name = "name2", abstract = "hola", text = "text2", gallery = [ "https://collection-wakawaka.world/media/d/36.jpg?22", "https://collection-wakawaka.world/media/d/37.jpg?22" ] }
    ]
