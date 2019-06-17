package com.servicesImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.UserDao;
import com.entities.Users;
import com.services.UserService;

@Service
public class UsersServiceImpl implements UserService {

	@Autowired
	UserDao _userDao;

	public void delete(Integer id) {

		// Verificar se o Usuário é válido
		Users objConsulta = _userDao.findById(id);

		try {
			_userDao.delete(objConsulta);
		} catch (Exception e) {
		}

	}

	public void saveOrUpdate(Users users) throws Exception {
		List<Users> returnBanco = _userDao.findByLogin(users.getUserLogin());
		if (returnBanco.size() == 0) {
			users.setUserAtivo(true);
			_userDao.saveOrUpdate(users);
		} else {
			throw new Exception("Usuário já cadastrado no banco de dados!");
		}
	}

	public List<Users> getAll(Map<String, String> obj) {
		return _userDao.getAll(obj);
	}

	public Users getById(Integer id) {
		// TODO Auto-generated method stub
		return _userDao.findById(id);
	}

	public void editarUsuario(Integer id, Users usuario) {

		// Localizar pessoa a ser alterada
		Users objParaAlterar = _userDao.findById(id);
		objParaAlterar.setEmail(usuario.getEmail());
		objParaAlterar.setUserLogin(usuario.getUserLogin());
		objParaAlterar.setUserName(usuario.getUserName());

		// Alterar os dados do objeto no banco de dados
		_userDao.update(objParaAlterar);

	}
}