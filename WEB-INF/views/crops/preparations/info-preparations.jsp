<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page import="java.lang.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.aepscolombia.platform.util.JavascriptHelper"%>            
<% String table = "display:none;";%>
<% String label = "";%>
<%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
<%@page import="org.aepscolombia.platform.models.entity.Users"%>
<%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
<%@page import="org.aepscolombia.platform.util.APConstants"%>
<% Users userPrp  = (Users) session.getAttribute(APConstants.SESSION_USER); %>
<% UsersDao usrPrpDao = new UsersDao(); %>
<% Integer entTypePrpId = new EntitiesDao().getEntityTypeId(userPrp.getIdUsr()); %>

<s:if test="listPrep.size() > 0">
    <% table = "";%>
    <% label = "display:none;";%> 
</s:if>            

 <% String classCostPreInf = "hideInfo"; %>
<s:set name="costPre" value="costCrop"/>
<s:if test="%{#costPre==1}">
    <% classCostPreInf = "";  %>
</s:if> 

<div class="msgWin" id="divMessListPrep"></div>
<div id="divPrep" class="table-responsive w-box">
    <fieldset>
        <legend><s:property value="getText('title.preparationlist.preparation')" /></legend>
        <% if (usrPrpDao.getPrivilegeUser(userPrp.getIdUsr(), "crop/create")) { %>
            <% if (entTypePrpId!=3) { %>
                <s:if test="checkSowing!=true">
                    <button type="button" class="btn btn-initial btn-space" onclick="viewForm('/crop/showPrep.action?action=create', 'idCrop', '${idCrop}', '<s:property value="getText('title.addpreparation.preparation')" />', 1050, 550);">
                        <i class="icon-plus"></i> <s:property value="getText('button.addpreparation.preparation')" />
                    </button>
                </s:if>
            <% } %>
        <% } %>
        <table class="table table-bordered table-condensed table-hover" style="<%= table %>" id='tblPrep'>
            <thead>
                <tr>
                    <th><s:property value="getText('td.datepreparation.preparation')" /></th>
                    <th><s:property value="getText('td.depthpreparation.preparation')" /> (cm)</th>
                    <th><s:property value="getText('td.preparationtype.preparation')" /></th>
                    <th><s:property value="getText('td.otherpreparationtype.preparation')" /></th>
                    <th><s:property value="getText('td.passingnumber.preparation')" /></th>
                    <th class="<%= classCostPreInf %>"><s:property value="getText('td.costpreparation.preparation')" /></th>
                    <% if (usrPrpDao.getPrivilegeUser(userPrp.getIdUsr(), "crop/modify") || (usrPrpDao.getPrivilegeUser(userPrp.getIdUsr(), "crop/delete"))) { %>
                        <th><s:property value="getText('td.action.preparation')" /></th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <s:iterator value="listPrep" var="prep">
                    <tr id="trPrep${idPrep}">
                        <%@ include file="row-preparations.jsp" %>                                
                    </tr>
                </s:iterator>
            </tbody>
        </table>
        <br />
        <label style="<%= label %>"><s:property value="getText('label.nofounddata.preparation')" /></label>
        <div class="hideInfo">
            <div id="confirm_dialog_prep" class="cbox_content">
                <div class="sepH_c"><strong><s:property value="getText('label.deletepreparation.preparation')" />?</strong></div>
                <div>
                    <a href="#" class="btn btn-small btn-initial confirm_yes"><s:property value="getText('link.optyes')" /></a>
                    <a href="#" class="btn btn-default btn-small confirm_no"><s:property value="getText('link.optno')" /></a>
                </div>
            </div>
        </div>
    </fieldset>
</div>
