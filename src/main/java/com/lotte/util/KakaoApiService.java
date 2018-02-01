package com.lotte.util;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

@Service
public class KakaoApiService {
	
	public static int sendMesageAPI(String meesagePlatformUrl, String send_phone, String authKey, String sender_key,
			String message) throws Exception {

		CloseableHttpClient httpclient = HttpClients.createDefault();
		try {
			HttpPost httpPost = new HttpPost(meesagePlatformUrl);
			
			String myPhone = "01035660203";
			
			httpPost.setHeader("Authorization", "Basic " + authKey);
			httpPost.setHeader("Content-Type", "application/json; charset=EUC-KR");
			String body2 = "{ \"msg_id\" : \"iot\", \"dest_phone\" : \"" + send_phone + "\", \"send_phone\" : \""
					+ myPhone + "\", \"sender_key\" : \"" + sender_key + "\", \"msg_body\" : \"" + message
					+ "\", \"ad_flag\" : \"N\" }";

			ByteArrayEntity entity = new ByteArrayEntity(body2.getBytes("UTF-8"));

			httpPost.setEntity(entity);

			CloseableHttpResponse res = httpclient.execute(httpPost);

			try {
				if (res.getStatusLine().getStatusCode() == 200) {
					org.apache.http.HttpEntity entity2 = (org.apache.http.HttpEntity) res.getEntity();
					System.out.println(EntityUtils.toString(entity2));
				} else {
					System.out.println("eerr");
				}
			} finally {
				res.close();
			}
		} finally {
			httpclient.close();
		}
		return 0;

	}

}
