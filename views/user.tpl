<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>Kate</title>
  <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
  <link rel="stylesheet" type="text/css" href="/static/css/user.css" />
  <link rel="shortcut icon" href="/static/img/icon.png">
</head>
<body>

  {{template "app/top.tpl" .}}
  <div>
    {{template "app/sides.tpl" .}}
    <div class="user-area">
	
      <h1>{{.Name}}</h1>
      <br>
      {{if .Exist}} 
        <a class="user-button" href = "/followers/{{.Id}}">{{.Followers}}</a>
        <br>
        <a class="user-button" href = "/following/{{.Id}}">{{.Following}}</a>
        <br>
        {{if .Owner}}
          <a class="user-button" href="../add"> {{.Posting}}</a>
        {{else}}    
          <a class="user-button" href="../follow/{{.Id}}">{{.Follow}}</a>
        {{end}}
      {{end}}
    
    </div>
    <div>
      {{range $id, $post := .UserPosts}}
        {{range $name, $content := $post}}
          {{$uid := $id | pos}}
          <div class="user-area" id="link" class="post-area">
            <a class="post-header"; href="../posts/{{$uid}}">{{$name}}</a>
            <p>{{$content}}</p>
          </div>
        {{end}}
      {{end}}
    </div>
    <br>
    <br>
  </div>
</body>
