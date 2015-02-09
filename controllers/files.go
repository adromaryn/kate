package controllers

import (
	"Kate/features"
	"fmt"
	"github.com/astaxie/beego"
	"path/filepath"
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
