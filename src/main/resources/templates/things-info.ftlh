<!DOCTYPE html>
<html lang="uk">
<head>
    <title>Bureau of things</title>
</head>
<body>
<h1>Бюро знахідок:</h1>
<hr>
<h4>Повна інформація про знахідку:</h4>
<#list images as img>
    <img src="/images/${img.id}" height="60px">
</#list><br>
<b>Назва знахідки:</b> ${things.title}<br>
<b>Опис знахідки:</b> ${things.description}<br>
<b>Ключові слова:</b> ${things.keywords}<br>
<b>Номер телефону:</b> ${things.telephone}<br>
<b>Місто:</b> ${things.city}<br>
<b>Ім'я:</b> ${things.user.name}<br>
</body>
</html>
