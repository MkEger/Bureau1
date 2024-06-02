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
    <h2>Бюро знахідок створене , щоб допомагати людям знайти свої загублені речі!</h2><br>
    <h3>Якщо ти знайшов щось, скористайся сайтом і додай знахідку!</h3><br>
    <h3>Якщо загубив щось, скористайся пошуком!</h3><br>
    <h3>Ми допоможемо вам !   :)</h3><br>
</div>
<div class="footer">
    <@f.footer/>
</div>
</body>
</html>
