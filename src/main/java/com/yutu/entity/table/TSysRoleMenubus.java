/*
*
* @Author: zhaobc
* @Date 2019-12-15 15:09
* @Description: 
*/
package com.yutu.entity.table;

import java.io.Serializable;

public class TSysRoleMenubus implements Serializable {
    /**
     * 编码
     */
    private String uuid;

    /**
     * 角色uuid
     */
    private String roleUuid;

    /**
     * 业务菜单uuid
     */
    private String menubusUuid;

    /**
     * 备注
     */
    private String remarks;

    /**
     * t_sys_role_menubus
     */
    private static final long serialVersionUID = 1L;

    /**
    * @Author: zhaobc
    * @Date 2019-12-15 15:09
    * @Description: 
     */
    public String getUuid() {
        return uuid;
    }

    /**
     * 编码
     */
    public void setUuid(String uuid) {
        this.uuid = uuid == null ? null : uuid.trim();
    }

    /**
    * @Author: zhaobc
    * @Date 2019-12-15 15:09
    * @Description: 
     */
    public String getRoleUuid() {
        return roleUuid;
    }

    /**
     * 角色uuid
     */
    public void setRoleUuid(String roleUuid) {
        this.roleUuid = roleUuid == null ? null : roleUuid.trim();
    }

    /**
    * @Author: zhaobc
    * @Date 2019-12-15 15:09
    * @Description: 
     */
    public String getMenubusUuid() {
        return menubusUuid;
    }

    /**
     * 业务菜单uuid
     */
    public void setMenubusUuid(String menubusUuid) {
        this.menubusUuid = menubusUuid == null ? null : menubusUuid.trim();
    }

    /**
    * @Author: zhaobc
    * @Date 2019-12-15 15:09
    * @Description: 
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * 备注
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    /**
     *
    * @Author: zhaobc
    * @Date 2019-12-15 15:09
    * @Description: 
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", uuid=").append(uuid);
        sb.append(", roleUuid=").append(roleUuid);
        sb.append(", menubusUuid=").append(menubusUuid);
        sb.append(", remarks=").append(remarks);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}