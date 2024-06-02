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
            text-align: center;
            width: 100%;
            background-color: #f8f9fa;
            padding: 10px 0;
            z-index: 1000;
        }
        .carousel-item img {
            max-height: 300px;
            width: auto;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="header">
    <@h.header user/>
</div>
<div class="content container">
    <!-- Ряд фото -->
    <div class="image-row">
        <#list images as img>
            <div class="image-col">
                <img src="/images/${img.id}" alt="Фото ${img_index + 1}">
            </div>
        </#list>
    </div>
</div>
<div class="row justify-content-center mt-5">
    <div class="col-md-8">
        <h4>Деталі знахідки:</h4>
        <p><b>Назва знахідки:</b> ${things.title}</p>
        <p><b>Опис знахідки:</b> ${things.description}</p>
        <p><b>Ключові слова:</b> ${things.keywords}</p>
        <p><b>Номер телефону:</b> ${things.telephone}</p>
        <p><b>Місто:</b> ${things.city}</p>
        <p><b>Ім'я:</b> ${things.user.name}</p>
    </div>
</div>
<div class="row justify-content-center">
    <div class="col-md-8">
        <form action="/things/delete/${things.id}" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-danger">Видалити знахідку</button>
        </form>
    </div>
</div>
<div class="footer">
    <@f.footer/>
</div>
</body>
</html>




