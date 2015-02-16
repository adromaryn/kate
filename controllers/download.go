package controllers

import (
	"Kate/features"
	"fmt"
	"github.com/astaxie/beego"
	"io"
	"os"
)

type DownloadController struct {
	beego.Controller
}

func (this *DownloadController) Get() {
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
		this.Data["Filename"] = features.Translate("Файл", sess_userlang)
		this.Data["Save"] = features.Translate("Сохранить как", sess_userlang)
		this.Data["UFiles"] = features.Translate("Файлы", sess_userlang)
		this.TplNames = "download.tpl"

	} else {
		this.Redirect("/", 302)
	}
}

func (this *DownloadController) Download() {
	file, _, _ := this.GetFile("file")
	name := this.GetString("name")
	sess_id, _ := this.GetSession("userid").(int64)
	out, err := os.Create(fmt.Sprintf("static/img/Downloads/%d/%s", sess_id, name))
	beego.Info(err)
	_, err = io.Copy(out, file)
	if err != nil {
		this.Redirect(`/download`, 302)
	} else {
		this.Redirect(`/`, 302)
	}
}

func (this *DownloadController) Delete() {
	name := this.GetString(":name")
	beego.Info("Nme:", name)
	sess_id, _ := this.GetSession("userid").(int64)
	err := os.Remove(fmt.Sprintf("static/img/Downloads/%d/%s", sess_id, name))
	if err != nil {
		beego.Info(err)
		this.Redirect(`/files`, 302)
	} else {
		this.Redirect(`/`, 302)
	}
}
