package models

type Postpic struct {
	Id   int64  `form:"-"`
	Link string `form:"link,text,link"`
	Post int64  `form:"post,text,post"`
}

func (a *Postpic) TableName() string {
	return "postpics"
}
