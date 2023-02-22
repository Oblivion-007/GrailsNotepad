<%--
  Created by IntelliJ IDEA.
  User: RIL
  Date: 14/02/2023
  Time: 12:55
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function processDelete(event){
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            const checkedCheckboxIds = [];

            for (let i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    checkedCheckboxIds.push(checkboxes[i].value);
                }
            }
            // console.log(checkedCheckboxIds);

            $.ajax({
                url: "/note/delete",
                type: "POST",
                data: {
                    checkedCheckboxIds: JSON.stringify(checkedCheckboxIds)
                },
                success: function(data) {
                    console.log("Array sent successfully");
                    const cards = document.querySelectorAll('.card');

                    for (let i = 0; i < cards.length; i++) {
                        if(checkedCheckboxIds.includes(cards[i].id)){
                            cards[i].remove();
                        }
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error sending array:", error);
                }
            });
        }

    </script>
</head>

<body>

<div class="d-flex align-items-center justify-content-around flex-column" style="height: 100%">
    <h3>Notepad</h3>
    <div>
        <g:link action="create" type="button" class="btn btn-success">Create</g:link>
        <button class="btn btn-danger" onclick="processDelete(event)">Delete</button>
    </div>


    <div class="overflow-scroll col-sm-10 d-flex align-items-center flex-column" style="height: 75%">
            <g:each var="note" in="${notes}">
                <div class="card col-sm-5" id="${note.id}" style="margin: 0.5rem; padding: 0.4rem">
                    <div class="form-check">
                        <g:checkBox name="checkbox" value="${note.id}" checked="false"  class="form-check-input" type="checkbox" />
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${note.title}</h5>
                        <p class="card-text">${note.description}</p>
                        <g:link class="btn btn-primary" action="edit" name="update" params="[id:note.id]">Edit</g:link>
                    </div>
                </div>
            </g:each>
    </div>


</div>
<style>
::-webkit-scrollbar {
    display: none;
}
</style>

</body>
</html>