<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{{ outline.title }}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/static/css/all.css">
</head>
<body>
    <main>
        {%- block body %}{% endblock -%}
    </main>

    <script data-main="/static/js/main" src="/static/js/vendor/require.js"></script>
</body>
</html>
