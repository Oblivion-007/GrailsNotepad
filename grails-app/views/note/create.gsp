<%--
  Created by IntelliJ IDEA.
  User: RIL
  Date: 07/02/2023
  Time: 15:13
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
</head>

<body>

<g:form action="save" class="d-flex align-items-center justify-content-center flex-column" style="height: 100%">
    <div class="form-group">
        <label>Title</label>
        <g:textField name="title" class="form-control"  type="text" placeholder="Enter title" autofocus="autofocus"/>
    </div>
    <div class="form-group">
        <label>Description</label>
        <g:textArea name="description" class="form-control"  type="text" placeholder="Enter description" rows="3"/>
    </div>

    <button style="margin: 1rem" type="submit" class="btn btn-primary">Submit</button>
</g:form>


</body>
</html>