package FristTest;

import java.net.*;
import java.util.*;
import java.io.*;

final class HttpRequest implements Runnable {
	final static String CRLF = "\r\n";
	Socket socket;

	public HttpRequest(Socket socket) throws Exception {
		this.socket = socket;
	}

	public void run() {
		try {
			processRequest();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	private void processRequest() throws Exception {
		InputStream is = socket.getInputStream();
		DataOutputStream os = new DataOutputStream(socket.getOutputStream());
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		String requestLine = br.readLine();
		System.out.println();
		System.out.println(requestLine);
		String headerLine = null;
		while ((headerLine = br.readLine()).length() != 0) {
			System.out.println(headerLine);
		}
		// ������������ȡ���ļ���
		StringTokenizer tokens = new StringTokenizer(requestLine);
		tokens.nextToken();// ����method
		String fileName = tokens.nextToken();
		fileName = "." + fileName;// ���������ļ���
		FileInputStream fis = null;
		boolean fileExists = true; // �ж���������Ƿ����
		try {
			fis = new FileInputStream(fileName);
		} catch (FileNotFoundException e) {
			fileExists = false;
		}
		String statusLine = null;
		String contentTypeLine = null;
		String entityBody = null;
		if (fileExists) {// �����ļ����ڹ�����Ӧ��status �� contentType
			statusLine = "HTTP/1.1 200 OK" + CRLF;
			contentTypeLine = "Content-type: " + contentType(fileName) + CRLF;
		} else {// �����ļ�������
			statusLine = "HTTP/1.1 404" + CRLF;
			contentTypeLine = "Content-type: " + contentType(fileName) + CRLF;
			entityBody = "<!DOCTYPE html><HTML>" + "<HEAD><TITLE>Not Found</TITLE></HEAD>"
					+ "<BODY>Not Found</BODY></HTML>";
		}
		os.writeBytes(statusLine);
		os.writeBytes(contentTypeLine);
		os.writeBytes(CRLF);
		if (fileExists) {
			sendBytes(fis, os);
			fis.close();
		} else {
			os.writeBytes(entityBody);
		}
		os.close();
		br.close();
		socket.close();
	}

	private static void sendBytes(FileInputStream fis, OutputStream os) throws Exception {
		byte[] buffer = new byte[1024];
		int bytes = 0;
		while ((bytes = fis.read(buffer)) != -1) {
			os.write(buffer, 0, bytes);
		}
	}

	private static String contentType(String fileName) {// �����ļ���������Ӧ��contentType
		if (fileName.endsWith(".htm") || fileName.endsWith(".html")) {
			return "text/html";
		}
		if (fileName.endsWith(".jpg") || fileName.endsWith(".jpeg")) {
			return "image/jpeg";
		}
		if (fileName.endsWith(".png")) {
			return "image/png";
		}
		if (fileName.endsWith(".css")) {
			return "text/css";
		}
		if (fileName.endsWith(".gif")) {
			return "image/gif";
		}
		if (fileName.endsWith(".png")) {
			return "image/png";
		}
		return "application/octet-stream";
	}
}
