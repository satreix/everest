# Bookstore service

## Dev

Run the server and use [grpcui][] or [grpcurl][]:

```console
# run server
$ bazel run src/go/bookstore/cmd/server

# run client UI
$ grpcui --plaintext localhost:50051
```

[grpcui]: https://github.com/fullstorydev/grpcui
[grpcurl]: https://github.com/fullstorydev/grpcurl
