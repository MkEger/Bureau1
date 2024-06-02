<#macro header user>
    <!doctype html>
    <html lang="ua">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <title>Бюро Знахідок</title>
        <style>
            .login-button {
                position: absolute;
                bottom: 10px;
                right: 10px;
            }
            .navbar-brand {
                font-size: 1.5rem;
            }
        </style>
    </head>
    <body>
    <nav class="navbar navbar-dark" style="background-color: #FF8C00; position: relative;">
        <div class="container-fluid d-flex justify-content-between align-items-center">
            <a href="/">
                <span class="navbar-brand mb-0 h1">Бюро знахідок</span>
            </a>
            <div class="d-flex justify-content-center flex-grow-1">
                <nav class="d-inline-flex mt-2 mt-md-0">
                    <a class="button mx-3 py-2 text-decoration-none" href="/">Головна</a>
                    <a class="button mx-3 py-2 text-decoration-none" href="/create">Добавити знахідку</a>
                    <a class="button mx-3 py-2 text-decoration-none" href="/about_us">Про нас</a>
                </nav>
            </div>
            <#if user.email??>
                <div class="dropdown text-end d-flex align-items-center">
                    <span class="navbar-text mx-2">Ім'я Користувача: ${user.name}</span>
                    <form action="/logout" method="post" class="d-inline">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-danger btn-sm">
                            Вийти
                        </button>
                    </form>
                </div>
            <#else>
                <div class="login-button">
                    <button class="btn btn-light" type="button" onclick="window.location.href='/login'">Ввійти</button>
                </div>
            </#if>
        </div>
    </nav>
    <div class="container mt-4">
        <#nested/>
    </div>
    </body>
    </html>
</#macro>
