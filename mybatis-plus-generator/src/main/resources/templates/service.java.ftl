package ${package.Service};

import ${package.Entity}.${entity};
import ${superServiceClassPackage};

/**
 * <p>
 * ${table.comment!} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if kotlin>
interface ${table.serviceName} : ${superServiceClass}<${entity}>
<#else>
public interface ${table.serviceName} extends ${superServiceClass}<${entity}> {
    IPage<${entity}> page(Page<${entity}> page, ${entity} ${entity?uncap_first});

    @Override
    boolean save(${entity} ${entity?uncap_first}) ;

    @Override
    boolean updateById(${entity} ${entity?uncap_first});

    boolean removeByIds(String idList);

    @Override
    ${entity} getById(Serializable id);

}
</#if>
