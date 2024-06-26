package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.User;
import com.csmtech.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public boolean findUserByUsernameAndPassword(String username, String password) {
		
		User user=userRepository.findUserByUsernameAndPassword(username,password);
		if(user!=null)
		{
			return true;
		}
		else {
			return false;
		}
		
	}

	@Override
	public User saveDetailsOfUser(User newuser) {
		
		return userRepository.save(newuser);
	}

	
	@Override
	public int findRoleIdByUsernameAndPassword(String username, String password) {
		
		return userRepository.getRoleIdByUsernameAndPassword(username,password);
	}

	@Override
	public List<User> getAllUser() {
		
		return userRepository.getAllUserNotDeleted();
	}

	@Override
	public void deleteUserById(Integer userId) {
		
		userRepository.deleteUserById(userId);
	}

	@Override
	public User findUserDetailsById(Integer userId) {
		
		return userRepository.findUserDetailsById(userId);
	}

	@Override
	public User findUserByUsernameAndPasswordForCheck(String username, String password) {
		
		return userRepository.findUserByUsernameAndPasswordForCheck(username,password);
	}

}
