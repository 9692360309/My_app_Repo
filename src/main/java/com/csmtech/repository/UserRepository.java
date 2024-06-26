package com.csmtech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.csmtech.model.User;


@Repository
public interface UserRepository extends JpaRepository<User, Integer>{

	@Query("SELECT u From  User u where u.username=:username and u.password=:password")
	User findUserByUsernameAndPassword(@Param("username") String username,@Param("password") String password);
	

	@Query("SELECT role.roleId From  User where username=:username and password=:password")
	int getRoleIdByUsernameAndPassword(@Param("username") String username,@Param("password") String password);

	@Query("From User where isDelete='No'")
	List<User> getAllUserNotDeleted();

	@Transactional
	@Modifying
	@Query("Update User set isDelete='Yes' where userId=:userId")
	void deleteUserById(Integer userId);

	@Query(nativeQuery = true, value = "select * from Users where userId=:userId")
	User findUserDetailsById(Integer userId);

	@Query("SELECT u From  User u where u.username=:username and u.password=:password")
	User findUserByUsernameAndPasswordForCheck(@Param("username") String username,@Param("password") String password);
}
