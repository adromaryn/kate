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
     <form action="/download" method="post" enctype="multipart/form-data">
       <label for="file">{{.Filename}}:</label>
       <input type="file" name="file" id="file">
       <br>
       <br>
       <label for="name">{{.Save}}:</label>
       <input type="text" name="name" id="name">
       <br>
       <br>
       <input type="submit" name="submit" value={{.Download}}>
     </form>
     </div>
   </div>  
 </body>

