<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/ico" href="img/logoAEPS.ico">
    </head>
    <body>
        <%@ include file="../generals/googleAnalytics.jsp" %>
        <%@page import="org.aepscolombia.platform.models.entity.Users"%>
        <%@page import="org.aepscolombia.platform.models.dao.UsersDao"%>
        <%@page import="org.aepscolombia.platform.util.APConstants"%>
        <%@page import="org.aepscolombia.platform.models.dao.EntitiesDao"%>
        <% Users user = (Users) session.getAttribute(APConstants.SESSION_USER); %>
        <% UsersDao usrDao = new UsersDao(); %>
        <% Integer entTypeId = new EntitiesDao().getEntityTypeId(user.getIdUsr()); %>
        <% String coCode   = (String) session.getAttribute(APConstants.COUNTRY_CODE); %>
        <div class="container">
            <ul id="breadcrumbs">
                <s:set id="contextPath"  value="#request.get('javax.servlet.forward.context_path')" />
                <li><s:a href="dashboard.action" targets="divBodyLayout"><i class="icon-home"></i><s:property value="getText('link.homeprivate')" /></s:a></li>
                <li><span><s:property value="getText('label.reportstype')" /></span></li>
            </ul>
        </div>
        <div class="container">			
            <% if (entTypeId==1 || entTypeId==2) { %>
                <div class="row">                                              
                    <% if (usrDao.getPrivilegeUser(user.getIdUsr(), "crop/view")) { %>
                        <div class="col-md-6">
                            <div class="thumbnail custom-thumb">
                                <s:a href="%{contextPath}/listCropRep.action" role="button" targets="divBodyLayout"><img src="img/crops.jpg" alt=""></s:a>
                                <div class="caption">
                                    <h3><s:property value="getText('title.yield.report')" /></h3>
                                    <p><s:property value="getText('label.yield.report')" /></p>                        
                                    <p>
                                        <s:a cssClass="btn btn-initial" href="%{contextPath}/listCropRep.action" role="button" targets="divBodyLayout"><s:property value="getText('link.yield.report')" /> <i class="icon-double-angle-right"></i></s:a>
                                    </p>
                                </div>
                            </div> 
                        </div> 
                        <div class="col-md-6">
                            <div class="thumbnail custom-thumb">                
                    <% } else { %>
                        <div class="col-md-6">
                            <div class="thumbnail custom-thumb">                 
                    <% } %>
                    <% if (usrDao.getPrivilegeUser(user.getIdUsr(), "soil/view")) { %>
                                <s:a href="%{contextPath}/listSoilRep.action" role="button" targets="divBodyLayout"><img src="img/soils.jpg" alt=""></s:a>
                                <div class="caption">
                                    <h3><s:property value="getText('title.soil.report')" /></h3>
                                    <p><s:property value="getText('label.soil.report')" /></p>     
                                    <p>
                                        <s:a cssClass="btn btn-initial" href="%{contextPath}/listSoilRep.action" role="button" targets="divBodyLayout"><s:property value="getText('link.soil.report')" /> <i class="icon-double-angle-right"></i></s:a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    <% } %>   
                </div>                            
            <% } %>
            <% if (coCode.equals("CO")) { %>
                <div class="row">             
                    <% if (usrDao.getPrivilegeUser(user.getIdUsr(), "crop/view")) { %>
                        <div class="col-md-6">
                            <div class="thumbnail custom-thumb">
                                <s:a href="%{contextPath}/checkList.action" role="button" targets="divBodyLayout"><img src="img/crops.jpg" alt=""></s:a>
                                <div class="caption">
                                    <h3><s:property value="getText('title.fenalcheck.report')" /></h3>
                                    <p><s:property value="getText('label.fenalcheck.report')" /></p>                        
                                    <p>
                                        <s:a cssClass="btn btn-initial" href="%{contextPath}/checkList.action" role="button" targets="divBodyLayout"><s:property value="getText('link.fenalcheck.report')" /> <i class="icon-double-angle-right"></i></s:a>
                                    </p>
                                </div>
                            </div> 
                        </div> 
                     <% } %>           
    <!--                <div class="col-md-6 thumbnail custom-thumb" style="margin-left: 10px">
                        <%--<s:a href="%{contextPath}/analysisReport.action" role="button" targets="divBodyLayout"><img src="img/RANDOM_FOREST/data.jpg" alt=""></s:a>--%>
                        <div class="caption">
                            <h3>Analisis</h3>
                            <p>Reporte para el analisis de la informacion</p>                        
                            <p>
                                <%--<s:a cssClass="btn btn-initial" href="%{contextPath}/analysisReport.action" role="button" targets="divBodyLayout"><s:property value="getText('link.fenalcheck.report')" /> <i class="icon-double-angle-right"></i></s:a>--%>
                            </p>
                        </div>
                    </div> -->
                </div>  
            <% } %>
        </div>
    </body>
</html>
