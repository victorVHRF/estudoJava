package com.daoImpl;

import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.UserDao;
import com.entities.Users;

@Transactional
@Repository

public class UserDaoImpl implements UserDao {

	@Autowired
	SessionFactory session;

	public void delete(Users objLocalizado) {
		session.getCurrentSession().delete(objLocalizado);

	}

	public boolean saveOrUpdate(Users users) {
		session.getCurrentSession().saveOrUpdate(users);
		return true;
	}

	public List<Users> findByLogin(String login) {
		@SuppressWarnings("unchecked")
		List<Users> resultado = (List<Users>) session.getCurrentSession()
				.createQuery("from Users as u where u.userLogin like '%" + login + "%'").list();
		return resultado;
	}

	@SuppressWarnings("unchecked")
	public List<Users> getAll(Map<String, String> obj) {

		String hql = "from Users u";

		if (obj.get("userName") != null && obj.get("userName") != "") {
			hql = hql + " where u.userName = '" + obj.get("userName")+"'";
		}

		if (obj.get("userLogin") != null && obj.get("userLogin") != "") {
			if (!hql.contains("where")) {
				hql = hql + " where u.userLogin = '" + obj.get("userLogin")+"'";
			} else {
				hql = hql + " and u.userLogin = '" + obj.get("userLogin")+"'";
			}

		}
		if (obj.get("email") != null && obj.get("email") != "") {
			if (!hql.contains("where")) {
				hql = hql + " where u.email = '" + obj.get("email")+"'";
			} else {
				hql = hql + " and u.email = '" + obj.get("email")+"'";
			}
		}

		return (List<Users>) session.getCurrentSession().createQuery(hql).list();

	}

	// Busca usuário pelo ID
	public Users findById(Integer id) {
		Users objLocalizado = (Users) session.getCurrentSession().createQuery("from Users as u where u.id =" + id)
				.list().get(0);
		return objLocalizado;
	}

	public void update(Users usuario) {
		session.getCurrentSession().update(usuario);
	}
}
