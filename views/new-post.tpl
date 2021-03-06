<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>Kate</title>
  <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
  <link rel="stylesheet" type="text/css" href="/static/css/post.css" />
  <link rel="stylesheet" type="text/css" href="/static/css/user.css" />
  <link rel="shortcut icon" href="/static/img/icon.png">
</head>

<body>

  {{template "app/top.tpl" .}}

  <div>

    {{template "app/sides.tpl" .}}

    <div class="user-area"><h2>{{.New}}</h2></div>
      <form id="posting" method="post">
        <label for="name">{{.Topic}}:</label>
        <br>
        <input type="text" name="name" class="placeholder" placeholder={{.Topic}}>
        <br>
        <br>
        <label for="content">{{.BlogPost}}:</label><p><textarea name="content" cols="50" rows="15" placeholder={{.Content}}></textarea></p>
        <input type="submit" value={{.Send}}>
      </form>
    </div>
  </div>
</body>
