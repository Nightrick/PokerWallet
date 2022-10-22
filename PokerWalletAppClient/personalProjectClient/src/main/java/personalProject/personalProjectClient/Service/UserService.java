package personalProject.personalProjectClient.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import personalProject.personalProjectClient.Models.UserResponse;

@Service
public class UserService {
	
	@Value("${pokerwalletapi.baseUrl}")
	private String baseUrl;
	private RestTemplate restTemplate = new RestTemplate();
	
	public UserResponse findByUsername(String username) {
		String url = baseUrl + "/findByUsername/" + username;
		UserResponse response = restTemplate.getForObject(url, UserResponse.class, username);
		return response;
	}
	
	public ArrayList<UserResponse> findAllUsers() {
		String url = baseUrl + "/findAllUsers";
		UserResponse[] arr = restTemplate.getForObject(url, UserResponse[].class);
		ArrayList<UserResponse> result = new ArrayList<>();
		for (int i = 0; i < arr.length; i++) {
			result.add(arr[i]);
		}
		return result;
	}
	
	public void createUser(UserResponse user) {
		String url = baseUrl + "/createUser";
		restTemplate.postForObject(url, user, UserResponse.class);
	}
	

}
