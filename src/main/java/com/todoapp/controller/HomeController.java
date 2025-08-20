package com.todoapp.controller;

import com.todoapp.dao.TodoDao;
import com.todoapp.entities.Todo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
public class HomeController {

	@Autowired
	private TodoDao todoDao;

	// Root -> /home
//	@RequestMapping("/")
//	public String index() {
//		return "redirect:/home";
//	}

	@RequestMapping("/home")
	public String home(Model model) {
		model.addAttribute("page", "home");
		List<Todo> allTodo = todoDao.getAll();
		model.addAttribute("allTodo", allTodo);
		return "home"; // -> /WEB-INF/views/home.jsp
	}

	@RequestMapping("/add")
	public String addTodo(Model model) {
		model.addAttribute("page", "add");
		model.addAttribute("todo", new Todo());
		return "home";
	}

	@PostMapping("/saveTodo")
	public String saveTodo(@ModelAttribute("todo") Todo todo, Model model) {
		todo.setDate(new Date());
		todoDao.save(todo);
		model.addAttribute("msg", "Successfully Added...");
		model.addAttribute("page", "home");
		model.addAttribute("allTodo", todoDao.getAll());
		return "home";
	}

	@GetMapping("/edit/{id}")
	public String editTodo(@PathVariable("id") int id, Model model) {

		Todo todo = todoDao.getById(id);
		model.addAttribute("todo", todo);
		model.addAttribute("page", "edit");
		return "home";
	}

	@PostMapping("/updateTodo")
	public String updateTodo(@ModelAttribute("todo") Todo todo, Model model) {
		todoDao.update(todo);
		model.addAttribute("msg", "Updated Successfully!");
		model.addAttribute("page", "home");
		model.addAttribute("allTodo", todoDao.getAll());
		return "home";
	}

	@GetMapping("/delete/{id}")
	public String deleteTodo(@PathVariable("id") int id, Model model) {
		todoDao.deleteById(id);
		model.addAttribute("msg", "Deleted Successfully!");
		model.addAttribute("page", "home");
		model.addAttribute("allTodo", todoDao.getAll());
		return "home";
	}

}
