package edu.bycheva.models;

public class Task extends Base {

    private String name;
    private String description;
    private TaskPriority priority;
    private boolean ready;

    public Task() {}

    public Task(int id, String name, String description, TaskPriority priority, boolean ready) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.priority = priority;
        this.ready = ready;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public TaskPriority getPriority() {
        return this.priority;
    }

    public void setPriority(TaskPriority priority) {
        this.priority = priority;
    }

    public boolean isReady() {
        return this.ready;
    }

    public void setReady(boolean ready) {
        this.ready = ready;
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + id +
                ", name='" + name +
                ", description='" + description +
                ", priority=" + priority +
                ", ready=" + ready +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Task task = (Task) o;

        if (ready != task.ready) return false;
        if (name != null ? !name.equals(task.name) : task.name != null) return false;
        if (description != null ? !description.equals(task.description) : task.description != null) return false;
        return priority == task.priority;

    }

    @Override
    public int hashCode() {
        int result = name != null ? name.hashCode() : 0;
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (priority != null ? priority.hashCode() : 0);
        result = 31 * result + (ready ? 1 : 0);
        return result;
    }
}
