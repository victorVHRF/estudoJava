package com.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.entities.Users;
import com.services.UserService;

@Controller
@RequestMapping(value = "users")
public class UserController {

	@Autowired
	UserService _userService;
	
	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getConsulta(@RequestParam Map<String, String> obj, ModelMap model) {
		model.addAttribute("lista", _userService.getAll(obj));
		ModelAndView view = new ModelAndView("usuarios/consultar");
		return view;
	}

	@RequestMapping(value = "/cadastrar", method = RequestMethod.GET)
	public ModelAndView getPage(ModelMap model) {
		model.addAttribute("obj", new Users());
		ModelAndView view = new ModelAndView("usuarios/cadastrar");
		return view;
	}

	@RequestMapping(value = "/cadastrar", method = { RequestMethod.POST })
	public String insert(@ModelAttribute("obj") Users obj, RedirectAttributes ra, ModelMap model) {

		if (obj != null) {
			try {
				_userService.saveOrUpdate(obj);
				ra.addFlashAttribute("message", "Registro cadastrado com sucesso!");
			} catch (Exception e) {
				ra.addFlashAttribute("message", e.getMessage());
			}
		} else {
			ra.addFlashAttribute("message", "Nenhum dado foi selecionado!");
		}

		return "redirect:/users";
	}

	@RequestMapping(value = "/delete/{id}", method = { RequestMethod.DELETE })
	public @ResponseBody String delete(@PathVariable("id") int id, RedirectAttributes ra) {
		try {
			_userService.delete(id);
			return "Usuário deletado com sucesso!";
		} catch (Exception e) {
			return "Erro ao excluir o usuário!";
		}
	}

	@RequestMapping(value = "/editar/{id}", method = { RequestMethod.GET })
	public ModelAndView editar(@PathVariable("id") int id, RedirectAttributes ra, ModelMap model) {
		model.addAttribute("usuario", _userService.getById(id));
		ModelAndView view = new ModelAndView("usuarios/editar");
		return view;
	}

	@RequestMapping(value = "/editar/{id}", method = { RequestMethod.POST })
	public String editar(@PathVariable("id") Integer id, @ModelAttribute("obj") Users usuario, RedirectAttributes ra)
			throws Exception {
		_userService.editarUsuario(id, usuario);
		ra.addFlashAttribute("message", "Usuário editado com sucesso!");
		return "redirect:/users";

	}

}
