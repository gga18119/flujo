
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
                                <sec:ifAnyGranted roles='ROLE_ADMIN'>
                                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                    <li><g:link class="asignar" action="asignar"><g:message code="Asignar" args="" /></g:link></li>
                                </sec:ifAnyGranted>          
                                <sec:ifAnyGranted roles='ROLE_USER'>
                                    <li><g:link class="asignados" action="listarAsignados"><g:message code="Asigandos" args="" /></g:link></li>
                                </sec:ifAnyGranted>      
			</ul>
		</div>
                <sec:ifAnyGranted roles='ROLE_ADMIN'>
		<div id="list-ticket" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'ticket.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="ticket.estatus.label" default="Estatus" /></th>
					
						<g:sortableColumn property="folio" title="${message(code: 'ticket.folio.label', default: 'Folio')}" />
					
						<th><g:message code="ticket.registradoPor.label" default="Registrado Por" /></th>
					
						<th><g:message code="ticket.asignadoA.label" default="Asignado A" /></th>
					
						<g:sortableColumn property="fechaAsignacion" title="${message(code: 'ticket.fechaAsignacion.label', default: 'Fecha Asignacion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ticketInstance.id}">${fieldValue(bean: ticketInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: ticketInstance, field: "estatus")}</td>
					
						<td>${fieldValue(bean: ticketInstance, field: "folio")}</td>
					
						<td>${fieldValue(bean: ticketInstance, field: "registradoPor")}</td>
					
						<td>${fieldValue(bean: ticketInstance, field: "asignadoA")}</td>
					
						<td><g:formatDate date="${ticketInstance.fechaAsignacion}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
                       
			<div class="pagination">
				<g:paginate total="${ticketInstanceCount ?: 0}" />
			</div>
                        
		</div>
            </sec:ifAnyGranted>          
	</body>
</html>
