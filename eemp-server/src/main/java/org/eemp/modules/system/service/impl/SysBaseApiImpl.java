package org.eemp.modules.system.service.impl;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.*;
import javax.annotation.Resource;
import javax.sql.DataSource;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.base.Joiner;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.eemp.common.api.dto.DataLogDTO;
import org.eemp.common.api.dto.OnlineAuthDTO;
import org.eemp.common.api.dto.message.*;
import org.eemp.common.aspect.UrlMatchEnum;
import org.eemp.common.constant.*;
import org.eemp.common.constant.enums.MessageTypeEnum;
import org.eemp.common.desensitization.util.SensitiveInfoUtil;
import org.eemp.common.exception.JeecgBootException;
import org.eemp.common.system.api.ISysBaseAPI;
import org.eemp.common.system.query.QueryGenerator;
import org.eemp.common.system.vo.*;
import org.eemp.common.util.*;
import org.eemp.common.util.dynamic.db.FreemarkerParseFactory;
import org.eemp.modules.message.entity.SysMessageTemplate;
import org.eemp.modules.message.handle.impl.EmailSendMsgHandle;
import org.eemp.modules.message.handle.impl.QywxSendMsgHandle;
import org.eemp.modules.message.handle.impl.SystemSendMsgHandle;
import org.eemp.modules.message.service.ISysMessageTemplateService;
import org.eemp.modules.message.websocket.WebSocket;
import org.eemp.modules.system.entity.*;
import org.eemp.modules.system.mapper.*;
import org.eemp.modules.system.service.*;
import org.eemp.modules.system.util.SecurityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

/**
 * @Description: ??????????????????API?????????????????????????????????
 * @Author: scott
 * @Date:2019-4-20
 * @Version:V1.0
 */
@Slf4j
@Service
public class SysBaseApiImpl implements ISysBaseAPI {
    /**
     * ???????????????????????????
     */
    private static String DB_TYPE = "";
    @Autowired
    ISysCategoryService sysCategoryService;
    @Autowired
    private ISysMessageTemplateService sysMessageTemplateService;
    @Resource
    private SysUserMapper userMapper;
    @Resource
    private SysUserRoleMapper sysUserRoleMapper;
    @Autowired
    private ISysDepartService sysDepartService;
    @Autowired
    private ISysDictService sysDictService;
    @Resource
    private SysAnnouncementMapper sysAnnouncementMapper;
    @Resource
    private SysAnnouncementSendMapper sysAnnouncementSendMapper;
    @Resource
    private WebSocket webSocket;
    @Resource
    private SysRoleMapper roleMapper;
    @Resource
    private SysDepartMapper departMapper;
    @Resource
    private SysCategoryMapper categoryMapper;
    @Autowired
    private ISysDataSourceService dataSourceService;
    @Autowired
    private ISysUserDepartService sysUserDepartService;
    @Resource
    private SysPermissionMapper sysPermissionMapper;
    @Autowired
    private ISysPermissionDataRuleService sysPermissionDataRuleService;
    @Autowired
    private ISysUserService sysUserService;
    @Autowired
    private ISysDataLogService sysDataLogService;
    @Autowired
    private ISysFilesService sysFilesService;
    //-------------------------------------??????????????????????????????-----------------------------------------------
    @Autowired
    private QywxSendMsgHandle qywxSendMsgHandle;
    @Autowired
    private SystemSendMsgHandle systemSendMsgHandle;
    @Autowired
    private EmailSendMsgHandle emailSendMsgHandle;

    @Override
    //@SensitiveDecode
    public LoginUser getUserByName(String username) {
        //update-begin-author:taoyan date:2022-6-6 for: VUEN-1276 ???v3??????????????????bug 1????????????????????????????????????????????????????????????????????????????????????
        if (oConvertUtils.isEmpty(username)) {
            return null;
        }
        //update-end-author:taoyan date:2022-6-6 for: VUEN-1276 ???v3??????????????????bug 1????????????????????????????????????????????????????????????????????????????????????
        LoginUser user = sysUserService.getEncodeUserInfo(username);

        //?????????????????????????????????????????? Aop????????????????????????????????????????????????????????????????????????????????????@SensitiveDecodeAble????????????
        try {
            SensitiveInfoUtil.handlerObject(user, false);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public String translateDictFromTable(String table, String text, String code, String key) {
        return sysDictService.queryTableDictTextByKey(table, text, code, key);
    }

    @Override
    public String translateDict(String code, String key) {
        return sysDictService.queryDictTextByKey(code, key);
    }

    @Override
    public List<SysPermissionDataRuleModel> queryPermissionDataRule(String component, String requestPath, String username) {
        List<SysPermission> currentSyspermission = null;
        if (oConvertUtils.isNotEmpty(component)) {
            //1.??????????????????pageComponent ????????????
            LambdaQueryWrapper<SysPermission> query = new LambdaQueryWrapper<SysPermission>();
            query.eq(SysPermission::getDelFlag, 0);
            query.eq(SysPermission::getComponent, component);
            currentSyspermission = sysPermissionMapper.selectList(query);
        } else {
            //1.??????????????????????????????????????????
            LambdaQueryWrapper<SysPermission> query = new LambdaQueryWrapper<SysPermission>();
            query.eq(SysPermission::getMenuType, 2);
            query.eq(SysPermission::getDelFlag, 0);
            query.eq(SysPermission::getUrl, requestPath);
            currentSyspermission = sysPermissionMapper.selectList(query);
            //2.????????? ????????????????????????URL ????????????
            if (currentSyspermission == null || currentSyspermission.size() == 0) {
                //???????????????URL???????????? ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
                String userMatchUrl = UrlMatchEnum.getMatchResultByUrl(requestPath);
                LambdaQueryWrapper<SysPermission> queryQserMatch = new LambdaQueryWrapper<SysPermission>();
                // update-begin-author:taoyan date:20211027 for: online????????????????????????????????? ?????????????????? ??????menuType = 1
                //queryQserMatch.eq(SysPermission::getMenuType, 1);
                // update-end-author:taoyan date:20211027 for: online????????????????????????????????? ?????????????????? ??????menuType = 1
                queryQserMatch.eq(SysPermission::getDelFlag, 0);
                queryQserMatch.eq(SysPermission::getUrl, userMatchUrl);
                if (oConvertUtils.isNotEmpty(userMatchUrl)) {
                    currentSyspermission = sysPermissionMapper.selectList(queryQserMatch);
                }
            }
            //3.????????? ?????????????????????????????????
            if (currentSyspermission == null || currentSyspermission.size() == 0) {
                //??????????????????????????????
                String regUrl = getRegexpUrl(requestPath);
                if (regUrl != null) {
                    currentSyspermission = sysPermissionMapper.selectList(new LambdaQueryWrapper<SysPermission>().eq(SysPermission::getMenuType, 2).eq(SysPermission::getUrl, regUrl).eq(SysPermission::getDelFlag, 0));
                }
            }
        }
        if (currentSyspermission != null && currentSyspermission.size() > 0) {
            List<SysPermissionDataRuleModel> dataRules = new ArrayList<SysPermissionDataRuleModel>();
            for (SysPermission sysPermission : currentSyspermission) {
                // update-begin--Author:scott Date:20191119 for???????????????????????????????????????????????????????????????????????? #722
                List<SysPermissionDataRule> temp = sysPermissionDataRuleService.queryPermissionDataRules(username, sysPermission.getId());
                if (temp != null && temp.size() > 0) {
                    //dataRules.addAll(temp);
                    dataRules = oConvertUtils.entityListToModelList(temp, SysPermissionDataRuleModel.class);
                }
                // update-end--Author:scott Date:20191119 for???????????????????????????????????????????????????????????????????????? #722
            }
            return dataRules;
        }
        return null;
    }

    /**
     * ?????????????????????????????? ??????????????????????????????
     * AntPathMatcher????????????
     * ()* ??????0??????????????????
     * ()**??????0??????????????????
     */
    private String getRegexpUrl(String url) {
        List<String> list = sysPermissionMapper.queryPermissionUrlWithStar();
        if (list != null && list.size() > 0) {
            for (String p : list) {
                PathMatcher matcher = new AntPathMatcher();
                if (matcher.match(p, url)) {
                    return p;
                }
            }
        }
        return null;
    }

    @Override
    public SysUserCacheInfo getCacheUser(String username) {
        SysUserCacheInfo info = new SysUserCacheInfo();
        info.setOneDepart(true);
        LoginUser user = this.getUserByName(username);

//		try {
//			//????????????????????????????????????@SensitiveDecodeAble?????? Aop????????????
//			SensitiveInfoUtil.handlerObject(user, false);
//		} catch (IllegalAccessException e) {
//			e.printStackTrace();
//		}

        if (user != null) {
            info.setSysUserCode(user.getUsername());
            info.setSysUserName(user.getRealname());
            info.setSysOrgCode(user.getOrgCode());
        } else {
            return null;
        }
        //???????????????in??????
        List<SysDepart> list = departMapper.queryUserDeparts(user.getId());
        List<String> sysMultiOrgCode = new ArrayList<String>();
        if (list == null || list.size() == 0) {
            //?????????????????????
            //sysMultiOrgCode.add("0");
        } else if (list.size() == 1) {
            sysMultiOrgCode.add(list.get(0).getOrgCode());
        } else {
            info.setOneDepart(false);
            for (SysDepart dpt : list) {
                sysMultiOrgCode.add(dpt.getOrgCode());
            }
        }
        info.setSysMultiOrgCode(sysMultiOrgCode);
        return info;
    }

    @Override
    public LoginUser getUserById(String id) {
        if (oConvertUtils.isEmpty(id)) {
            return null;
        }
        LoginUser loginUser = new LoginUser();
        SysUser sysUser = userMapper.selectById(id);
        if (sysUser == null) {
            return null;
        }
        BeanUtils.copyProperties(sysUser, loginUser);
        return loginUser;
    }

    @Override
    public List<String> getRolesByUsername(String username) {
        return sysUserRoleMapper.getRoleByUserName(username);
    }

    @Override
    public List<String> getDepartIdsByUsername(String username) {
        List<SysDepart> list = sysDepartService.queryDepartsByUsername(username);
        List<String> result = new ArrayList<>(list.size());
        for (SysDepart depart : list) {
            result.add(depart.getId());
        }
        return result;
    }

    @Override
    public List<String> getDepartNamesByUsername(String username) {
        List<SysDepart> list = sysDepartService.queryDepartsByUsername(username);
        List<String> result = new ArrayList<>(list.size());
        for (SysDepart depart : list) {
            result.add(depart.getDepartName());
        }
        return result;
    }

    @Override
    public DictModel getParentDepartId(String departId) {
        SysDepart depart = departMapper.getParentDepartId(departId);
        DictModel model = new DictModel(depart.getId(), depart.getParentId());
        return model;
    }

    @Override
    @Cacheable(value = CacheConstant.SYS_DICT_CACHE, key = "#code", unless = "#result == null ")
    public List<DictModel> queryDictItemsByCode(String code) {
        return sysDictService.queryDictItemsByCode(code);
    }

    @Override
    @Cacheable(value = CacheConstant.SYS_ENABLE_DICT_CACHE, key = "#code", unless = "#result == null ")
    public List<DictModel> queryEnableDictItemsByCode(String code) {
        return sysDictService.queryEnableDictItemsByCode(code);
    }

    @Override
    public List<DictModel> queryTableDictItemsByCode(String table, String text, String code) {
        //update-begin-author:taoyan date:20200820 for:???Online+???????????????????????????????????????????????????????????? LOWCOD-799
        if (table.indexOf(SymbolConstant.SYS_VAR_PREFIX) >= 0) {
            table = QueryGenerator.getSqlRuleValue(table);
        }
        //update-end-author:taoyan date:20200820 for:???Online+???????????????????????????????????????????????????????????? LOWCOD-799
        String[] arr = new String[]{text, code};
        SqlInjectionUtil.filterContent(arr);
        SqlInjectionUtil.specialFilterContentForDictSql(table);
        return sysDictService.queryTableDictItemsByCode(table, text, code);
    }

    @Override
    public List<DictModel> queryAllDepartBackDictModel() {
        return sysDictService.queryAllDepartBackDictModel();
    }

    @Override
    public void sendSysAnnouncement(MessageDTO message) {
        this.sendSysAnnouncement(message.getFromUser(),
                message.getToUser(),
                message.getTitle(),
                message.getContent(),
                message.getCategory());
        try {
            // ?????????????????????APP??????
//			wechatEnterpriseService.sendMessage(message, true);
//			dingtalkService.sendMessage(message, true);
        } catch (Exception e) {
            log.error("?????????????????????APP???????????????", e);
        }
    }

    @Override
    public void sendBusAnnouncement(BusMessageDTO message) {
        sendBusAnnouncement(message.getFromUser(),
                message.getToUser(),
                message.getTitle(),
                message.getContent(),
                message.getCategory(),
                message.getBusType(),
                message.getBusId());
        try {
            // ?????????????????????APP??????
//			wechatEnterpriseService.sendMessage(message, true);
//			dingtalkService.sendMessage(message, true);
        } catch (Exception e) {
            log.error("?????????????????????APP???????????????", e);
        }
    }

    @Override
    public void sendTemplateAnnouncement(TemplateMessageDTO message) {
        String templateCode = message.getTemplateCode();
        String title = message.getTitle();
        Map<String, String> map = message.getTemplateParam();
        String fromUser = message.getFromUser();
        String toUser = message.getToUser();

        List<SysMessageTemplate> sysSmsTemplates = sysMessageTemplateService.selectByCode(templateCode);
        if (sysSmsTemplates == null || sysSmsTemplates.size() == 0) {
            throw new org.eemp.common.exception.JeecgBootException("???????????????????????????????????????" + templateCode);
        }
        SysMessageTemplate sysSmsTemplate = sysSmsTemplates.get(0);
        //????????????
        title = title == null ? sysSmsTemplate.getTemplateName() : title;
        //????????????
        String content = sysSmsTemplate.getTemplateContent();
        if (map != null) {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                String str = "${" + entry.getKey() + "}";
                if (oConvertUtils.isNotEmpty(title)) {
                    title = title.replace(str, entry.getValue());
                }
                content = content.replace(str, entry.getValue());
            }
        }

        SysAnnouncement announcement = new SysAnnouncement();
        announcement.setTitile(title);
        announcement.setMsgContent(content);
        announcement.setSender(fromUser);
        announcement.setPriority(CommonConstant.PRIORITY_M);
        announcement.setMsgType(CommonConstant.MSG_TYPE_UESR);
        announcement.setSendStatus(CommonConstant.HAS_SEND);
        announcement.setSendTime(new Date());
        announcement.setMsgCategory(CommonConstant.MSG_CATEGORY_2);
        announcement.setDelFlag(String.valueOf(CommonConstant.DEL_FLAG_0));
        sysAnnouncementMapper.insert(announcement);
        // 2.???????????????????????????????????????
        String userId = toUser;
        String[] userIds = userId.split(",");
        String anntId = announcement.getId();
        for (int i = 0; i < userIds.length; i++) {
            if (oConvertUtils.isNotEmpty(userIds[i])) {
                SysUser sysUser = userMapper.getUserByName(userIds[i]);
                if (sysUser == null) {
                    continue;
                }
                SysAnnouncementSend announcementSend = new SysAnnouncementSend();
                announcementSend.setAnntId(anntId);
                announcementSend.setUserId(sysUser.getId());
                announcementSend.setReadFlag(CommonConstant.NO_READ_FLAG);
                sysAnnouncementSendMapper.insert(announcementSend);
                JSONObject obj = new JSONObject();
                obj.put(WebsocketConst.MSG_CMD, WebsocketConst.CMD_USER);
                obj.put(WebsocketConst.MSG_USER_ID, sysUser.getId());
                obj.put(WebsocketConst.MSG_ID, announcement.getId());
                obj.put(WebsocketConst.MSG_TXT, announcement.getTitile());
                webSocket.sendMessage(sysUser.getId(), obj.toJSONString());
            }
        }
        try {
            // ??????????????????????????????????????????
//			dingtalkService.sendActionCardMessage(announcement, true);
//			wechatEnterpriseService.sendTextCardMessage(announcement, true);
        } catch (Exception e) {
            log.error("?????????????????????APP???????????????", e);
        }

    }

    @Override
    public void sendBusTemplateAnnouncement(BusTemplateMessageDTO message) {
        String templateCode = message.getTemplateCode();
        String title = message.getTitle();
        Map<String, String> map = message.getTemplateParam();
        String fromUser = message.getFromUser();
        String toUser = message.getToUser();
        String busId = message.getBusId();
        String busType = message.getBusType();

        List<SysMessageTemplate> sysSmsTemplates = sysMessageTemplateService.selectByCode(templateCode);
        if (sysSmsTemplates == null || sysSmsTemplates.size() == 0) {
            throw new org.eemp.common.exception.JeecgBootException("???????????????????????????????????????" + templateCode);
        }
        SysMessageTemplate sysSmsTemplate = sysSmsTemplates.get(0);
        //????????????
        title = title == null ? sysSmsTemplate.getTemplateName() : title;
        //????????????
        String content = sysSmsTemplate.getTemplateContent();
        if (map != null) {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                String str = "${" + entry.getKey() + "}";
                title = title.replace(str, entry.getValue());
                content = content.replace(str, entry.getValue());
            }
        }
        SysAnnouncement announcement = new SysAnnouncement();
        announcement.setTitile(title);
        announcement.setMsgContent(content);
        announcement.setSender(fromUser);
        announcement.setPriority(CommonConstant.PRIORITY_M);
        announcement.setMsgType(CommonConstant.MSG_TYPE_UESR);
        announcement.setSendStatus(CommonConstant.HAS_SEND);
        announcement.setSendTime(new Date());
        announcement.setMsgCategory(CommonConstant.MSG_CATEGORY_2);
        announcement.setDelFlag(String.valueOf(CommonConstant.DEL_FLAG_0));
        announcement.setBusId(busId);
        announcement.setBusType(busType);
        announcement.setOpenType(SysAnnmentTypeEnum.getByType(busType).getOpenType());
        announcement.setOpenPage(SysAnnmentTypeEnum.getByType(busType).getOpenPage());
        sysAnnouncementMapper.insert(announcement);
        // 2.???????????????????????????????????????
        String userId = toUser;
        String[] userIds = userId.split(",");
        String anntId = announcement.getId();
        for (int i = 0; i < userIds.length; i++) {
            if (oConvertUtils.isNotEmpty(userIds[i])) {
                SysUser sysUser = userMapper.getUserByName(userIds[i]);
                if (sysUser == null) {
                    continue;
                }
                SysAnnouncementSend announcementSend = new SysAnnouncementSend();
                announcementSend.setAnntId(anntId);
                announcementSend.setUserId(sysUser.getId());
                announcementSend.setReadFlag(CommonConstant.NO_READ_FLAG);
                sysAnnouncementSendMapper.insert(announcementSend);
                JSONObject obj = new JSONObject();
                obj.put(WebsocketConst.MSG_CMD, WebsocketConst.CMD_USER);
                obj.put(WebsocketConst.MSG_USER_ID, sysUser.getId());
                obj.put(WebsocketConst.MSG_ID, announcement.getId());
                obj.put(WebsocketConst.MSG_TXT, announcement.getTitile());
                webSocket.sendMessage(sysUser.getId(), obj.toJSONString());
            }
        }
        try {
            // ??????????????????????????????????????????
//			dingtalkService.sendActionCardMessage(announcement, true);
//			wechatEnterpriseService.sendTextCardMessage(announcement, true);
        } catch (Exception e) {
            log.error("?????????????????????APP???????????????", e);
        }

    }

    @Override
    public String parseTemplateByCode(TemplateDTO templateDTO) {
        String templateCode = templateDTO.getTemplateCode();
        Map<String, String> map = templateDTO.getTemplateParam();
        List<SysMessageTemplate> sysSmsTemplates = sysMessageTemplateService.selectByCode(templateCode);
        if (sysSmsTemplates == null || sysSmsTemplates.size() == 0) {
            throw new org.eemp.common.exception.JeecgBootException("???????????????????????????????????????" + templateCode);
        }
        SysMessageTemplate sysSmsTemplate = sysSmsTemplates.get(0);
        //????????????
        String content = sysSmsTemplate.getTemplateContent();
        if (map != null) {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                String str = "${" + entry.getKey() + "}";
                content = content.replace(str, entry.getValue());
            }
        }
        return content;
    }

    @Override
    public void updateSysAnnounReadFlag(String busType, String busId) {
        SysAnnouncement announcement = sysAnnouncementMapper.selectOne(new QueryWrapper<SysAnnouncement>().eq("bus_type", busType).eq("bus_id", busId));
        if (announcement != null) {
            LoginUser sysUser = (LoginUser) SecurityUtils.getSubject().getPrincipal();
            String userId = sysUser.getId();
            LambdaUpdateWrapper<SysAnnouncementSend> updateWrapper = new UpdateWrapper().lambda();
            updateWrapper.set(SysAnnouncementSend::getReadFlag, CommonConstant.HAS_READ_FLAG);
            updateWrapper.set(SysAnnouncementSend::getReadTime, new Date());
            updateWrapper.last("where annt_id ='" + announcement.getId() + "' and user_id ='" + userId + "'");
            SysAnnouncementSend announcementSend = new SysAnnouncementSend();
            sysAnnouncementSendMapper.update(announcementSend, updateWrapper);
        }
    }

    /**
     * ?????????????????????
     *
     * @param dataSource
     * @return
     * @throws SQLException
     */
    private String getDatabaseTypeByDataSource(DataSource dataSource) throws SQLException {
        if ("".equals(DB_TYPE)) {
            Connection connection = dataSource.getConnection();
            try {
                DatabaseMetaData md = connection.getMetaData();
                String dbType = md.getDatabaseProductName().toLowerCase();
                if (dbType.indexOf(DataBaseConstant.DB_TYPE_MYSQL.toLowerCase()) >= 0) {
                    DB_TYPE = DataBaseConstant.DB_TYPE_MYSQL;
                } else if (dbType.indexOf(DataBaseConstant.DB_TYPE_ORACLE.toLowerCase()) >= 0) {
                    DB_TYPE = DataBaseConstant.DB_TYPE_ORACLE;
                } else if (dbType.indexOf(DataBaseConstant.DB_TYPE_SQLSERVER.toLowerCase()) >= 0 || dbType.indexOf(DataBaseConstant.DB_TYPE_SQL_SERVER_BLANK) >= 0) {
                    DB_TYPE = DataBaseConstant.DB_TYPE_SQLSERVER;
                } else if (dbType.indexOf(DataBaseConstant.DB_TYPE_POSTGRESQL.toLowerCase()) >= 0) {
                    DB_TYPE = DataBaseConstant.DB_TYPE_POSTGRESQL;
                } else if (dbType.indexOf(DataBaseConstant.DB_TYPE_MARIADB.toLowerCase()) >= 0) {
                    DB_TYPE = DataBaseConstant.DB_TYPE_MARIADB;
                } else {
                    log.error("???????????????:[" + dbType + "]?????????!");
                    //throw new JeecgBootException("???????????????:["+dbType+"]?????????!");
                }
            } catch (Exception e) {
                log.error(e.getMessage(), e);
            } finally {
                connection.close();
            }
        }
        return DB_TYPE;

    }

    @Override
    public List<DictModel> queryAllDict() {
        // ???????????????
        QueryWrapper<SysDict> queryWrapper = new QueryWrapper<SysDict>();
        queryWrapper.orderByAsc("create_time");
        List<SysDict> dicts = sysDictService.list(queryWrapper);
        // ????????? model
        List<DictModel> list = new ArrayList<DictModel>();
        for (SysDict dict : dicts) {
            list.add(new DictModel(dict.getDictCode(), dict.getDictName()));
        }

        return list;
    }

    @Override
    public List<SysCategoryModel> queryAllSysCategory() {
        List<SysCategory> ls = categoryMapper.selectList(null);
        List<SysCategoryModel> res = oConvertUtils.entityListToModelList(ls, SysCategoryModel.class);
        return res;
    }

    @Override
    public List<DictModel> queryFilterTableDictInfo(String table, String text, String code, String filterSql) {
        return sysDictService.queryTableDictItemsByCodeAndFilter(table, text, code, filterSql);
    }

    @Override
    public List<String> queryTableDictByKeys(String table, String text, String code, String[] keyArray) {
        return sysDictService.queryTableDictByKeys(table, text, code, Joiner.on(",").join(keyArray));
    }

    @Override
    public List<ComboModel> queryAllUserBackCombo() {
        List<ComboModel> list = new ArrayList<ComboModel>();
        List<SysUser> userList = userMapper.selectList(new QueryWrapper<SysUser>().eq("status", 1).eq("del_flag", 0));
        for (SysUser user : userList) {
            ComboModel model = new ComboModel();
            model.setTitle(user.getRealname());
            model.setId(user.getId());
            model.setUsername(user.getUsername());
            list.add(model);
        }
        return list;
    }

    @Override
    public JSONObject queryAllUser(String userIds, Integer pageNo, int pageSize) {
        return null;
    }

    @Override
    public JSONObject queryAllUser(String userIds, Integer pageNo, Integer pageSize) {
        JSONObject json = new JSONObject();
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<SysUser>().eq("status", 1).eq("del_flag", 0);
        List<ComboModel> list = new ArrayList<ComboModel>();
        Page<SysUser> page = new Page<SysUser>(pageNo, pageSize);
        IPage<SysUser> pageList = userMapper.selectPage(page, queryWrapper);
        for (SysUser user : pageList.getRecords()) {
            ComboModel model = new ComboModel();
            model.setUsername(user.getUsername());
            model.setTitle(user.getRealname());
            model.setId(user.getId());
            model.setEmail(user.getEmail());
            if (oConvertUtils.isNotEmpty(userIds)) {
                String[] temp = userIds.split(",");
                for (int i = 0; i < temp.length; i++) {
                    if (temp[i].equals(user.getId())) {
                        model.setChecked(true);
                    }
                }
            }
            list.add(model);
        }
        json.put("list", list);
        json.put("total", pageList.getTotal());
        return json;
    }

    @Override
    public List<ComboModel> queryAllRole() {
        List<ComboModel> list = new ArrayList<ComboModel>();
        List<SysRole> roleList = roleMapper.selectList(new QueryWrapper<SysRole>());
        for (SysRole role : roleList) {
            ComboModel model = new ComboModel();
            model.setTitle(role.getRoleName());
            model.setId(role.getId());
            list.add(model);
        }
        return list;
    }

    @Override
    public List<ComboModel> queryAllRole(String[] roleIds) {
        List<ComboModel> list = new ArrayList<ComboModel>();
        List<SysRole> roleList = roleMapper.selectList(new QueryWrapper<SysRole>());
        for (SysRole role : roleList) {
            ComboModel model = new ComboModel();
            model.setTitle(role.getRoleName());
            model.setId(role.getId());
            model.setRoleCode(role.getRoleCode());
            if (oConvertUtils.isNotEmpty(roleIds)) {
                for (int i = 0; i < roleIds.length; i++) {
                    if (roleIds[i].equals(role.getId())) {
                        model.setChecked(true);
                    }
                }
            }
            list.add(model);
        }
        return list;
    }

    @Override
    public List<String> getRoleIdsByUsername(String username) {
        return sysUserRoleMapper.getRoleIdByUserName(username);
    }

    @Override
    public String getDepartIdsByOrgCode(String orgCode) {
        return departMapper.queryDepartIdByOrgCode(orgCode);
    }

    @Override
    public List<SysDepartModel> getAllSysDepart() {
        List<SysDepartModel> departModelList = new ArrayList<SysDepartModel>();
        List<SysDepart> departList = departMapper.selectList(new QueryWrapper<SysDepart>().eq("del_flag", "0"));
        for (SysDepart depart : departList) {
            SysDepartModel model = new SysDepartModel();
            BeanUtils.copyProperties(depart, model);
            departModelList.add(model);
        }
        return departModelList;
    }

    @Override
    public DynamicDataSourceModel getDynamicDbSourceById(String dbSourceId) {
        SysDataSource dbSource = dataSourceService.getById(dbSourceId);
        if (dbSource != null && StringUtils.isNotBlank(dbSource.getDbPassword())) {
            String dbPassword = dbSource.getDbPassword();
            String decodedStr = SecurityUtil.jiemi(dbPassword);
            dbSource.setDbPassword(decodedStr);
        }
        return new DynamicDataSourceModel(dbSource);
    }

    @Override
    public DynamicDataSourceModel getDynamicDbSourceByCode(String dbSourceCode) {
        SysDataSource dbSource = dataSourceService.getOne(new LambdaQueryWrapper<SysDataSource>().eq(SysDataSource::getCode, dbSourceCode));
        if (dbSource != null && StringUtils.isNotBlank(dbSource.getDbPassword())) {
            String dbPassword = dbSource.getDbPassword();
            String decodedStr = SecurityUtil.jiemi(dbPassword);
            dbSource.setDbPassword(decodedStr);
        }
        return new DynamicDataSourceModel(dbSource);
    }

    @Override
    public List<String> getDeptHeadByDepId(String deptId) {
        List<SysUser> userList = userMapper.selectList(new QueryWrapper<SysUser>().like("depart_ids", deptId).eq("status", 1).eq("del_flag", 0));
        List<String> list = new ArrayList<>();
        for (SysUser user : userList) {
            list.add(user.getUsername());
        }
        return list;
    }

    @Override
    public void sendWebSocketMsg(String[] userIds, String cmd) {
        JSONObject obj = new JSONObject();
        obj.put(WebsocketConst.MSG_CMD, cmd);
        webSocket.sendMessage(userIds, obj.toJSONString());
    }

    @Override
    public List<LoginUser> queryAllUserByIds(String[] userIds) {
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<SysUser>().eq("status", 1).eq("del_flag", 0);
        queryWrapper.in("id", userIds);
        List<LoginUser> loginUsers = new ArrayList<>();
        List<SysUser> sysUsers = userMapper.selectList(queryWrapper);
        for (SysUser user : sysUsers) {
            LoginUser loginUser = new LoginUser();
            BeanUtils.copyProperties(user, loginUser);
            loginUsers.add(loginUser);
        }
        return loginUsers;
    }

    /**
     * ????????????????????????
     *
     * @param userId
     */
    @Override
    public void meetingSignWebsocket(String userId) {
        JSONObject obj = new JSONObject();
        obj.put(WebsocketConst.MSG_CMD, WebsocketConst.CMD_SIGN);
        obj.put(WebsocketConst.MSG_USER_ID, userId);
        //TODO ?????????????????????????????????
        webSocket.sendMessage(obj.toJSONString());
    }

    @Override
    public List<LoginUser> queryUserByNames(String[] userNames) {
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<SysUser>().eq("status", 1).eq("del_flag", 0);
        queryWrapper.in("username", userNames);
        List<LoginUser> loginUsers = new ArrayList<>();
        List<SysUser> sysUsers = userMapper.selectList(queryWrapper);
        for (SysUser user : sysUsers) {
            LoginUser loginUser = new LoginUser();
            BeanUtils.copyProperties(user, loginUser);
            loginUsers.add(loginUser);
        }
        return loginUsers;
    }

    @Override
    public SysDepartModel selectAllById(String id) {
        SysDepart sysDepart = sysDepartService.getById(id);
        SysDepartModel sysDepartModel = new SysDepartModel();
        BeanUtils.copyProperties(sysDepart, sysDepartModel);
        return sysDepartModel;
    }

    @Override
    public List<String> queryDeptUsersByUserId(String userId) {
        List<String> userIds = new ArrayList<>();
        List<SysUserDepart> userDepartList = sysUserDepartService.list(new QueryWrapper<SysUserDepart>().eq("user_id", userId));
        if (userDepartList != null) {
            //??????????????????
            String orgCodes = "";
            StringBuilder orgCodesBuilder = new StringBuilder();
            orgCodesBuilder.append(orgCodes);
            for (SysUserDepart userDepart : userDepartList) {
                //????????????????????????
                SysDepart depart = sysDepartService.getById(userDepart.getDepId());
                int length = YouBianCodeUtil.ZHANWEI_LENGTH;
                String compyOrgCode = "";
                if (depart != null && depart.getOrgCode() != null) {
                    compyOrgCode = depart.getOrgCode().substring(0, length);
                    if (orgCodes.indexOf(compyOrgCode) == -1) {
                        orgCodesBuilder.append(SymbolConstant.COMMA).append(compyOrgCode);
                    }
                }
            }
            orgCodes = orgCodesBuilder.toString();
            if (oConvertUtils.isNotEmpty(orgCodes)) {
                orgCodes = orgCodes.substring(1);
                List<String> listIds = departMapper.getSubDepIdsByOrgCodes(orgCodes.split(","));
                List<SysUserDepart> userList = sysUserDepartService.list(new QueryWrapper<SysUserDepart>().in("dep_id", listIds));
                for (SysUserDepart userDepart : userList) {
                    if (!userIds.contains(userDepart.getUserId())) {
                        userIds.add(userDepart.getUserId());
                    }
                }
            }
        }
        return userIds;
    }

    /**
     * ?????????????????????????????????
     *
     * @param username
     * @return
     */
    @Override
    public Set<String> getUserRoleSet(String username) {
        // ?????????????????????????????????
        List<String> roles = sysUserRoleMapper.getRoleByUserName(username);
        log.info("-------??????????????????????????????????????????Rules------username??? " + username + ",Roles size: " + (roles == null ? 0 : roles.size()));
        return new HashSet<>(roles);
    }

    /**
     * ?????????????????????????????????
     *
     * @param username
     * @return
     */
    @Override
    public Set<String> getUserPermissionSet(String username) {
        Set<String> permissionSet = new HashSet<>();
        List<SysPermission> permissionList = sysPermissionMapper.queryByUser(username);
        for (SysPermission po : permissionList) {
//			// TODO URL??????????????????
//			if (oConvertUtils.isNotEmpty(po.getUrl())) {
//				permissionSet.add(po.getUrl());
//			}
            if (oConvertUtils.isNotEmpty(po.getPerms())) {
                permissionSet.add(po.getPerms());
            }
        }
        log.info("-------??????????????????????????????????????????Perms------username??? " + username + ",Perms size: " + (permissionSet == null ? 0 : permissionSet.size()));
        return permissionSet;
    }

    /**
     * ??????online?????????????????????
     *
     * @param onlineAuthDTO
     * @return
     */
    @Override
    public boolean hasOnlineAuth(OnlineAuthDTO onlineAuthDTO) {
        String username = onlineAuthDTO.getUsername();
        List<String> possibleUrl = onlineAuthDTO.getPossibleUrl();
        String onlineFormUrl = onlineAuthDTO.getOnlineFormUrl();
        //????????????
        LambdaQueryWrapper<SysPermission> query = new LambdaQueryWrapper<SysPermission>();
        query.eq(SysPermission::getDelFlag, 0);
        query.in(SysPermission::getUrl, possibleUrl);
        List<SysPermission> permissionList = sysPermissionMapper.selectList(query);
        if (permissionList == null || permissionList.size() == 0) {
            //?????????????????? ???online??????????????????
            SysPermission sysPermission = new SysPermission();
            sysPermission.setUrl(onlineFormUrl);
            int count = sysPermissionMapper.queryCountByUsername(username, sysPermission);
            if (count <= 0) {
                return false;
            }
        } else {
            //???????????????
            boolean has = false;
            for (SysPermission p : permissionList) {
                int count = sysPermissionMapper.queryCountByUsername(username, p);
                has = has || (count > 0);
            }
            return has;
        }
        return true;
    }

    /**
     * ????????????????????????????????? common api ?????????????????????
     *
     * @param username
     * @return
     */
    @Override
    public Set<String> queryUserRoles(String username) {
        return getUserRoleSet(username);
    }

    /**
     * ????????????????????????????????? common api ?????????????????????
     *
     * @param username
     * @return
     */
    @Override
    public Set<String> queryUserAuths(String username) {
        return getUserPermissionSet(username);
    }

    /**
     * 36????????????????????????(????????????)?????????????????????????????????
     *
     * @param usernames
     * @return
     */
    @Override
    public List<JSONObject> queryUsersByUsernames(String usernames) {
        LambdaQueryWrapper<SysUser> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(SysUser::getUsername, usernames.split(","));
        return JSON.parseArray(JSON.toJSONString(userMapper.selectList(queryWrapper))).toJavaList(JSONObject.class);
    }

    @Override
    public List<JSONObject> queryUsersByIds(String ids) {
        LambdaQueryWrapper<SysUser> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(SysUser::getId, ids.split(","));
        return JSON.parseArray(JSON.toJSONString(userMapper.selectList(queryWrapper))).toJavaList(JSONObject.class);
    }

    /**
     * 37????????????????????????(????????????)?????????????????????????????????
     *
     * @param orgCodes
     * @return
     */
    @Override
    public List<JSONObject> queryDepartsByOrgcodes(String orgCodes) {
        LambdaQueryWrapper<SysDepart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(SysDepart::getOrgCode, orgCodes.split(","));
        return JSON.parseArray(JSON.toJSONString(sysDepartService.list(queryWrapper))).toJavaList(JSONObject.class);
    }

    @Override
    public List<JSONObject> queryDepartsByOrgIds(String ids) {
        return null;
    }

    @Override
    public List<JSONObject> queryDepartsByIds(String ids) {
        LambdaQueryWrapper<SysDepart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(SysDepart::getId, ids.split(","));
        return JSON.parseArray(JSON.toJSONString(sysDepartService.list(queryWrapper))).toJavaList(JSONObject.class);
    }

    /**
     * ?????????
     *
     * @param fromUser
     * @param toUser
     * @param title
     * @param msgContent
     * @param setMsgCategory
     */
    private void sendSysAnnouncement(String fromUser, String toUser, String title, String msgContent, String setMsgCategory) {
        SysAnnouncement announcement = new SysAnnouncement();
        announcement.setTitile(title);
        announcement.setMsgContent(msgContent);
        announcement.setSender(fromUser);
        announcement.setPriority(CommonConstant.PRIORITY_M);
        announcement.setMsgType(CommonConstant.MSG_TYPE_UESR);
        announcement.setSendStatus(CommonConstant.HAS_SEND);
        announcement.setSendTime(new Date());
        announcement.setMsgCategory(setMsgCategory);
        announcement.setDelFlag(String.valueOf(CommonConstant.DEL_FLAG_0));
        sysAnnouncementMapper.insert(announcement);
        // 2.???????????????????????????????????????
        String userId = toUser;
        String[] userIds = userId.split(",");
        String anntId = announcement.getId();
        for (int i = 0; i < userIds.length; i++) {
            if (oConvertUtils.isNotEmpty(userIds[i])) {
                SysUser sysUser = userMapper.getUserByName(userIds[i]);
                if (sysUser == null) {
                    continue;
                }
                SysAnnouncementSend announcementSend = new SysAnnouncementSend();
                announcementSend.setAnntId(anntId);
                announcementSend.setUserId(sysUser.getId());
                announcementSend.setReadFlag(CommonConstant.NO_READ_FLAG);
                sysAnnouncementSendMapper.insert(announcementSend);
                JSONObject obj = new JSONObject();
                obj.put(WebsocketConst.MSG_CMD, WebsocketConst.CMD_USER);
                obj.put(WebsocketConst.MSG_USER_ID, sysUser.getId());
                obj.put(WebsocketConst.MSG_ID, announcement.getId());
                obj.put(WebsocketConst.MSG_TXT, announcement.getTitile());
                webSocket.sendMessage(sysUser.getId(), obj.toJSONString());
            }
        }

    }

    /**
     * ????????? ???????????????
     *
     * @param fromUser
     * @param toUser
     * @param title
     * @param msgContent
     * @param setMsgCategory
     * @param busType
     * @param busId
     */
    private void sendBusAnnouncement(String fromUser, String toUser, String title, String msgContent, String setMsgCategory, String busType, String busId) {
        SysAnnouncement announcement = new SysAnnouncement();
        announcement.setTitile(title);
        announcement.setMsgContent(msgContent);
        announcement.setSender(fromUser);
        announcement.setPriority(CommonConstant.PRIORITY_M);
        announcement.setMsgType(CommonConstant.MSG_TYPE_UESR);
        announcement.setSendStatus(CommonConstant.HAS_SEND);
        announcement.setSendTime(new Date());
        announcement.setMsgCategory(setMsgCategory);
        announcement.setDelFlag(String.valueOf(CommonConstant.DEL_FLAG_0));
        announcement.setBusId(busId);
        announcement.setBusType(busType);
        announcement.setOpenType(SysAnnmentTypeEnum.getByType(busType).getOpenType());
        announcement.setOpenPage(SysAnnmentTypeEnum.getByType(busType).getOpenPage());
        sysAnnouncementMapper.insert(announcement);
        // 2.???????????????????????????????????????
        String userId = toUser;
        String[] userIds = userId.split(",");
        String anntId = announcement.getId();
        for (int i = 0; i < userIds.length; i++) {
            if (oConvertUtils.isNotEmpty(userIds[i])) {
                SysUser sysUser = userMapper.getUserByName(userIds[i]);
                if (sysUser == null) {
                    continue;
                }
                SysAnnouncementSend announcementSend = new SysAnnouncementSend();
                announcementSend.setAnntId(anntId);
                announcementSend.setUserId(sysUser.getId());
                announcementSend.setReadFlag(CommonConstant.NO_READ_FLAG);
                sysAnnouncementSendMapper.insert(announcementSend);
                JSONObject obj = new JSONObject();
                obj.put(WebsocketConst.MSG_CMD, WebsocketConst.CMD_USER);
                obj.put(WebsocketConst.MSG_USER_ID, sysUser.getId());
                obj.put(WebsocketConst.MSG_ID, announcement.getId());
                obj.put(WebsocketConst.MSG_TXT, announcement.getTitile());
                webSocket.sendMessage(sysUser.getId(), obj.toJSONString());
            }
        }
    }

    /**
     * ??????????????????
     *
     * @param email
     * @param title
     * @param content
     */
    @Override
    public void sendEmailMsg(String email, String title, String content) {
        EmailSendMsgHandle emailHandle = new EmailSendMsgHandle();
        emailHandle.sendMsg(email, title, content);
    }

    /**
     * ???????????????????????????????????????id??????
     *
     * @param orgCode
     * @return
     */
    @Override
    public List<Map> getDeptUserByOrgCode(String orgCode) {
        //1.??????????????????
        SysDepart comp = sysDepartService.queryCompByOrgCode(orgCode);
        if (comp != null) {
            //2.????????????????????????
            List<SysDepart> departs = sysDepartService.queryDeptByPid(comp.getId());
            //3.??????????????????????????????
            List<Map> list = new ArrayList();
            //4.?????????????????????????????????
            for (SysDepart dept : departs) {
                Map map = new HashMap(5);
                //????????????
                String departName = dept.getDepartName();
                //????????????????????????????????????id
                List<String> listIds = departMapper.getSubDepIdsByDepId(dept.getId());
                //??????????????????ids?????????????????????????????????
                List<SysUserDepart> userList = sysUserDepartService.list(new QueryWrapper<SysUserDepart>().in("dep_id", listIds));
                List<String> userIds = new ArrayList<>();
                for (SysUserDepart userDepart : userList) {
                    if (!userIds.contains(userDepart.getUserId())) {
                        userIds.add(userDepart.getUserId());
                    }
                }
                map.put("name", departName);
                map.put("ids", userIds);
                list.add(map);
            }
            return list;
        }
        return null;
    }

    /**
     * ????????????????????????
     *
     * @param ids ???????????????id
     * @return
     */
    @Override
    public List<String> loadCategoryDictItem(String ids) {
        return sysCategoryService.loadDictItem(ids, false);
    }

    /**
     * ????????????code????????????text
     *
     * @param dictCode ?????????tableName,text,code
     * @param keys     ????????????key
     * @return
     */
    @Override
    public List<String> loadDictItem(String dictCode, String keys) {
        String[] params = dictCode.split(",");
        return sysDictService.queryTableDictByKeys(params[0], params[1], params[2], keys, false);
    }

    /**
     * ????????????code???????????????
     *
     * @param dictCode ?????????tableName,text,code
     * @param dictCode ????????????key
     * @return
     */
    @Override
    public List<DictModel> getDictItems(String dictCode) {
        List<DictModel> ls = sysDictService.getDictItems(dictCode);
        if (ls == null) {
            ls = new ArrayList<>();
        }
        return ls;
    }

    /**
     * ??????????????????code?????????????????????
     *
     * @param dictCodeList
     * @return key = dictCode ??? value=??????????????????
     */
    @Override
    public Map<String, List<DictModel>> getManyDictItems(List<String> dictCodeList) {
        return sysDictService.queryDictItemsByCodeList(dictCodeList);
    }

    /**
     * ??????????????????
     * ???????????????????????? ???????????????????????????????????????????????????
     *
     * @param dictCode ??????code?????????table,text,code
     * @param keyword  ???????????????
     * @return
     */
    @Override
    public List<DictModel> loadDictItemByKeyword(String dictCode, String keyword, Integer pageSize) {
        return sysDictService.loadDict(dictCode, keyword, pageSize);
    }

    @Override
    public Map<String, List<DictModel>> translateManyDict(String dictCodes, String keys) {
        List<String> dictCodeList = Arrays.asList(dictCodes.split(","));
        List<String> values = Arrays.asList(keys.split(","));
        return sysDictService.queryManyDictByKeys(dictCodeList, values);
    }

    @Override
    public List<DictModel> translateDictFromTableByKeys(String table, String text, String code, String keys) {
        return sysDictService.queryTableDictTextByKeys(table, text, code, Arrays.asList(keys.split(",")));
    }
//
//	@Autowired
//	private DdSendMsgHandle ddSendMsgHandle;

    @Override
    public void sendTemplateMessage(MessageDTO message) {
        String messageType = message.getType();
        //update-begin-author:taoyan date:2022-7-9 for: ???????????????????????????????????????, ????????????????????????
        String templateCode = message.getTemplateCode();
        if (oConvertUtils.isNotEmpty(templateCode)) {
            SysMessageTemplate templateEntity = getTemplateEntity(templateCode);
            boolean isMarkdown = CommonConstant.MSG_TEMPLATE_TYPE_MD.equals(templateEntity.getTemplateType());
            String content = templateEntity.getTemplateContent();
            if (oConvertUtils.isNotEmpty(content) && null != message.getData()) {
                content = FreemarkerParseFactory.parseTemplateContent(content, message.getData(), isMarkdown);
            }
            message.setIsMarkdown(isMarkdown);
            message.setContent(content);
        }
        if (oConvertUtils.isEmpty(message.getContent())) {
            throw new JeecgBootException("??????????????????,?????????????????????");
        }
        //update-end-author:taoyan date:2022-7-9 for: ???????????????????????????????????????, ????????????????????????
        if (MessageTypeEnum.XT.getType().equals(messageType)) {
            if (message.isMarkdown()) {
                // ?????????????????????Markdown
                message.setContent(HTMLUtils.parseMarkdown(message.getContent()));
            }
            systemSendMsgHandle.sendMessage(message);
        } else if (MessageTypeEnum.YJ.getType().equals(messageType)) {
            if (message.isMarkdown()) {
                // ?????????????????????Markdown
                message.setContent(HTMLUtils.parseMarkdown(message.getContent()));
            }
            emailSendMsgHandle.sendMessage(message);
        } else if (MessageTypeEnum.DD.getType().equals(messageType)) {
//			ddSendMsgHandle.sendMessage(message);
        } else if (MessageTypeEnum.QYWX.getType().equals(messageType)) {
            qywxSendMsgHandle.sendMessage(message);
        }
    }

    @Override
    public String getTemplateContent(String code) {
        List<SysMessageTemplate> list = sysMessageTemplateService.selectByCode(code);
        if (list == null || list.size() == 0) {
            return null;
        }
        return list.get(0).getTemplateContent();
    }

    /**
     * ???????????????????????????markdown
     *
     * @param code
     * @return
     */
    public SysMessageTemplate getTemplateEntity(String code) {
        List<SysMessageTemplate> list = sysMessageTemplateService.selectByCode(code);
        if (list == null || list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    //-------------------------------------??????????????????????????????-----------------------------------------------

    @Override
    public void saveDataLog(DataLogDTO dataLogDto) {
        SysDataLog entity = new SysDataLog();
        entity.setDataTable(dataLogDto.getTableName());
        entity.setDataId(dataLogDto.getDataId());
        entity.setDataContent(dataLogDto.getContent());
        entity.setType(dataLogDto.getType());
        entity.setDataVersion("1");
        sysDataLogService.save(entity);
    }

    @Override
    public void addSysFiles(SysFilesModel sysFilesModel) {
        SysFiles sysFiles = new SysFiles();
        BeanUtils.copyProperties(sysFilesModel, sysFiles);
        String defaultValue = "0";
        sysFiles.setIzStar(defaultValue);
        sysFiles.setIzFolder(defaultValue);
        sysFiles.setIzRootFolder(defaultValue);
        sysFiles.setDelFlag(defaultValue);
        sysFilesService.save(sysFiles);
    }

    @Override
    public String getFileUrl(String fileId) {
        SysFiles sysFiles = sysFilesService.getById(fileId);
        return sysFiles.getUrl();
    }

    @Override
    public void updateAvatar(LoginUser loginUser) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(loginUser, sysUser);
        sysUserService.updateById(sysUser);
    }

    @Override
    public void sendAppChatSocket(String userId) {
        JSONObject obj = new JSONObject();
        obj.put(WebsocketConst.MSG_CMD, WebsocketConst.MSG_CHAT);
        obj.put(WebsocketConst.MSG_USER_ID, userId);
        webSocket.sendMessage(userId, obj.toJSONString());
    }
}