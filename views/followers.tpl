<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>Kate</title>
  <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
  <link rel="stylesheet" type="text/css" href="/static/css/user.css" />
  <link rel="stylesheet" type="text/css" href="/static/css/content-links.css" />
  <link rel="shortcut icon" href="/static/img/icon.png">
</head>
<body>
  {{template "app/top.tpl" .}}
  <div>

    {{template "app/sides.tpl" .}}
  
    <div class="user-area" id="link">
      <h1>{{.Followers}}</h1>
      <br>
      {{if .FolEx}}
        {{range $id, $name := .AllFollowers}}
          <a class ="content-link" href ="/user/{{$id}}">{{$name}}</a><br><br>
        {{end}}
      {{else}}
        {{range $id, $name := .AllFollowers}}
          <p>{{$name}}</p>
        {{end}}
      {{end}}
    </div>
  </div>
</body>
