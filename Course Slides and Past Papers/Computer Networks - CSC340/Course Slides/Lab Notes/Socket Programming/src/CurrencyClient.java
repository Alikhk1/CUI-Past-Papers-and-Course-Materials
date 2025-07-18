import java.util.*;
import java.net.*;
import java.io.*;


public class CurrencyClient {
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Enter localhost and port");
            return;
        }

        String hostName = args[0];
        int port = Integer.parseInt(args[1]);

        try (Socket socket = new Socket(hostName, port);
             BufferedReader userInputReader = new BufferedReader(new InputStreamReader(System.in));
             PrintWriter serverWriter = new PrintWriter(socket.getOutputStream(), true);
             BufferedReader serverResponseReader = new BufferedReader((new InputStreamReader(socket.getInputStream())));) {

            System.out.println("Connected to the Server. Enter PKR Amount");
            String userInput;

            while((userInput = userInputReader.readLine()) != null){
                serverWriter.println(userInput);

                String serverResponse = serverResponseReader.readLine();
                System.out.println("Server Response: " + serverResponse);


                System.out.println("Enter PKR Amount");
            }

        }catch(IOException e){
            System.out.println("Client exception :" + e.getMessage());
            e.printStackTrace();
        }
    }
}
