package cel

import (
	"testing"

	"github.com/google/cel-go/cel"
	"github.com/google/cel-go/common/types"
	"github.com/stretchr/testify/assert"
)

func TestCEL(t *testing.T) {
	env, err := cel.NewEnv(
		cel.Variable("account", cel.DynType),
		cel.Variable("transaction", cel.DynType),
	)
	if err != nil {
		t.Fatalf("NewEnv error: %s", err)
	}

	ast, issues := env.Compile(`
		account.balance >= transaction.withdrawal
			|| (account.overdraftProtection
			&& account.overdraftLimit >= transaction.withdrawal - account.balance)
	`)
	if issues != nil && issues.Err() != nil {
		t.Fatalf("Compile error: %s", issues.Err())
	}
	prg, err := env.Program(ast)
	if err != nil {
		t.Fatalf("program construction error: %s", err)
	}

	val, _, err := prg.Eval(map[string]any{
		"account": map[string]any{
			"balance":             500,
			"overdraftProtection": false,
		},
		"transaction": map[string]any{
			"withdrawal": 600,
		},
	})
	if err != nil {
		t.Fatalf("eval error: %s", err)
	}
	assert.Equal(t, val, types.Bool(false))
}
