
<%@ page import="pruebaSeguridad.Ticket" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="Detalle ticket" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="asignados" action="listarAsignados"><g:message code="Asigandos" args="" /></g:link></li>
			</ul>
		</div>
		<div id="show-ticket" class="content scaffold-show" role="main">
			<h1><g:message code="Detalle Ticket Asignado" args="[entityName]" /></h1>
			<g:if test="${detalle}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
                        
			<ol class="property-list ticket">
                            
                                <g:if test="${detalle.folio}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="folioTicket.folio" default="Folio " /></span>
					
						<span class="property-value" aria-labelledby="folio-label">${detalle.folio}</span>
					
				</li>
				</g:if>
                                
                                <g:if test="${detalle.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="folioTicket.descripcion" default="Descripción" /></span>
					
						<span class="property-value" aria-labelledby="folio-label">${detalle.descripcion}</span>
					
				</li>
				</g:if>
                                
				<g:if test="${detalle.fechaAsignacion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="fechaAsisgnacion" default="Fecha De Asisgnación" /></span>
					
						<span class="property-value" aria-labelledby="folio-label"><g:formatDate format="dd / MM / yyyy" date="${detalle.fechaAsignacion}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalle.registradoPor}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="folioTicket.registradoPor" default="Usuario Que Registró" /></span>
					
						<span class="property-value" aria-labelledby="folio-label">${detalle.registradoPor.username}</span>
					
				</li>
				</g:if>
			
                                
                                
                                <g:if  test="${detalle.estatus?.id == 4}">
                                    <li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="detalle.respuestaPeticion" default="Solucion Peticion" /></span>
					
					<span class="property-value" aria-labelledby="folio-label"> ${detalle.respuestaPeticion }</span>
					
                                    </li>
                                </g:if>   
			
			
			</ol>
			<g:form >
				<fieldset class="buttons">
                                    <g:if  test="${detalle.estatus?.id == 2}">
                                        <g:link class="edit" action="revisar" resource="${ticketInstance}" id="${detalle.id}"><g:message code="default.button.revisar.label" default="Revisar" /></g:link>
                                   
                                    </g:if>    
                                    <g:elseif test="${detalle.estatus?.id == 3}">
                                            <g:form controller="ticket" action="atender">
                                                <g:hiddenField name="id"  value="${detalle.id}"/>
                                                <g:textArea cols="30" rows="4" name="respuesta"  style="width:400px; height: 200px;"/>
                                                <g:actionSubmit  class="edit" value="Atender"/>
                                            </g:form>
                                    </g:elseif>
					<!--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />-->
				</fieldset>
			</g:form>
                       
                      
		</div>
	</body>
</html>
