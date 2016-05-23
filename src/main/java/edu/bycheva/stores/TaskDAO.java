package edu.bycheva.stores;

import edu.bycheva.models.Task;

public interface TaskDAO extends Storage<Task> {
    public static final int MAX_PAGE_ON_PAGE = 20;
}
