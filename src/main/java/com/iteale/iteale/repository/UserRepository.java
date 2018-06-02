package com.iteale.iteale.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.iteale.iteale.User;

public interface UserRepository extends JpaRepository<User, Long> {
	public User findById(int id);
	public List<User> findByName(String name);
	public User findByEmail(String email);
}
