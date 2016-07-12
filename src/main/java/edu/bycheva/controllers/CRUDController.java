package edu.bycheva.controllers;

import edu.bycheva.models.Task;
import edu.bycheva.stores.Storages;
import edu.bycheva.stores.TaskDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/list")
public class CRUDController {

    @Autowired
    private Storages storages;

    @RequestMapping(value = "/tasks", method = RequestMethod.GET)
    public String showTasks(@RequestParam(value = "filter", required = false) String filter,
                            @RequestParam(value = "page", required = false) String pageNum,
                            ModelMap model){
        PagedListHolder<Task> taskList = new PagedListHolder<Task>();
        if(filter != null) //если фильтруем по готовности заданий
        {
            taskList.setSource((List<Task>) this.storages.taskStore.findByReady(Boolean.valueOf(filter)));
        }else {
            taskList.setSource((List<Task>) this.storages.taskStore.values());
        }

        //переходим на необходимую страницу
        int page = 0;
        if(pageNum != null){
            if(pageNum.equals("prev")) {
                taskList.previousPage();
            }
            else if(pageNum.equals("next")) {
                taskList.nextPage();
            }
            else {
                page = Integer.valueOf(pageNum) == 0 ? 0 : Integer.valueOf(pageNum)-1;
                taskList.setPage(page);
            }
        }

        model.addAttribute("SearchTaskController_taskList",taskList);
        model.addAttribute("tasks",taskList.getPageList());
        model.addAttribute("priorities", this.storages.taskPriorityStore.values());
        model.addAttribute("pageCount", calcPageCount(taskList.getPageCount()));
        model.addAttribute("page", taskList.getPage());
        return "Taskslist";
    }

    private int calcPageCount(int pageCount) {
        return pageCount > TaskDAO.MAX_PAGE_ON_PAGE ? TaskDAO.MAX_PAGE_ON_PAGE : pageCount;
    }


    @RequestMapping(value = "/addTask", method = RequestMethod.POST)
    public String addTask(@ModelAttribute Task task, ModelMap model){
        this.storages.taskStore.add(task);
        return "redirect: tasks";
    }

    @RequestMapping(value = "/editTask", method = RequestMethod.GET)
    public String getEditingTask(@RequestParam("id") String id, ModelMap model){
        Task task = this.storages.taskStore.get(Integer.valueOf(id));

        model.addAttribute("task", task);
        model.addAttribute("priorities", this.storages.taskPriorityStore.values());

        return "EditTask";
    }

    @RequestMapping(value = "/editTask", method = RequestMethod.POST)
    public String editTask(@ModelAttribute Task task, ModelMap model){
        this.storages.taskStore.edit(task);
        return "redirect: tasks";
    }

    @RequestMapping(value = "/deleteTask", method = RequestMethod.GET)
    public String deleteTask(@RequestParam(value = "id", required = false) String id,
                             @RequestParam(value = "filter", required = false) String filter,
                             @RequestParam(value = "page", required = false) String pageNum,
                             ModelMap model){
        if(id == null){
            return "redirect: tasks";
        }
        String[] uid = id.split(",");
        for(String idx: uid) {
            this.storages.taskStore.delete(Integer.valueOf(idx));
        }

        String url = "redirect: " + createURL(filter, pageNum);
        return url;
    }

    @RequestMapping(value = "/setReady", method = RequestMethod.GET)
    public String getEditingTask(@RequestParam(value = "id", required = false) String id,
                                 @RequestParam(value = "filter", required = false) String filter,
                                 @RequestParam(value = "page", required = false) String pageNum,
                                 ModelMap model){
        if(id == null){
            return "redirect: tasks";
        }
        String[] uid = id.split(",");
        for(String idx: uid){
            Task task = this.storages.taskStore.get(Integer.valueOf(idx));
            task.setReady(true);
            this.storages.taskStore.edit(task);
        }

        String url = "redirect: " + createURL(filter, pageNum);
        return url;
    }

    private String createURL(String filter, String pageNum) {
        StringBuilder sb = new StringBuilder("tasks");

        if(filter == null || filter.isEmpty() || filter.equals(" ")){
            if(pageNum != null){
                sb.append("?page=").append(pageNum);
            }
        }else{
            sb.append("?filter=").append(filter);
            if(pageNum != null){
                sb.append("&page=").append(pageNum);
            }
        }

        return sb.toString();
    }


}
