package personalProject.personalProjectAPI.Repositories;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Update;

import personalProject.personalProjectAPI.Models.User;

public interface UserRepository extends MongoRepository<User, String>{

	User findByUsername(String username);
	User save(User user);
	@Update("{ '$push' : { 'bankroll' : ?1 } }")
	void findAndPushToUserBankrollByUsername(String username, double bankroll);
	@Update("{ '$push' : { 'netprofit' : ?1 } }")
	void findAndPushToUserNetProfitByUsername(String username, double netProfit);	
}
