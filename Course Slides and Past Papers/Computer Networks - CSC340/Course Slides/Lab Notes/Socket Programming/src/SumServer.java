import java.util.*;
import java.net.*;
import java.io.*;

public class SumServer {
    public static void main(String[] args) {
        if(args.length < 1){
            System.out.println("Enter Port Number");
            return;
        }

        int port = Integer.parseInt(args[0]);

        try(ServerSocket serverSocket = new ServerSocket(port)){
            System.out.println("Server listening on port: " + port);

            while(true){
                Socket clientSocket = serverSocket.accept();
                System.out.println("Client Connected: " + clientSocket.getInetAddress().getHostAddress());

                ClientHandler clientHandler = new ClientHandler(clientSocket);
                clientHandler.run();
            }

        }catch (IOException e){
            System.out.println("Client Disconnected: " + e.getMessage());
            e.printStackTrace();
        }

    }

    private static class ClientHandler extends Thread {
        private Socket clientSocket;

        public ClientHandler (Socket socket){
            this.clientSocket = socket;
        }

        public void run(){
            try{
                InputStream input = clientSocket.getInputStream();
                BufferedReader reader = new BufferedReader(new InputStreamReader(input));
                OutputStream output = clientSocket.getOutputStream();
                PrintWriter writer = new PrintWriter(output, true);

                String clientMessage;
                while((clientMessage = reader.readLine()) != null){
                    String[] numbers = clientMessage.split(" ");
                    int num1 = Integer.parseInt(numbers[0]);
                    int num2 = Integer.parseInt(numbers[1]);
                    int result = getsum(num1, num2);
                    writer.println(result);
                }

            }catch (IOException e){
                System.out.println("Client Disconnected: " + clientSocket.getInetAddress().getHostAddress());
            }
        }

        private int getsum(int x, int y){
            return x + y;
        }
    }
}
