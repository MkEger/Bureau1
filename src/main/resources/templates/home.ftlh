<#import "blocks/header.ftlh" as h>
<#import "blocks/footer.ftlh" as f>
<!DOCTYPE html>
<html xml:lang="uk">
<head>
    <title>Бюро знахідок</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .wrapper {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .content {
            flex: 1;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-control {
            display: block;
            width: 100%;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .form-control:focus {
            color: #495057;
            background-color: #fff;
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .card {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 0.25rem;
        }

        .card-body {
            padding: 1.25rem;
        }

        .card-footer {
            background-color: #e9ecef;
            padding: 0.75rem 1.25rem;
            border-top: 1px solid #dee2e6;
        }

    </style>
</head>
<body class="wrapper">
<@h.header user/>
<div class="content">
    <div class="container d-flex justify-content-center">
        <form action="/search" method="get" class="d-flex" style="max-width: 400px;">
            <input class="form-control me-2" type="text" placeholder="Ключові слова" aria-label="Search" name="keywords">
            <button class="btn btn-success ml-auto" type="submit" style="color: antiquewhite; background-color: #e22b2b;">Пошук</button>
        </form>
    </div>
</div>
<div class="content">
    <div class="container">
        <div class="row">
            <#list things as thing>
                <div class="col-md-4">
                    <a href="/things/${thing.id}" class="product-link">
                        <div class="card text-white my-3 product" style="background-color: red;">
                            <img src="/images/${thing.previewImageId}" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">${thing.title}</h5>
                            </div>
                            <div class="card-footer">
                                ${thing.city}
                            </div>
                        </div>
                    </a>
                </div>
            <#else>
                <h3>Знахідок покищо немає</h3>
            </#list>
            </div>
    </div>
</div>
<@f.footer/>
</body>
</html>






