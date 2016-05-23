package edu.bycheva.stores;

import java.util.Collection;

public interface Storage<T> {

    Collection<T> values();

    int add(T model);

    void edit(T model);

    T get(int id);

    void delete(int id);

    Collection<T> findAllByName(String name);

}
