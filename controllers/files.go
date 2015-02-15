package controllers

import (
	"Kate/features"
	models "Kate/models"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"path/filepath"
	"strconv"
)

type FileController struct {
	beego.Controller
}

func (this *FileController) Get() {
	sess_userid, _ := this.GetSession("userid").(int64)
	sess_username, _ := this.GetSession("username").(string)
	sess_userlang, _ := this.GetSession("userlang").(string)

	if sess_username != "" {

		this.Data["Menu"] = features.Translate("Меню", sess_userlang)
		this.Data["Download"] = features.Translate("Загрузить", sess_userlang)
		this.Data["LogStr"], this.Data["LogURL"] = features.Strings("", sess_userlang)
		this.Data["Main"] = features.Translate("Главная", sess_userlang)
		this.Data["Lang"] = features.Translate("Язык", sess_userlang)
		this.Data["Login"] = features.Translate("Логин", sess_userlang)
		this.Data["Password"] = features.Translate("Пароль", sess_userlang)
		this.Data["Enter"] = features.Translate("Войти", sess_userlang)
		this.Data["UFiles"] = features.Translate("Файлы", sess_userlang)
		userpath := fmt.Sprint("static/img/Downloads/", sess_userid, "/*")
		beego.Info(userpath)
		files, _ := filepath.Glob(userpath)
		beego.Info(files)
		this.Data["Files"] = files
		this.TplNames = "files.tpl"

	} else {
		this.Redirect("/", 302)
	}
}

func (this *FileController) Gallery() {
	sess_userid, _ := this.GetSession("userid").(int64)
	sess_userlang, _ := this.GetSession("userlang").(string)
	postId, _ := this.GetInt64(":id")

	o := orm.NewOrm()
	o.Using("default")
	var posts []*models.Blogpost
	o.QueryTable("blogposts").Filter("id", postId).All(&posts)
	if len(posts) == 0 {
		beego.Info("out")
		this.Redirect("/", 302)
	} else {
		post := *posts[0]

		if sess_userid == post.Owner {

			this.Data["Menu"] = features.Translate("Меню", sess_userlang)
			this.Data["Download"] = features.Translate("Загрузить", sess_userlang)
			this.Data["LogStr"], this.Data["LogURL"] = features.Strings("", sess_userlang)
			this.Data["Main"] = features.Translate("Главная", sess_userlang)
			this.Data["Lang"] = features.Translate("Язык", sess_userlang)
			this.Data["Login"] = features.Translate("Логин", sess_userlang)
			this.Data["Password"] = features.Translate("Пароль", sess_userlang)
			this.Data["Enter"] = features.Translate("Войти", sess_userlang)
			this.Data["UFiles"] = features.Translate("Файлы", sess_userlang)
			userpath := fmt.Sprint("static/img/Downloads/", sess_userid, "/*.jp*g")
			beego.Info(userpath)
			files, _ := filepath.Glob(userpath)
			beego.Info(files)
			this.Data["Files"] = files
			this.Data["Id"] = strconv.FormatInt(postId, 10)
			this.TplNames = "gallery.tpl"

		} else {
			this.Redirect("/", 302)
		}
	}
}

func (this *FileController) PicAttach() {

	beego.Info("Привет")
	o := orm.NewOrm()
	o.Using("default")
	picture := models.Postpic{}

	sess_userid, _ := this.GetSession("userid").(int64)
	postId, _ := this.GetInt64(":postid")
	link := this.GetString(":id")
	beego.Info("Строка ", link)
	var posts []*models.Blogpost
	o.QueryTable("blogposts").Filter("id", postId).All(&posts)
	if len(posts) == 0 {
		this.Redirect("/", 302)
	}
	post := *posts[0]

	if sess_userid == post.Owner {
		beego.Info("!!!")
		picture.Post = postId
		picture.Link = link
		o.Insert(&picture)
		path := fmt.Sprint("/posts/", postId)
		this.Redirect(path, 302)
	} else {
		this.Redirect("/", 302)
	}
}
