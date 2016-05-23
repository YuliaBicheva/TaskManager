<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="tasksUrl" value="${pageContext.request.contextPath}/list/tasks"/>
<c:set var="currentUrl" value="${tasksUrl}"/>
<c:set var="compound" value="?"/>
<c:set var="filterParam" value="${pageContext.request.getParameter('filter')}"/>
<c:if test="${!empty filterParam}">
    <c:set var="currentUrl" value="${currentUrl}?filter=${pageContext.request.getParameter('filter')}"/>
    <c:set var="compound" value="&"/>
</c:if>

<t:template>
    <div class="container">
        <div class="row">
                <t:navigation/>
        </div>
    </div>

    <form class="form-inline" method="get">
        <input type="hidden" name="filter" value="${filterParam}">
        <input type="hidden" name="page" value="${page+1}">

    <table id="task-table" class="table table-bordered task-table">
        <thead>
        <tr>
            <td>#</td>
            <td>Действия</td>
            <td>Название</td>
            <td>Приоритет</td>
            <td>Выполнено</td>
            <td>Описание</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${tasks}" var="t" varStatus="status">
            <tr>
                <%--Checkbox for every task line--%>
                <td>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="id" value="${t.id}">
                        </label>
                    </div>
                </td>

                    <%--Dropdown menu with action for every task line--%>
                <td>
                    <div class="dropdown btn-group-xs">
                        <button class="btn btn-info" id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dLabel">
                            <li><a href="${pageContext.request.contextPath}/list/editTask?id=${t.id}&filter=${filterParam}&page=${page+1}">Изменить</a></li>
                            <c:if test="${t.ready == false}">
                                <li><a href="${pageContext.request.contextPath}/list/setReady?id=${t.id}&filter=${filterParam}&page=${page+1}">
                                    Отметить "Выполнено"
                                </a></li>
                            </c:if>
                            <li role="separator" class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/list/deleteTask?id=${t.id}">Удалить</a></li>

                        </ul>
                    </div>
                </td>

                <td>${t.name}</td>
                    <td>${t.priority}</td>
                    <td class="readyStatus">
                        <c:if test="${t.ready == true}">
                            <img src="<spring:url value="/resources/images/zelenaja-galochka.png"/>"/>
                        </c:if>
                    </td>
                <td class="description">${t.description}</td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
        <div class="form-group button-list">
            <button type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/list/deleteTask">
                Удалить выделенные задания
            </button>
            <button type="submit" class="btn btn-success" formaction="${pageContext.request.contextPath}/list/setReady">
                Отметить 'Выполнено' выделенные задания
            </button>
        </div>
    </form>

    <%--Pagination--%>
    <div class="container">
        <nav class="paging">
            <ul class="pagination pagination-sm text-center">
                <c:set var="p" value="${page}"/>
                <c:if test="${!SearchTaskController_taskList.isFirstPage()}">
                    <li>
                        <a href="${currentUrl}${compound}page=${p}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach begin="${p+1}" end="${pageCount}" varStatus="status" var="index">
                    <c:set var="c" value=" "/>
                    <c:if test="${index == p+1}">
                        <c:set var="c" value="active"/>
                    </c:if>
                    <li class="${c}"><a href="${currentUrl}${compound}page=${index}">${index}</a></li>

                </c:forEach>
                <c:if test="${!SearchTaskController_taskList.isLastPage()}">
                    <li>
                        <a href="${currentUrl}${compound}page=${p+2}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</t:template>