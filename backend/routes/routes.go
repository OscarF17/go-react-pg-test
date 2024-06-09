package routes

import (
	"backend/controller"
	"github.com/gin-gonic/gin"
)

func DefRoutes(router *gin.Engine) {
	router.GET("/", controller.GetClients)
}
