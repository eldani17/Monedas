package app

class SeguridadFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                if (!session.user && !actionName.equals('login')) {
                    redirect(controller:'Usuario', action: 'login')
                    return false
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
