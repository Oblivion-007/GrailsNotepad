package notepad

class BootStrap {

    def init = { servletContext ->
        new notepad.Note(title: "Check mail", description: "Check for mails from Elucidata").save()
        new notepad.Note(title: "Check Slack", description: "Check for Slack messages").save()
        new notepad.Note(title: "Work", description: "Work on the notepad application").save()
        new notepad.Note(title: "Workout", description: "Go to the Gym!!").save()
        new notepad.Note(title: "Read a book", description: "Why read a book? Go watch a movie instead!!").save()

    }
    def destroy = {
    }
}
