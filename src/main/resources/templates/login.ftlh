<#import "blocks/header.ftlh" as h>
<#import "blocks/footer.ftlh" as f>

<!DOCTYPE html>
<html lang="ua">
<head>
    <meta charset="UTF-8">
    <title>Авторизація</title>
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
    <@h.header user={}/>
</div>
<div class="content container">
    <h1 style="text-align: center">Авторизація</h1>
    <hr>
    <form action="/login" method="post">
        <div class="form-group">
            <label for="email">Електронна пошта</label>
            <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" name="username">
            <div id="email" class="invalid-feedback">
                Неправильна електронна пошта
            </div>
        </div>
        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password">
            <div id="password" class="invalid-feedback">
                Пароль невірний!
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-danger">Войти</button>
    </form>
    <hr>
    <h2>Ти ще не зареєстрований? <a href="/registration">Зареєструйся!</a></h2>
</div>
<div class="footer">
    <@f.footer/>
</div>
</body>
</html>


