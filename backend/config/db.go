package config

import (
	"fmt"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var DB *gorm.DB

func Conncect() {
	dsn := "host=database user=storeadmin dbname=storetest password=000 port=5432 sslmode=disable"
	// dsn := "postgres://storeadmin:000@localhost:8080/storetest"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		fmt.Println("---------------ALGO SALIO MAL---------------")
		panic(err)
	}
	DB = db
}
