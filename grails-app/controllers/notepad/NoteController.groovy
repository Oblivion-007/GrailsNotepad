package notepad
import grails.converters.JSON

class NoteController {

    @grails.gorm.transactions.Transactional
    def create(){
        [noteInstance: new Note()]
    }

    @grails.gorm.transactions.Transactional
    def save(Note noteInstance){
        noteInstance.save()
        redirect(action: "index")
    }

    @grails.gorm.transactions.Transactional
    def edit(long id){
        def noteInstance = Note.get(id)
        [noteInstance: noteInstance]
    }

    @grails.gorm.transactions.Transactional
    def update(long id) {
        def noteInstance = Note.get(id)
        noteInstance.properties = params
        noteInstance.save()
        redirect(action: "index")
    }



    @grails.gorm.transactions.Transactional
    def delete() {
        def myArray = params.checkedCheckboxIds
        def noteIds = JSON.parse(myArray)
        noteIds.each { id ->
            Note.get(id)?.delete()
        }
    }


    @grails.gorm.transactions.Transactional
    def index() {
        def notes = Note.list()
        [notes : notes]
    }
}