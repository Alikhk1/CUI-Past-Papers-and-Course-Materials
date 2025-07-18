import java.io.*;
import java.net.*;
import java.util.*;

public class MulClient {
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Enter localhost and Port");
            return;
        }

        String localhost = args[0];
        int port = Integer.parseInt(args[1]);

        try (Socket clientSocket = new Socket(localhost, port);
             BufferedReader userInputReader = new BufferedReader(new InputStreamReader(System.in));
             PrintWriter serverWriter = new PrintWriter(clientSocket.getOutputStream(), true);
             BufferedReader serverResponseReader = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));) {

            System.out.println("Connected to Server");
            System.out.println("Enter 2 Numbers separated by space");
            String userInput;
            while((userInput = userInputReader.readLine()) != null){
                serverWriter.println(userInput);

                String serverResponse = serverResponseReader.readLine();

                System.out.println("The result of Multiplication is: " + serverResponse);
                System.out.println("Enter 2 numbers Separated by a space");
            }

        }catch (IOException e){
            System.out.println("Client Exception: " + e.getMessage());
            e.printStackTrace();
        }
    }

}
