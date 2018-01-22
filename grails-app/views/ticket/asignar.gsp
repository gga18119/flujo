
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
                
			<g:form controller="ticket" action="asignarTicket" >
                            <g:if test="${detalle}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                        
				<fieldset class="form">
                                    <div class="fieldcontain ">
                                        <label for="asignadoA">
                                            <g:message code="asignadoA" default="AsignadoA" />
		
                                        </label>
                                            <g:select id="asignadoA" name="asignadoA" from="${detalle.usuarios}"   optionKey="id"  value="${detalle.usuarios?.id}" noSelection="['':'Selecciona un Usuario']" multiple="true" />
                                    </div>

                                    <div class="fieldcontain ">
                                        <label for="ticket">
                                            <g:message code="ticket" default="Folio Ticket" />
                                	</label>
                                            <g:select id="ticket" name="ticket" from="${detalle.tickets}" optionKey="id"  value="${detalle.tickets?.id}" noSelection="['':'Selecciona un Ticket']" />

                                    </div>
					
				</fieldset>
                                
				<fieldset class="buttons">
				<g:submitButton name="asignar" class="save" value="Asignar" />
				</fieldset>
			</g:form>
		</div>
            </sec:ifAnyGranted>  
	</body>
</html>
