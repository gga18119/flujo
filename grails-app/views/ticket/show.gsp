
<%@ page import="pruebaSeguridad.Ticket" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ticket" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ticket">
			
				<g:if test="${ticketInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="ticket.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${ticketInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label"><g:message code="ticket.estatus.label" default="Estatus" /></span>
					
						<span class="property-value" aria-labelledby="estatus-label"><g:link controller="estatus" action="show" id="${ticketInstance?.estatus?.id}">${ticketInstance?.estatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.folio}">
				<li class="fieldcontain">
					<span id="folio-label" class="property-label"><g:message code="ticket.folio.label" default="Folio" /></span>
					
						<span class="property-value" aria-labelledby="folio-label"><g:fieldValue bean="${ticketInstance}" field="folio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.registradoPor}">
				<li class="fieldcontain">
					<span id="registradoPor-label" class="property-label"><g:message code="ticket.registradoPor.label" default="Registrado Por" /></span>
					
						<span class="property-value" aria-labelledby="registradoPor-label"><g:link controller="usuario" action="show" id="${ticketInstance?.registradoPor?.id}">${ticketInstance?.registradoPor?.username}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.asignadoA}">
				<li class="fieldcontain">
					<span id="asignadoA-label" class="property-label"><g:message code="ticket.asignadoA.label" default="Asignado A" /></span>
					
						<span class="property-value" aria-labelledby="asignadoA-label"><g:link controller="usuario" action="show" id="${ticketInstance?.asignadoA?.id}">${ticketInstance?.asignadoA?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.fechaAsignacion}">
				<li class="fieldcontain">
					<span id="fechaAsignacion-label" class="property-label"><g:message code="ticket.fechaAsignacion.label" default="Fecha Asignacion" /></span>
					
						<span class="property-value" aria-labelledby="fechaAsignacion-label"><g:formatDate date="${ticketInstance?.fechaAsignacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="ticket.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:formatDate date="${ticketInstance?.fechaRegistro}" /></span>
					
				</li>
				</g:if>
			
			</ol>
                    <sec:ifAnyGranted roles='ROLE_ADMIN'>
                        <div>
			<g:form url="[resource:ticketInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
                                   
					<g:link class="edit" action="edit" resource="${ticketInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                   
                                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                         <g:jasperForm 
                                
                                controller="ticket"
                                action="reporte"
                                jasper="ticketsList" 
                                name="Registro">
                                <input type="hidden" name="idticket" value='${ticketInstance.id}'/> 
                                <g:jasperButton format="pdf"  controller="ticket"  action="reporte" jasper="ticketsList" text="IMPRIMIR"  />
                            </g:jasperForm>
                                </fieldset>
			</g:form>
                        </div>
                     </sec:ifAnyGranted>    
		</div>
	</body>
</html>
