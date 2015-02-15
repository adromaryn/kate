package main

import (
	models "Kate/models"
	_ "Kate/routers"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	"path"
	"strconv"
)

func init() {
	user := beego.AppConfig.String("mysqluser")
	passwd := beego.AppConfig.String("mysqlpass")
	dbname := beego.AppConfig.String("mysqldb")
	orm.RegisterDriver("mysql", orm.DR_MySQL)
	orm.RegisterDataBase("default", "mysql", fmt.Sprintf("%s:%s@/%s?charset=utf8", user, passwd, dbname))
	orm.RegisterModel(new(models.User))
	orm.RegisterModel(new(models.Blogpost))
	orm.RegisterModel(new(models.Follower))
	orm.RegisterModel(new(models.Comment))
	orm.RegisterModel(new(models.Postpic))
	/*err := orm.RunSyncdb("default", true, true)
	if err != nil {

		fmt.Println(err)
	}*/
}

func main() {
	beego.SessionOn = true
	beego.SessionName = "kate"
	beego.AddFuncMap("pos", positive)
	beego.AddFuncMap("base", base)
	beego.AddFuncMap("pics", pictures)
	beego.AddFuncMap("lnk", link)
	beego.AddFuncMap("picpath", picpath)
	beego.Run()
}

func positive(i int64) (o int64) {
	o = -i
	return
}

func base(file string) string {
	return path.Base(file)
}

func pictures(i string) []*models.Postpic {
	id, _ := strconv.Atoi(i)
	o := orm.NewOrm()
	o.Using("default")
	var pics []*models.Postpic
	o.QueryTable("postpics").Filter("post", id).All(&pics)
	return pics
}

func link(picture *models.Postpic) string {
	return picture.Link
}

func picpath(i int64, name string) string {
	return fmt.Sprintf(`/static/img/Downloads/` + strconv.FormatInt(i, 10) + `/` + name)
}
