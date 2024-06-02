<#import "blocks/header.ftlh" as h>
<#import "blocks/footer.ftlh" as f>

<!DOCTYPE html>
<html lang="ua">
<head>
    <meta charset="UTF-8">
    <title>Регистрация</title>
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
        }
    </style>
</head>
<body>
<div class="header">
    <@h.header user/>
</div>
<div class="content container">
    <h1 style="text-align: center">Реєстрація</h1>
    <hr>
    <form action="/registration" method="post">
        <div class="form-group">
            <label for="name">Ім'я користувача</label>
            <input type="text" class="form-control" required id="name" name="name">
        </div>
        <div class="form-group">
            <label for="email">Електронна поста</label>
            <input type="email" class="form-control" id="email" required name="email">
        </div>
        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" class="form-control" id="password" required name="password">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-danger">Зареєструватися</button>
    </form>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</div>
<div class="footer">
    <@f.footer/>
</div>
</body>
</html>





