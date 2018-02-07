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

	public static final String subscriptionKey = "e02f25431e33433996a7ec0d3c265d9c";
	public static final String uriBase = "https://eastasia.api.cognitive.microsoft.com/face/v1.0/detect";

		
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

			FileEntity reqEntity = new FileEntity(convert(file), ContentType.APPLICATION_OCTET_STREAM);
			request.setEntity(reqEntity);

			HttpResponse response = httpclient.execute(request);
			HttpEntity entity = response.getEntity();

			if (entity != null) {
				// Format and display the JSON response.

				String jsonString = EntityUtils.toString(entity).trim();
				
				JSONArray arr = new JSONArray(jsonString);
				JSONObject faceAttributes = arr.getJSONObject(0).getJSONObject("faceAttributes");
				
				String gender = faceAttributes.getString("gender");
				Integer age = faceAttributes.getInt("age");
				
				faceResult.put("age", Integer.toString(age));
				faceResult.put("gender",gender);
				
				System.out.println("gender : " + gender);
				System.out.println("age : " + age);
				
			}
			else {
				faceResult.put("age", "not");
				faceResult.put("gender","not");
				
				System.out.println("ageHash : " +faceResult.get("age"));
				System.out.println("genderHash : " +faceResult.get("gender"));
				
			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
			// Display error message.
		}
		
		return faceResult;
	}

	public File convert(MultipartFile file) throws IOException {
		File convFile = new File("/usr/ldcc/"+file.getOriginalFilename());
		System.out.println(file.getOriginalFilename());
		convFile.createNewFile();
		FileOutputStream fos = new FileOutputStream(convFile);
		fos.write(file.getBytes());
		fos.close();
		return convFile;
	}
}
