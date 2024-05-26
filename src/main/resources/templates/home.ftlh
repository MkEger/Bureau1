<!DOCTYPE html>
<html xml:lang="uk">
<head>
    <title>Бюро знахідок</title>
</head>
<body>
<h1>Бюро знахідок</h1><hr>
<#if user.email??>
    <h3>Ім'я користувача:<i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Вийти">
    </form>
<#else><h1><a href="/login">Ввійти</a></h1>
</#if>
<hr>
<h4>Знахідки зі всієї України!</h4>
<form action="/" method="get">
    Пошук за назвою:<input type="text" name="title"><br>
    <input type="submit" value="Пошук">
</form>
<#list things as thing>
    <div>
        <p>
            <b>${thing.title}</b> ${thing.description} |
            <a href="/things/${thing.id}">Більше подробиць</a>
        </p>
    </div>
<#else><h3>Знахідок покищо немає</h3>
</#list>
<#if user.email??>
    <hr>
    <h3>Створити допис про нову знахідку</h3>
    <form action="/things/create" method="post" enctype="multipart/form-data">
        Назва об'яви: <input type="text" name="title"><br><br>
        Опис об'яви: <input type="text" name="description"><br><br>
        Ключові слова: <input type="text" name="keywords"><br><br>
        Номер телефону: <input type="text" name="telephone" value="+380"><br><br>
        Місто: <input type="text" name="City"><br><br>
        Перше фото: <input type="file" name="file1"><br><br>
        Друге фото: <input type="file" name="file2"><br><br>
        Третє фото: <input type="file" name="file3"><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Додати знахідку"/>
    </form>
</#if>
</body>
</html>