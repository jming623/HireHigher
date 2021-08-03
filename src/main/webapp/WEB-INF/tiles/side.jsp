<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <aside id="sidebar">
        <div id="sidebar-wrapper">
            <div id="sidebar-toggle">
                <div id="toggle-wrapper">
                  <img class="sidebar-toggle-logo" src="${ pageContext.request.contextPath }/resources/img/sidebar-toggle-logo.png">
                </div>
            </div>
            
            <div id="sidebar-div-wrapper">
            <div class="sidebar-div" id="sidebar-button1">
                <a class="sidebar-link" href="${pageContext.request.contextPath}/">
                    <img class="sidebar-logo" src="${ pageContext.request.contextPath }/resources/img/sidebar-home-logo.png">
                </a>
            </div>
            <div class="sidebar-div" id="sidebar-button2">
                <a class="sidebar-link" href="#">
                    <img class="sidebar-logo" src="${ pageContext.request.contextPath }/resources/img/sidebar-arrow-logo.png">
                </a>
            </div>
            <div class="sidebar-div" id="sidebar-button3">
                <a class="sidebar-link" href="#">
                    <img class="sidebar-logo" src="${ pageContext.request.contextPath }/resources/img/sidebar-insta-logo.png">
                </a>
            </div>
            </div>

        </div>
    </aside>
