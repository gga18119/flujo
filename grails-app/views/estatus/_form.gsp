<%@ page import="pruebaSeguridad.Estatus" %>



<div class="fieldcontain ${hasErrors(bean: estatusInstance, field: 'tipo_estatus', 'error')} required">
	<label for="tipo_estatus">
		<g:message code="estatus.tipo_estatus.label" default="Tipoestatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipo_estatus" required="" value="${estatusInstance?.tipo_estatus}"/>

</div>

