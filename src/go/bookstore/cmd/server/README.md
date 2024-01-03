# Bookstore server

## Dev

Run the server and use [grpcui][] or [grpcurl][]:

```console
# run server
$ bazel run src/go/bookstore/cmd/server

# run client UI
$ grpcui --plaintext localhost:50051
```

## Todo

- implement pagination (with https://pkg.go.dev/clouditor.io/clouditor/api#PageToken or https://github.com/einride/aip-go/tree/master/pagination)

[grpcui]: https://github.com/fullstorydev/grpcui
[grpcurl]: https://github.com/fullstorydev/grpcurl
