package com.services;

import java.util.List;
import java.util.Map;

import com.entities.Users;

public interface UserService {
	
	public Users getById(Integer id);
	
	public List<Users> getAll(Map<String, String> obj);

	public void delete(Integer id);

	public void saveOrUpdate(Users users) throws Exception;

	public void editarUsuario(Integer id, Users usuario);
}