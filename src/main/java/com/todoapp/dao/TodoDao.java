package com.todoapp.dao;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.todoapp.entities.Todo;

@Component
public class TodoDao {

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Transactional
	public int save(Todo t) {

		Integer i = (Integer) this.hibernateTemplate.save(t);
		return i;
	}

	@Transactional
	public int update(Todo t) {

		int i = 0;

		try {
			this.hibernateTemplate.update(t);
			i = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	public Todo getById(int id) {
		return this.hibernateTemplate.get(Todo.class, id);
	}

	@Transactional
	public void deleteById(int id) {
		Todo t = hibernateTemplate.get(Todo.class, id);
		if (t != null)
			hibernateTemplate.delete(t);
	}

	public List<Todo> getAll() {

		List<Todo> allTodo = this.hibernateTemplate.loadAll(Todo.class);
		return allTodo;

	}

}
