package com.lotte.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URI;
import java.util.HashMap;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.FileEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FaceApiService {

	public static final String subscriptionKey = "d5617c8889434123bfb79e7c1fe55808";
	public static final String uriBase = "https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect";

	public HashMap<String,Object> faceAnalysis(@RequestParam("file") MultipartFile file) {
		
		
		HashMap<String,Object> faceResult = new HashMap<String,Object>();

		HttpClient httpclient = new DefaultHttpClient();

		try {
			URIBuilder builder = new URIBuilder(uriBase);

			// Request parameters. All of them are optional.
			builder.setParameter("returnFaceId", "true");
			builder.setParameter("returnFaceLandmarks", "false");
			builder.setParameter("returnFaceAttributes", "age,gender");

			// Prepare the URI for the REST API call.
			URI uri = builder.build();
			HttpPost request = new HttpPost(uri);

			// Request headers.
			request.setHeader("Content-Type", "application/octet-stream");
			request.setHeader("Ocp-Apim-Subscription-Key", subscriptionKey);

			// Request body.

			System.out.println(file.getName());

			FileEntity reqEntity = new FileEntity(convert(file), ContentType.APPLICATION_OCTET_STREAM);
			request.setEntity(reqEntity);

			HttpResponse response = httpclient.execute(request);
			HttpEntity entity = response.getEntity();
			System.out.println(response.getStatusLine());

			if (entity != null) {
				// Format and display the JSON response.
				System.out.println("REST Response:\n");

				String jsonString = EntityUtils.toString(entity).trim();

				if (jsonString.charAt(0) == '[') {
					JSONArray jsonArray = new JSONArray(jsonString);
					System.out.println(jsonArray.toString(2));
				} else if (jsonString.charAt(0) == '{') {
					JSONObject jsonObject = new JSONObject(jsonString);

					System.out.println(jsonObject.toString(2));
				} else {
					System.out.println(jsonString);
				}
				
				JSONArray arr = new JSONArray(jsonString);
				JSONObject faceAttributes = arr.getJSONObject(0).getJSONObject("faceAttributes");;
				
				String gender = faceAttributes.getString("gender");
				String age = faceAttributes.getString("age");
				
				faceResult.put("age", age);
				faceResult.put("gender",gender);
			}
			else {
				faceResult.put("age", null);
				faceResult.put("gender",null);
			}

		} catch (Exception e) {
			// Display error message.
			System.out.println(e.getMessage());
		}
		
		return faceResult;
	}

	public File convert(MultipartFile file) throws IOException {
		File convFile = new File(file.getOriginalFilename());
		convFile.createNewFile();
		FileOutputStream fos = new FileOutputStream(convFile);
		fos.write(file.getBytes());
		fos.close();
		return convFile;
	}
}
