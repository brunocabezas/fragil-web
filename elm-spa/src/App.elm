module App exposing (navMenuLabels)



type alias NavMenuLabels =
  { about : String
  , home : String
  }
navMenuLabels : NavMenuLabels = { about = "Nosotros", home = "Proyectos" };