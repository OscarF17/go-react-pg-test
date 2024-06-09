package main

import (
	"backend/config"
	"backend/routes"
	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.New()
	config.Conncect()
	routes.DefRoutes(router)
	router.Run(":8081")
}
