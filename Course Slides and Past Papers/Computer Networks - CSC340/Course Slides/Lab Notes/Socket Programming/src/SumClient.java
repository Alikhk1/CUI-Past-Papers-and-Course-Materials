import java.io.*;
import java.net.*;
import java.util.*;

public class SumClient {
    public static void main(String[] args) {
        if (args.length < 2){
            System.out.println("Enter localhost and Port");
            return;
        }

        String localhost = args[0];
        int port = Integer.parseInt(args[1]);

        try(Socket socket = new Socket(localhost,port);
            BufferedReader userInputReader = new BufferedReader(new InputStreamReader(System.in));
            PrintWriter serverWriter = new PrintWriter(socket.getOutputStream(), true);
            BufferedReader serverResponseReader = new BufferedReader(new InputStreamReader(socket.getInputStream()))){

            System.out.println("Connected to Server, Enter 2 numbers with a space");
            String userInput;
            while ((userInput = userInputReader.readLine()) != null){
                serverWriter.println(userInput);

                String serverResponse = serverResponseReader.readLine();

                System.out.println("The sum is " + serverResponse);
                System.out.println("Enter 2 Numbers with a Space");
            }

        }catch (IOException e){
            System.out.println("Client Exception: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
