<%-- 
    Document   : form-adminUser
    Created on : 12/11/2018, 05:03:57 PM
    Author     : acampero
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<fieldset>
    <legend><s:property value="getText('title.aminduser.profile')" /></legend>    
    
    
    <s:form id="formAdminUser" action="restorePassword.action">
                        <s:hidden name="actExe" value="restuser"/>
                        <s:hidden name="lanSel"/>
                        <div class="row">
                            <div class="col-xs-12 col-md-3 form-group">
                                <label class="control-label" for="formAdminUser_infoUser"><s:property value="getText('text.emailcontact.login')" /></label>
                                <div class="controls">
                                    <s:textfield id="formAdminUser_infoUser" name="infoUser" />
                                </div>
                            </div>                         
                        </div>  
                      <div class="row">
                        <div class="col-xs-12 col-md-3 form-group">
                            <label for="formAdminUser_status" class="control-label"><s:property value="getText('select.accion.profile')" />:</label>
                            <div class="controls">
                                <s:select
                                                    id="status__formProfile"
                                                    name="status.formProfile"
                                                    value="status.formProfile"             
                                                    list="#{'3':'---','1':'Habilitar', '0':'Deshabilitar'}"            
                                                    headerKey="-1" 
                                                    cssClass="form-control"
                                                    />
                            </div>
                        </div>
                        </div>    
                                
                            <div class="col-md-12">
                                <sj:submit type="button" id="btRestore" cssClass="btn btn-initial btn-lg" onclick="addMessageProcessLogin('formValidate_lanSel'); " targets="divMessage" onCompleteTopics="completeRestore" validate="true" validateFunction="validationForm"><s:property value="getText('button.restore.login')" /></sj:submit>
                            </div>
                        </div>
                    </s:form>
                    <div class="hideInfo">
                        <div id="confirm_dialog" class="cbox_content">
                            <div class="sepH_c">
                                <p><s:text name="%{getText('area.restoreinfo.login')}" />.</p>
                            </div>
                            <div> 
                                <a href="javascript:void(0)" id="accessSystem" class="btn btn-small confirm_ok"><s:property value="getText('link.resultok.login')" /></a>
                            </div>
                        </div>
                    </div>
                    <script>
                     
                        $.subscribe('completeRestore', function(event, data) {
                        if(event.handled !== true){             
                            
                            ga('send', 'event', 'Register', 'click', 'Remember');            
                            completeFormGetting('dialog-form', 'formValidate', 'divRestoreUser', event.originalEvent.request.responseText);
                         setTimeout( function() {
                         javascript:void(0);
                        }, 2000);
                        event.handled = true;
                    }    
//                }
            });
            if($('.pop-over').length) {
                $('.pop-over').popover();
            }
                    </script>
</fieldset>
