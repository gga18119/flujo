
<%@ page import="pruebaSeguridad.Ticket" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
            <sec:ifAnyGranted roles='ROLE_ADMIN'>
		<div id="list-ticket" class="content scaffold-list" role="main">
			<h1><g:message code="Asignar Tickets"  /></h1>
			<g:form url="[resource:asignacionDePeticionInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
                                        <g:hiddenField name="user"  value="${params.id}"/>
				</fieldset>
                                
				<fieldset class="buttons">
				<g:submitButton name="create" class="save" value="Asignar" />
				</fieldset>
			</g:form>
		</div>
            </sec:ifAnyGranted>  
	</body>
</html>
