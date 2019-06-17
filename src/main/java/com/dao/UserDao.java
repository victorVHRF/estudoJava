package com.dao;

import java.util.List;
import java.util.Map;

import com.entities.Users;

public interface UserDao {
	public List<Users> getAll(Map<String, String> obj);

	public void delete(Users objConsulta);

	public boolean saveOrUpdate(Users users);

	public List<Users> findByLogin(String login);

	public Users findById(Integer id);

	public void update(Users usuario);
}
