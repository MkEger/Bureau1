<#import "blocks/header.ftlh" as h>
<#import "blocks/footer.ftlh" as f>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
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
    <div class="snippet-container mt-5"></div>
    <h2>Знахідка з такими ключовими словами: "<#if key??>${key}</#if>"</h2>
    <#list searchings as el>
        <div class="alert alert-danger mt-2">
            <h3>${el.title}</h3>
            <p>${el.description}</p>
            <a href="/things/${el.id}" class="btn btn-warning">Більше інформації</a>
        </div>
    </#list>
</div>
<div class="footer">
    <@f.footer/>
</div>
</body>
</html>


