<#import "blocks/header.ftlh" as h>
<#import "blocks/footer.ftlh" as f>

<!DOCTYPE html>
<html lang="ua">
<head>
    <meta charset="UTF-8">
    <title>Інформація про знахідку:</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding-top: 56px;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .header {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }
        .content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .footer {
            margin-top: auto;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="header">
    <@h.header user/>
</div>
<div class="content">
    <h3>Створити допис про нову знахідку</h3>
    <form action="/things/create" method="post" enctype="multipart/form-data" class="col-md-6">
        <div class="form-group">
            <label for="title">Назва об'яви:</label>
            <input type="text" class="form-control" id="title" name="title">
        </div>
        <div class="form-group">
            <label for="description">Опис об'яви:</label>
            <textarea class="form-control" id="description" name="description"></textarea>
        </div>
        <div class="form-group">
            <label for="keywords">Ключові слова:</label>
            <input type="text" class="form-control" id="keywords" name="keywords">
        </div>
        <div class="form-group">
            <label for="telephone">Номер телефону:</label>
            <input type="tel" class="form-control" id="telephone" name="telephone" value="+380">
        </div>
        <div class="form-group">
            <label for="city">Місто:</label>
            <input type="text" class="form-control" id="city" name="City">
        </div>
        <div class="form-group">
            <label for="file1">Перше фото:</label>
            <input type="file" class="form-control-file" id="file1" name="file1">
        </div>
        <div class="form-group">
            <label for="file2">Друге фото:</label>
            <input type="file" class="form-control-file" id="file2" name="file2">
        </div>
        <div class="form-group">
            <label for="file3">Третє фото:</label>
            <input type="file" class="form-control-file" id="file3" name="file3">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-danger">Додати знахідку</button>
    </form>
</div>
<div class="footer">
    <@f.footer/>
</div>
</body>
</html>

