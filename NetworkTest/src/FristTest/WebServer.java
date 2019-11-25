package FristTest;

import java.net.*;
import java.util.*;
import java.io.*;


public class WebServer {
	public static void main(String argv[]) throws Exception {
		int port = 8888;// ¶¨Òå¶Ë¿ÚºÅ
		ServerSocket welcomeSocket = new ServerSocket(port);
		while (true) {
			Socket connectionSocket = welcomeSocket.accept();
			HttpRequest request = new HttpRequest(connectionSocket);
			Thread thread = new Thread(request);
			thread.start();
		}
	}
}
