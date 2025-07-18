import java.io.*;
import java.net.*;
import java.util.*;



public class PalindromeClient {
    public static void main(String[] args) throws IOException {
        if (args.length < 2) {
            System.out.println("Enter localhost and port");
            return;
        }

        String localhost = args[0];
        int port = Integer.parseInt(args[1]);

        try (Socket socket = new Socket(localhost, port);
             BufferedReader userInputReader = new BufferedReader(new InputStreamReader(System.in));
             PrintWriter serverWriter = new PrintWriter(socket.getOutputStream(), true);
             BufferedReader serverResponseReader = new BufferedReader(new InputStreamReader(socket.getInputStream()))) {

            System.out.println("Connected to Server, Enter the Word");
            String userInput;
            while ((userInput = userInputReader.readLine()) != null) {
                serverWriter.println(userInput);

                String serverResponse = serverResponseReader.readLine();
                System.out.println("Server Response: " + serverResponse);

                System.out.println("Enter the word");
            }
        } catch (IOException e) {
            System.out.println("Client Exception: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
