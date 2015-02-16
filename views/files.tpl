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
      <h1>{{.UFiles}}</h1>
      <br>
      {{$delete:=.Delete}}
      {{range $id, $file := .Files}}
        {{$name := $file|base}}
        <a href={{$file}} class="content-link">{{$name}}</a><br>
        <a href="/files/delete/{{$name}}" class="content-link" id="delete">{{$delete}}</a>
        <br><br>
      {{end}}
  </div>
</body>
