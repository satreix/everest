package main

import (
	"context"
	"flag"
	"log"
	"net/http"
	"errors"
	"fmt"
	"os"
	"sync"

	petstore_v1 "github.com/satreix/everest/src/go/petstore/server/api/petstore/v1"
)

type service struct {
	mu   sync.RWMutex
	pets map[int64]petstore_v1.Pet
}

func newService() *service {
	return &service{
		pets: make(map[int64]petstore_v1.Pet),
	}
}

func (s *service) UpdatePet(ctx context.Context, pet petstore_v1.Pet) (petstore_v1.ImplResponse, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	if _, exists := s.pets[pet.Id]; !exists {
		return petstore_v1.ImplResponse{Code: 404}, errors.New("pet not found")
	}
	s.pets[pet.Id] = pet
	return petstore_v1.ImplResponse{Code: 200}, nil
}

func (s *service) AddPet(ctx context.Context, pet petstore_v1.Pet) (petstore_v1.ImplResponse, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	if _, exists := s.pets[pet.Id]; exists {
		return petstore_v1.ImplResponse{Code: 409}, errors.New("pet already exists")
	}
	s.pets[pet.Id] = pet
	return petstore_v1.ImplResponse{Code: 201}, nil
}

func (s *service) FindPetsByStatus(ctx context.Context, status string) (petstore_v1.ImplResponse, error) {
	s.mu.RLock()
	defer s.mu.RUnlock()

	var results []petstore_v1.Pet
	for _, pet := range s.pets {
		if pet.Status == status {
			results = append(results, pet)
		}
	}
	return petstore_v1.ImplResponse{Code: 200, Body: results}, nil
}

func (s *service) FindPetsByTags(ctx context.Context, tags []string) (petstore_v1.ImplResponse, error) {
	s.mu.RLock()
	defer s.mu.RUnlock()

	tagSet := make(map[string]struct{})
	for _, tag := range tags {
		tagSet[tag] = struct{}{}
	}

	var results []petstore_v1.Pet
	for _, pet := range s.pets {
		for _, petTag := range pet.Tags {
			if _, found := tagSet[petTag.Name]; found {
				results = append(results, pet)
				break
			}
		}
	}
	return petstore_v1.ImplResponse{Code: 200, Body: results}, nil
}

func (s *service) GetPetById(ctx context.Context, id int64) (petstore_v1.ImplResponse, error) {
	s.mu.RLock()
	defer s.mu.RUnlock()

	pet, exists := s.pets[id]
	if !exists {
		return petstore_v1.ImplResponse{Code: 404}, errors.New("pet not found")
	}
	return petstore_v1.ImplResponse{Code: 200, Body: pet}, nil
}

func (s *service) UpdatePetWithForm(ctx context.Context, id int64, name string, status string) (petstore_v1.ImplResponse, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	pet, exists := s.pets[id]
	if !exists {
		return petstore_v1.ImplResponse{Code: 404}, errors.New("pet not found")
	}
	if name != "" {
		pet.Name = name
	}
	if status != "" {
		pet.Status = status
	}
	s.pets[id] = pet
	return petstore_v1.ImplResponse{Code: 200}, nil
}

func (s *service) DeletePet(ctx context.Context, id int64, apiKey string) (petstore_v1.ImplResponse, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	if _, exists := s.pets[id]; !exists {
		return petstore_v1.ImplResponse{Code: 404}, errors.New("pet not found")
	}
	delete(s.pets, id)
	return petstore_v1.ImplResponse{Code: 204}, nil
}

func (s *service) UploadFile(ctx context.Context, id int64, additionalMetadata string, file *os.File) (petstore_v1.ImplResponse, error) {
	s.mu.RLock()
	defer s.mu.RUnlock()

	if _, exists := s.pets[id]; !exists {
		return petstore_v1.ImplResponse{Code: 404}, errors.New("pet not found")
	}
	// Fake upload handling
	info, err := file.Stat()
	if err != nil {
		return petstore_v1.ImplResponse{Code: 500}, fmt.Errorf("failed to stat file: %w", err)
	}

	uploadInfo := map[string]interface{}{
		"filename": info.Name(),
		"size":     info.Size(),
		"metadata": additionalMetadata,
	}

	return petstore_v1.ImplResponse{Code: 200, Body: uploadInfo}, nil
}

func main() {
	var addr string
	flag.StringVar(&addr, "addr", "127.0.0.1:8080", "address to listen on")
	flag.Parse()

	s := newService()

	router := petstore_v1.NewRouter(
		petstore_v1.NewPetAPIController(s),
	 	// petstore_v1.NewStoreAPIController(s),
		// petstore_v1.NewUserAPIController(s),
	)

	log.Printf("Server started on http://%s ...", addr)
	log.Fatal(http.ListenAndServe(addr, router))
}
