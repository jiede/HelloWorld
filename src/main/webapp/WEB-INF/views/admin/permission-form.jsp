<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="col-xs-12">
    <!-- PAGE CONTENT BEGINS -->
    <form class="form-horizontal" method="post" id="permissionForm" role="form" action="">
        <table>
            <tr>
                <td align="right">权限类型<font color="red">*</font>：</td>
                <td><select class="chosen-select form-control" name="permissionType" id="permissionType">
                    <option value="1" <c:if test="${permission.permissionType == 1}"> selected </c:if> >菜单</option>
                    <option value="2" <c:if test="${permission.permissionType == 2}"> selected </c:if> >链接</option>
                </select></td>
                <td align="right">权限编号<font color="red">*</font>：</td>
                <td><input type="text" id="permissionCode" name="permissionCode" placeholder="权限编号"
                           value="${permission.permissionCode}" class="col-xs-10"/>
                </td>
            </tr>
            <tr>
                <td align="right">权限名称<font color="red">*</font>：</td>
                <td colspan="3"><input type="text" id="permissionName" name="permissionName" placeholder="权限名称"
                           value="${employee.permissionName}" class="col-xs-10"/></td>
            </tr>
            <tr>
                <td align="right">权限<font color="red">*</font>：</td>
                <td colspan="3"><input type="text" id="permissionValue" name="permissionValue" placeholder="权限"
                           value="${permission.permissionValue}" class="col-xs-10"/>
                </td>
            </tr>
            <tr>
                <td align="right">菜单级别<font color="red">*</font>：</td>
                <td><input type="text" id="permissionLevel" name="permissionLevel" placeholder="菜单级别"
                           value="${employee.employeeId}" class="col-xs-10"/></td>
                <td align="right">上级编号：</td>
                <td><input type="text" id="parentCode" name="parentCode" placeholder="上级编号"
                           value="${permission.parentCode}" class="col-xs-10"/>
                </td>
            </tr>

            <tr>
                <td colspan="4" align="center">
                    <button class="btn btn-sm btn-reset" type="reset">
                        重置<i class="ace-icon fa fa-undo bigger-110"></i>
                    </button>
                    <button type="button" class="btn btn-sm btn-success" id="subButton"/>
                    提交<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                    </button>
                </td>
            </tr>
        </table>
        <c:if test="${not empty permission}">
            <input type="hidden" name="id" id="id" value="${permission.id}">
        </c:if>
        <b:token/>
    </form>
</div>

<script type="text/javascript">
    jQuery(function ($) {

    });
</script>


