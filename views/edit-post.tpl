<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>Kate</title>
  <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
  <link rel="stylesheet" type="text/css" href="/static/css/post.css" />
  <link rel="stylesheet" type="text/css" href="/static/css/user.css" />
  <link rel="shortcut icon" href="/static/img/fox.icon.png">
</head>
<body>
  {{template "app/top.tpl ."}}
  <div>

    {{template "app/sides.tpl" .}}
   
    <div class="user-area"><h2>{{.Edit}}</h2></div>
      <form id="posting" method="post">
        <label for="name"></label>
        <br>
        <input type="text" name="name" class="placeholder" value={{.Topic}}>
        <br>
        <br>
        <label for="content">{{.BlogPost}}:</label><p><textarea name="content" cols="50" rows="15">{{.Content}}</textarea></p>
        <input type="submit" value={{.Edit}}>
      </form>
    </div>
  </div>	
</body>
