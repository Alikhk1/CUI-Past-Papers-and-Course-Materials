import java.util.*;
import java.io.*;
import java.net.*;


public class PalindromeServer {
    public static void main(String[] args) {
        if(args.length < 1){
            System.out.println("Enter Port number");
            return;
        }

        int port = Integer.parseInt(args[0]);

        try(ServerSocket serverSocket = new ServerSocket(port)){
            System.out.println("Server listening on Port: " + port);

            while (true){
              Socket clientSocket = serverSocket.accept();
                System.out.println("Client connected: " + clientSocket.getInetAddress().getHostAddress());
                ClientHandler clientHandler = new ClientHandler(clientSocket);

                clientHandler.run();
            }

        }catch(IOException e){
            System.out.println("Client Disconnected " + e.getMessage());
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
                    String result = ispalindrome(clientMessage) ? "is a palindrome": "is not a palindrome";
                    writer.println(clientMessage +" " + result);

                }


            }catch(IOException e){
                System.out.println("Client Disconnected: " + clientSocket.getInetAddress().getHostAddress());
            }
        }

        private boolean ispalindrome(String str){
            int left = 0;
            int right = str.length() - 1;
            while(left < right){
                if(str.charAt(left) != str.charAt(right)){
                    return false;
                }
                left ++;
                right --;

            }
            return true;
        }
    }
}


