package edu.bycheva.stores;

import edu.bycheva.models.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;

@Repository
public class TaskStore implements TaskDAO {
    private final HibernateTemplate template;

    @Autowired
    public TaskStore(HibernateTemplate template) {
        this.template = template;
    }

    @Override
    public Collection<Task> values() {
        return (Collection<Task>) this.template.find("from Task");
    }

    @Override
    @Transactional
    public int add(Task model) {
        return (int)this.template.save(model);
    }

    @Override
    @Transactional
    public void edit(Task model) {
        this.template.update(model);
    }

    @Override
    public Task get(int id) {
        return this.template.get(Task.class, id);
    }

    @Override
    @Transactional
    public void delete(int id) {
        Task task = get(id);
        this.template.delete(task);
    }

    @Override
    public Collection<Task> findAllByName(String name) {
        return (Collection<Task>) this.template.findByNamedParam("from Task where name = :name", "name", name);
    }

    public Collection<Task> findByReady(boolean ready) {

        return (Collection<Task>) this.template.findByNamedParam("from Task where ready = :ready", "ready", ready);
    }
}
