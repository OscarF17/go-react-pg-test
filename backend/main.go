package main

import (
	"backend/config"
	"backend/routes"
	"github.com/gin-gonic/gin"
)

func main() {
	// Wait for database to be ready
	// Added to keep container from crashing when running for the first time
	router := gin.New()
	config.Conncect()
	routes.DefRoutes(router)
	router.Run(":8081")
}
