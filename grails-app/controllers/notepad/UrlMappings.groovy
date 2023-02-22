package notepad

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(controller: "Note", action: "index")
//        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
