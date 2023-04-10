package logging

import (
	"context"
	"fmt"
	"net/http"
	"os"
	"strconv"
	"time"

	"github.com/grpc-ecosystem/go-grpc-middleware/v2/interceptors/logging"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
	"github.com/zenazn/goji/web/mutil"
	"google.golang.org/grpc"
)

// interceptorLogger adapts zerolog logger to interceptor logger.
func interceptorLogger(l zerolog.Logger) logging.Logger {
	return logging.LoggerFunc(func(ctx context.Context, lvl logging.Level, msg string, fields ...any) {
		l = l.With().Fields(fields).Logger()

		switch lvl {
		case logging.LevelDebug:
			l.Debug().Msg(msg)
		case logging.LevelInfo:
			l.Info().Msg(msg)
		case logging.LevelWarn:
			l.Warn().Msg(msg)
		case logging.LevelError:
			l.Error().Msg(msg)
		default:
			panic(fmt.Sprintf("unknown level %v", lvl))
		}
	})
}

func StreamServerInterceptor(logger zerolog.Logger, opts ...logging.Option) grpc.StreamServerInterceptor {
	return logging.StreamServerInterceptor(interceptorLogger(logger), opts...)
}

func UnaryServerInterceptor(logger zerolog.Logger, opts ...logging.Option) grpc.UnaryServerInterceptor {
	return logging.UnaryServerInterceptor(interceptorLogger(logger), opts...)
}

func SetupLogger(debug bool) (zerolog.Logger, error) {
	zerolog.TimeFieldFormat = zerolog.TimeFormatUnix
	zerolog.SetGlobalLevel(zerolog.InfoLevel)
	logger := zerolog.New(os.Stderr).With().
		Timestamp().
		Logger().
		Level(zerolog.InfoLevel)

	if debug {
		logger = logger.Level(zerolog.DebugLevel)
		zerolog.SetGlobalLevel(zerolog.DebugLevel)
	}

	if os.Getenv("PRETTY_LOG") != "" {
		b, err := strconv.ParseBool(os.Getenv("PRETTY_LOG"))
		if err != nil {
			return logger, fmt.Errorf("could not parse bool from PRETTY_LOG value: %w", err)
		}
		if b {
			logger = logger.Output(zerolog.ConsoleWriter{Out: os.Stderr})
		}

		log.Logger = logger
	}

	return logger, nil
}

func HTTPMiddleware(logger zerolog.Logger) func(http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			start := time.Now()
			lw := mutil.WrapWriter(w)
			next.ServeHTTP(lw, r)
			logger.Info().
				Dur("http.duration_ms", time.Since(start)).
				Int("http.status", lw.Status()).
				Str("http.method", r.Method).
				Str("http.path", r.URL.Path).
				Msg("http request")
		})
	}
}
