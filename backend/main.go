package main

import (
	"backend/config"
	"backend/routes"
	"github.com/gin-gonic/gin"
	"time"
)

func main() {
	// Wait for database to be ready
	// Added to keep container from crashing when running for the first time
	time.Sleep(5 * time.Second)
	router := gin.New()
	config.Conncect()
	routes.DefRoutes(router)
	router.Run(":8081")
}
