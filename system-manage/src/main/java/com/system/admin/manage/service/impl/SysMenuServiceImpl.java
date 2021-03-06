package com.system.admin.manage.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.system.admin.entities.SysMenu;
import com.system.admin.manage.mapper.SysMenuMapper;
import com.system.admin.manage.req.SysMenuREQ;
import com.system.admin.manage.service.ISysMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.system.admin.util.base.Result;
import com.system.admin.util.enums.ResultEnum;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单信息表 服务实现类
 * </p>
 *
 * @author Luotianxu
 * @since 2021-08-06
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements ISysMenuService {

    @Override
    public Result queryList(SysMenuREQ req) {
        // 1. 条件查询所有菜单
        QueryWrapper<SysMenu> wrapper = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(req.getName())) {
            wrapper.like("name", req.getName());
        }

        // 将按sort升序，再update_date降序
        wrapper.orderByAsc("sort").orderByDesc("update_date");

        List<SysMenu> menuList = baseMapper.selectList(wrapper);

        // 2. 将菜单封装为树状结构
        List<SysMenu> sysMenus = this.buildTree(menuList);
        return Result.ok(sysMenus);
    }

    @Override
    public Result deleteById(String id) {
        if (StringUtils.isEmpty(id)) {
            return Result.error("评论ID不能为空");
        }
        List<String> ids = new ArrayList<>();
        ids.add(id);
        this.getIds(ids, id);
        baseMapper.deleteBatchIds(ids);
        return Result.ok();
    }

    private void getIds(List<String> ids, String parentId) {
        // 查询子菜单信息
        QueryWrapper<SysMenu> wrapper = new QueryWrapper<>();
        wrapper.eq("parent_id", parentId);
        List<SysMenu> menuList = baseMapper.selectList(wrapper);
        if (CollectionUtils.isNotEmpty(menuList)) {
            for (SysMenu sysMenu : menuList) {
                String id = sysMenu.getId();
                ids.add(id);
                this.getIds(ids, id);
            }
        }
    }

    /**
     * 将菜单封装为树状结构
     *
     * @param menuList 所有的菜单（目录、菜单、按钮）
     * @return 返回已经构建好树菜单集合
     */
    private List<SysMenu> buildTree(List<SysMenu> menuList) {
        // 1. 获取根菜单
        List<SysMenu> rootMenuList = new ArrayList<>();
        for (SysMenu menu : menuList) {
            // parentId=0为根菜单
            if (menu.getParentId().equals("0")) {
                rootMenuList.add(menu);
            }
        }
        // 2. 根菜单下的子菜单
        for (SysMenu menu : rootMenuList) {
            // 获取一个个根菜单，获取后再去获取对应的子菜单
            childrenMenu(menuList, menu);
        }
        // 所有根菜单对象中都将子菜单收集在了对应的children对象中
        return rootMenuList;
    }

    /**
     * 博客管理》标签管理、文章管理
     * 判断父菜单id是否等于所有菜单中的某一个菜单的parentId，如果等于，则这个菜单 就是子菜单
     *
     * @param menuList 所有菜单（目录、菜单、按钮）
     * @param menu     父菜单对象
     * @return
     */
    private SysMenu childrenMenu(List<SysMenu> menuList, SysMenu menu) {
        // 存放menu菜单对象的所有子菜单
        List<SysMenu> children = new ArrayList<>();
        // 循环所有菜单，判断是否为 menu 的子菜单
        for (SysMenu m : menuList) {
            // 判断每个菜单的parentId是否等于menu对象中的id
            if (m.getParentId().equals(menu.getId())) {
                children.add(childrenMenu(menuList, m));
            }
        }
        menu.setChildren(children);
        return menu;
    }

    @Override
    public Result findUserMenuTree(String userId) {
        // 1. 通过用户id查询所有的权限(目录/菜单/按钮)
        List<SysMenu> menuList = baseMapper.findByUserId(userId);
        // 当userId不存在用户信息, menuList 空的, 如果存在用户但没有分配权限就会有一条空记录
        if (CollectionUtils.isEmpty(menuList)
                || menuList.get(0) == null
        ) {
            return Result.build(ResultEnum.MENU_NO);
        }

        // 2. 获取集合中的目录和菜单放到一个集合中,按钮放到一个集合中
        // 存放目录和菜单集合的
        List<SysMenu> dirMenuList = new ArrayList<>();
        // 存放按钮集合的,只要权限标识code值
        List<String> buttonList = new ArrayList<>();
        for (SysMenu menu : menuList) {
            if (menu.getType().equals(1) || menu.getType().equals(2)) {
                // 目录和菜单
                dirMenuList.add(menu);
            } else {
                // 按钮
                buttonList.add(menu.getCode());
            }
        }

        // 3. 封装树状菜单
        List<SysMenu> menuTreeList = this.buildTree(dirMenuList);
        // 4. 响应数据
        Map<String, Object> data = new HashMap<>();
        data.put("menuTreeList", menuTreeList);
        data.put("buttonList", buttonList);
        return Result.ok(data);
    }

    @Override
    public List<SysMenu> findByUserId(String userId) {
        // 通过用户id查询权限信息
        List<SysMenu> menuList = baseMapper.findByUserId(userId);
        if (CollectionUtils.isEmpty(menuList) || menuList.get(0) == null) {
            return null;
        }
        return menuList;
    }
}
