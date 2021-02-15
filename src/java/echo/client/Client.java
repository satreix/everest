package src.java.echo.client;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import src.java.echo.client.transmission_object.TransmissionObject;

public class Client {
    public static void main(String[] args) {
        if (args.length != 2) {
            usage();
            System.exit(1);
        }

        String host = "localhost";
        int port = Integer.parseInt(args[0]);
        String inputFromUser = args[1];
        System.err.println("Received by Java: " + inputFromUser);

        if (inputFromUser.equals("")) {
            System.err.println("error: empty message");
            usage();
            System.exit(1);
        }

        System.err.println("Spinning up the Echo Client in Java...");
        try {
            final Socket socketToServer = new Socket(host, port);
            TransmissionObject to = new TransmissionObject();
            to.message = inputFromUser;
            GsonBuilder builder = new GsonBuilder();
            Gson gson = builder.create();

            final PrintWriter o = new PrintWriter(socketToServer.getOutputStream(), true);
            o.println(gson.toJson(to));

            final BufferedReader i =
                    new BufferedReader(new InputStreamReader(socketToServer.getInputStream()));
            System.out.println(i.readLine());
            socketToServer.close();
        } catch (Exception e) {
            System.err.println("Error: " + e);
            System.exit(1);
        }
    }

    static void usage() {
        System.err.println("Usage: client PORT MESSAGE");
    }
}
