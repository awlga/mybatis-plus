package ${package.ServiceImpl};

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import ${superServiceImplClassPackage};
import com.sunny.projectman.common.QueryGenerator;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import java.io.Serializable;
import java.util.Arrays;

/**
 * ${table.comment!} 服务实现类
 *
 * @author ${author}
 * @since ${date}
 */
@Service
<#if kotlin>
open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}>(), ${table.serviceName} {

}
<#else>
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}> implements ${table.serviceName} {
    @Override
    public IPage<${entity}> page(Page<${entity}> page, ${entity} ${entity?uncap_first}) {
        QueryWrapper queryWrapper = new QueryWrapper();
        QueryGenerator.installMplus(queryWrapper, ${entity?uncap_first}, null);
        return baseMapper.selectPage(page, queryWrapper);
    }

    @Override
    public boolean save(${entity} entity) {
        return super.save(entity);
    }

    @Override
    public boolean updateById(${entity} entity) {
        ${entity} ${entity?uncap_first} = super.getById(entity.getId());
        if (${entity?uncap_first} == null) {
            throw new RuntimeException("未找到对应实体");
        }
        return super.updateById(entity);
    }

    @Override
    public boolean removeByIds(String idList) {
        if (StrUtil.isBlank(idList)) {
            throw new RuntimeException("参数不识别！");
        }
        return super.removeByIds(Arrays.asList(idList.split(",")));
    }

    @Override
    public ${entity} getById(Serializable id) {
        ${entity} ${entity?uncap_first} = super.getById(id);
        if (${entity?uncap_first}==null) {
            throw new RuntimeException("未找到对应实体");
        }
        return ${entity?uncap_first};
    }

}
</#if>
