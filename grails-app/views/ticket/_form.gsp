<%@ page import="pruebaSeguridad.Ticket" %>



<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="ticket.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${ticketInstance?.descripcion}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'folio', 'error')} required">
	<label for="folio">
		<g:message code="ticket.folio.label" default="Folio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="folio" required="" value="${ticketInstance?.folio}"/>

</div>




