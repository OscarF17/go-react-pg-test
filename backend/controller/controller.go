package controller

import (
	"backend/config"
	"backend/models"
	"fmt"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func GetClients(c *gin.Context) {
	var clients []models.Client
	result := config.DB.Raw("SELECT * FROM clients;").Scan(&clients)
	if result.Error != nil {
		fmt.Println("---ALGO SALIO MAL---")
		log.Fatal(result.Error)
	}
	c.JSON(http.StatusOK, clients)
}
