<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="tasksUrl" value="${pageContext.request.contextPath}/list/tasks"/>
<c:set var="currentUrl" value="${tasksUrl}"/>
<c:set var="compound" value="?"/>
<c:if test="${!empty pageContext.request.getParameter('filter')}">
    <c:set var="currentUrl" value="${currentUrl}?filter=${pageContext.request.getParameter('filter')}"/>
    <c:set var="compound" value="&"/>
</c:if>

<t:template>
    <form:form class="form-edit" action="${pageContext.request.contextPath}/list/editTask" method="post" modelAttribute="task">
        <input type="hidden" name="id" value="${task.id}"/>
        <div class="form-group">
            <label for="name">Название задания *</label>
            <input type="text" class="form-control" name="name" id="name" value="${task.name}"/>
        </div>
        <div class="form-group">
            <label for="description">Описание задания</label>
            <textarea class="form-control" name="description" id="description">${task.description}</textarea>
        </div>
        <div class="form-group">
            <label for="priority">Приоритет</label>
            <select id="priority" name="priority">
                <c:forEach items="${priorities}" var="prior">
                    <c:if test="${prior == task.priority}">
                        <option value="${prior}" selected>${prior}</option>
                    </c:if>
                    <c:if test="${prior != task.priority}">
                        <option value="${prior}">${prior}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" name="ready" checked="${task.ready}"> Выполнено
            </label>
        </div>
        <button type="submit" class="btn btn-default">Изменить</button>
    </form:form>
</t:template>
