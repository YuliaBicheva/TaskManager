<%@ tag description="Template Tag" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<ul class="nav nav-tabs filter">
    <li class="filter-all" role="presentation">
        <a href="${pageContext.request.contextPath}/list/tasks" class="btn btn-primary btn-sm" role="button">
            Все задания
        </a>
    </li>
    <li class="filter-not-ready" role="presentation">
        <a href="${pageContext.request.contextPath}/list/tasks?filter=false" class="btn btn-primary btn-sm" role="button">
            Только невыполненные
        </a>
    </li>
    <li class="filter-ready" role="presentation">
        <a href="${pageContext.request.contextPath}/list/tasks?filter=true" class="btn btn-primary btn-sm" role="button">
            Выполненные
        </a>
    </li>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary btn-md right" data-toggle="modal" data-target="#addTask">
        Добавить новое задание
    </button>
</ul>

<!-- Modal -->
<div class="modal fade" id="addTask" tabindex="-1" role="dialog" aria-labelledby="additionTask">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="additionTask">Добавить новое задание</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/list/addTask" method="post">
                    <div class="form-group">
                        <label for="name">Название задания</label>
                        <input type="text" class="form-control" required name="name" id="name" placeholder="Task name">
                    </div>
                    <div class="form-group">
                        <label for="description">Описание задания</label>
                        <textarea class="form-control" name="description" id="description" placeholder="Please enter your description"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="priority">Приоритет</label>
                        <select id="priority" name="priority">
                            <c:forEach items="${priorities}" var="prior">
                                <option value="${prior}">${prior}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="ready"> Выполнено
                        </label>
                    </div>
                    <button type="submit" class="btn btn-default">Добавить</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>