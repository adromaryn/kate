<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>Kate</title>
  <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
  <link rel="stylesheet" type="text/css" href="/static/css/login.css" />
  <link rel="shortcut icon" href="/static/img/icon.png">
</head>
<body>

  {{template "app/top.tpl" .}}

  <form id="slick-login" method="post">
    <label for="name">{{.Login}}:</label><input type="text" name="name" class="placeholder" placeholder={{.Login}}>
    <label for="password">{{.Password}}</label><input type="password" name="password" class="placeholder" placeholder={{.Password}}>
    <input type="submit" value={{.Enter}}>
  </form>
	
</body>
