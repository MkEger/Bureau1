<#import "blocks/header.ftlh" as h>
<#import "blocks/footer.ftlh" as f>

<!DOCTYPE html>
<html lang="ua">
<head>
    <meta charset="UTF-8">
    <title>Видалення знахідки</title>
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
<div class="header" >
    <@h.header user={}/>
</div>
<div class="content container">
    <h1 class="mt-5">Видалення знахідки</h1>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <p class="lead">Сталася помилка, схоже ви не є власником публікації! Перевірте все ще раз.</p>
        </div>
    </div>
</div>
<div class="footer">
    <@f.footer/>
</div>
</body>
</html>