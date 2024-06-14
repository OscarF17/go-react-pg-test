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

func CreateClient(c *gin.Context) {
	var newClient models.NewClient
	err := c.BindJSON(&newClient)
	if err != nil {
		log.Fatal(err)
	}
	result := config.DB.Raw("call create_client($1, $2, $3)", newClient.Name, newClient.Phone, newClient.Email)
	if result.Error != nil {
		log.Fatal(result.Error)
	}
	jsonData := []byte(`{"msg":"client created"}`)
	c.JSON(http.StatusCreated, jsonData)
}
