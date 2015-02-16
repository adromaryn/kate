<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>Kate</title>
  <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
  <link rel="stylesheet" type="text/css" href="/static/css/user.css" />
  <link rel="stylesheet" type="text/css" href="/static/css/post.css" />
  <link rel="stylesheet" type="text/css" href="/static/css/content-links.css" />
  <link rel="shortcut icon" href="/static/img/icon.png">
</head>
<body>
  {{template "app/top.tpl" .}}
  <div>
    {{template "app/sides.tpl" .}}
    <div class="user-area">
      <h1>{{.PostName}}</h1>
      <br>
      <p>{{.Content}}</p>
      <br>
      <br>
      {{$pics:= .Id | pics}}
      {{$sess:= .Sess}}
      {{$owner:= .Owner}}
      {{$unfix:= .Unfix}}	
      {{range $i, $pic := $pics}}
        <br><br>
        {{$picname := $pic|lnk}}
        {{$picid := $pic|picnum}}
        {{$id := .Id}}
        {{$user := owner $id}}
        {{$file:= picpath $user $picname}}
        <img src={{$file}} width=100% height=auto />
        {{if $owner}}
          <a href="/picture/unfix/{{$picid}}" class="content-link">{{$unfix}}</a>
        {{end}}
      {{end}}
      {{if .Owner}}
        <br>
        <br>
        <a href="/gallery/{{.Id}}" class="content-link">{{.Attach}}</a>
        <br>
        <a class="post-button" href="../delete/post/{{.Id}} ">{{.DeletePost}}</a>
        <a class="post-button" href="../edit/post/{{.Id}} ">{{.Edit}}</a>
      {{end}}
    </div>
    <div>
      <form id="posting" method="post">
        <label for="content">{{.Comment}}:</label><p><textarea name="content" cols="50" rows="5" placeholder={{.Comment}}></textarea></p>
        <input type="submit" value={{.Send}}>
      </form>
    </div>
    <div>
      {{$sess := .Sess}}
      {{$delete := .Delete}}
      {{range $id, $comment := .PostComments}}
        {{$owner := $comment.Owner}}
        {{$content := $comment.Content}}
        {{$name := $comment.OwnerName}}
        <div class="user-area">
          <a class="content-link" href="../user/{{$owner}}">{{$name}}</a>
          <br>
          <br>
          <p class="postarea">{{str2html $content}}</p>
          <br>
          {{if eq $sess $owner}}
            {{$d := $id | pos}}
            <a class="post-button" href="/delete/comment/{{$d}}">{{$delete}}</a>
          {{end}}
        </div>
      {{end}}
      <br>
      <br>
    </div>
  </div>
</body>
