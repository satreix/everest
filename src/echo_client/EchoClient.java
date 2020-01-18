import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class EchoClient {
    public static void main (String args[]) {
        System.out.println("Spinning up the Echo Client in Java...");
        try {
            final Socket socketToServer = new Socket("localhost", 1234);
            final BufferedReader inputFromServer = new BufferedReader(
            new InputStreamReader(socketToServer.getInputStream()));
            final BufferedReader commandLineInput = new BufferedReader(new InputStreamReader(System.in));
            System.out.println("Waiting on input from the user...");
            final String inputFromUser = commandLineInput.readLine();
            if (inputFromUser != null) {
                System.out.println("Received by Java: " + inputFromUser);
                final PrintWriter outputToServer = new PrintWriter(socketToServer.getOutputStream(), true);
                outputToServer.println(inputFromUser);
                System.out.println(inputFromServer.readLine());
            }
            socketToServer.close();
        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
    }
}
