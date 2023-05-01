# Echo service

## Deploy to kubernetes

Apply these:

```bash
bazel run src/go/echo:dev.apply
bazel run src/go/echo:dev-ingress.apply
bazel run src/go/echo:dev-service.apply
```

And test:

```bash
# https://github.com/fullstorydev/grpcurl
echo '{"name": "foo"}' | grpcurl -d @ echo.satreix.com:443 helloworld.Greeter/SayHello
```
