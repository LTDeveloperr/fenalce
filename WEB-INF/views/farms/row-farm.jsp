<% String valAsig = (String)value; %>
<% valAsig = (String) request.getAttribute("selected"); %>
<% if (usrFarDao.getPrivilegeUser(userFar.getIdUsr(), "farm/modify") || (usrFarDao.getPrivilegeUser(userFar.getIdUsr(), "farm/delete"))) { %>
    <% if (valAsig.equals("property") || valAsig == "property") {%>
        <td>
            <input type="checkbox" class="chkNumber" value="${id_farm}" onclick="clickSelOne('chkSelectAll', 'chkNumber', 'btnDelFar')"/>
        </td>
    <% } %>
<% } %>
<% if (valAsig != "property") {%>
    <% if (valAsig.equals("lot") || valAsig.equals("crop")) {%>
        <td><i class="icon-ok main-color"></i></td>
    <% }%>                        
<% }%>
<% if (entTypeFarId==3) { %>    
    <td><s:property value="nameAgro" /></td>
<% } %>
<td>
    <s:property value="getText('td.namefarm.farm')" />: <s:property value="name_farm" />
    <s:if test="%{typeEnt!=1}">
        , <br />
        <s:property value="getText('td.nameproducer.farm')" />: <s:property value="name_producer" />
    </s:if>
</td>
<td><s:property value="lane_farm" /></td>
<td><s:property value="name_dep" /></td>
<td><s:property value="name_mun" /></td>
<td class="compressTd"><s:property value="latitude_farm" /></td>
<td class="compressTd"><s:property value="length_farm" /></td>
<s:number name="altitude_farm" type="integer" var="altFarm" />
<td><s:property value="%{#altFarm}" /></td>
<s:date name="dateLog" format="dd/MM/yyyy" var="dateLog"/>
<td><s:property value="%{#dateLog}" /></td>
<% if (usrFarDao.getPrivilegeUser(userFar.getIdUsr(), "farm/modify") || (usrFarDao.getPrivilegeUser(userFar.getIdUsr(), "farm/delete"))) { %>
    <% if (valAsig.equals("property") || valAsig == "property") {%>
        <td>
            <div class="btn-group">
                <% if (usrFarDao.getPrivilegeUser(userFar.getIdUsr(), "farm/modify")) { %>
                    <a class="btn btn-small btn-default btn-edit" title="<s:property value="getText('button.farmedit.farm')" />" onclick="viewForm('/showFarm.action?action=modify&page=<%=pageNow%>', 'idFar', <s:property value ="id_farm" />, '<s:property value="getText('title.farmedit.farm')" />', 1050, 550)"><i class="icon-pencil"></i></a>
                <% } %>
                <% if (usrFarDao.getPrivilegeUser(userFar.getIdUsr(), "farm/delete")) { %>
                    <a class="btn btn-small btn-default delete_rows_dt btn-delete" title="<s:property value="getText('button.farmdel.farm')" />" onclick="showDialogDelete(this, 'confirm_dialog_property', '/deleteFarm.action?idFar=<s:property value ="id_farm" />', '/viewFarm.action?page=<%=pageNow%>', 'divFarms', '<%=divHide%>'); ga('send', 'event', 'Farms', 'click', 'Delete');"><i class="icon-trash"></i></a>
                <% } %>
            </div>
        </td>
    <% } %>
<% } %>