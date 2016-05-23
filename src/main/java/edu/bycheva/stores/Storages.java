package edu.bycheva.stores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Storages {

    public final TaskStore taskStore;
    public final TaskPriorityStore taskPriorityStore;

    @Autowired
    public Storages(TaskStore taskStore, TaskPriorityStore taskPriorityStore) {
        this.taskStore = taskStore;
        this.taskPriorityStore = taskPriorityStore;
    }
}
