package echo.client;

import com.example.helloworld.GreeterGrpc;
import com.example.helloworld.HelloRequest;

import io.grpc.Channel;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;

import java.util.concurrent.TimeUnit;

public class Client {
    private final GreeterGrpc.GreeterBlockingStub blockingStub;

    public Client(Channel channel) {
        blockingStub = GreeterGrpc.newBlockingStub(channel);
    }

    public void greet(String name) {
        HelloRequest req = HelloRequest.newBuilder().setName(name).build();
        System.out.println(blockingStub.sayHello(req).getMessage());
    }

    static void usage() {
        System.err.println("Usage: client TARGET NAME");
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 2) {
            usage();
            System.exit(1);
        }

        String target = args[0];
        String name = args[1];

        if (name.equals("")) {
            System.err.println("error: empty name");
            usage();
            System.exit(1);
        }

        ManagedChannel channel = ManagedChannelBuilder.forTarget(target).usePlaintext().build();
        try {
            Client client = new Client(channel);
            client.greet(name);
        } finally {
            // ManagedChannels use resources like threads and TCP connections. To prevent leaking
            // these
            // resources the channel should be shut down when it will no longer be used. If it may
            // be used
            // again leave it running.
            channel.shutdownNow().awaitTermination(5, TimeUnit.SECONDS);
        }
    }
}
