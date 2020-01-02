package main

import (
	"errors"
	"fmt"
	"github.com/keybase/go-keychain"
)

func getConfig() (string, string, error) {
	service := "feedly-dev-token"

	accounts, err := keychain.GetGenericPasswordAccounts(service)
	if err != nil {
		return "", "", err
	}

	if len(accounts) != 1 {
		return "", "", fmt.Errorf("found %d account(s)", len(accounts))
	}

	password, err := keychain.GetGenericPassword(service, accounts[0], "", "")
	if err != nil {
		return "", "", err
	}

	if password == nil {
		return "", "", errors.New("password not found")
	}

	return accounts[0], string(password), nil
}
