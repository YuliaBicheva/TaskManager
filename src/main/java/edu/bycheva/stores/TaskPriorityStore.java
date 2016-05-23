package edu.bycheva.stores;

import edu.bycheva.models.TaskPriority;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.Arrays;
import java.util.Collection;

@Repository
public class TaskPriorityStore implements TaskPriorityDAO {
    private final HibernateTemplate template;

    @Autowired
    public TaskPriorityStore(HibernateTemplate template) {
        this.template = template;
    }

    @Override
    public Collection<TaskPriority> values() {
        return Arrays.asList(TaskPriority.values());
    }

    @Override
    public int add(TaskPriority model) {
        throw new UnsupportedOperationException("TaskPriority addition not supported");
    }

    @Override
    public void edit(TaskPriority model) {
        throw new UnsupportedOperationException("TaskPriority editing not supported");
    }

    @Override
    public TaskPriority get(int id) {
        return TaskPriority.values()[id];
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("TaskPriority deleting not supported");
    }

    @Override
    public Collection<TaskPriority> findAllByName(String name) {
        throw new UnsupportedOperationException("TaskPriority finding by name not supported");
    }
}
