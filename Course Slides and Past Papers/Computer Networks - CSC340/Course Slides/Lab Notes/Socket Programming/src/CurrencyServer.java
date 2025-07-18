import java.net.*;
import java.io.*;
import java.util.*;

public class CurrencyServer {
    public static void main(String[] args) throws IOException {
        if (args.length < 1) {
            System.out.println("Enter port number");
            return;
        }

        int port = Integer.parseInt(args[0]);

        try (ServerSocket serverSocket = new ServerSocket(port)) {
            System.out.println("Server Listening on port: " + port);

            while (true) {
                Socket clientSocket = serverSocket.accept();
                System.out.println("Client Connected: " + clientSocket.getInetAddress().getHostAddress());
                ClientHandler clientHandler = new ClientHandler(clientSocket);
                clientHandler.start();
            }

        } catch (IOException e) {
            System.out.println("Server Exception " + e.getMessage());
            e.printStackTrace();

        }
    }


    private static class ClientHandler extends Thread {

        private Socket clientSocket;
        public ClientHandler (Socket socket){
            this.clientSocket = socket;
        }

        public void start(){
            try{
                InputStream input = clientSocket.getInputStream();
                BufferedReader reader = new BufferedReader(new InputStreamReader(input));
                OutputStream output = clientSocket.getOutputStream();
                PrintWriter writer  = new PrintWriter(output,true);

                String clientMessage;
                while((clientMessage = reader.readLine()) != null){
                    double pkrAmount = Double.parseDouble(clientMessage);
                    double usdAmount = pkrAmount * 	0.00359;
                    double euroAmount = pkrAmount * 0.0033;

                    writer.println("USD: "+ usdAmount + "EURO: " + euroAmount);

                }
            }catch(IOException e){
                System.out.println("Client Disconnected: "+ clientSocket.getInetAddress().getHostAddress());
            }
        }

    }
}