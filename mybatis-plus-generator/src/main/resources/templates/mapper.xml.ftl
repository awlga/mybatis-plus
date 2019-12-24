<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package.Mapper}.${table.mapperName}">

<#if enableCache>
    <!-- 开启二级缓存 -->
    <cache type="org.mybatis.caches.ehcache.LoggingEhcache"/>

</#if>

    <sql id="result_column">
        <#list table.fields as po>
            <#if po_index!=0>,</#if>${table.name}.${po.name} as ${po.propertyName}
        </#list>
    </sql>

    <sql id="query_sql_n" >
        select
        <include refid="result_column"/>
        from ${table.name}
    </sql>
    <sql id="query_sql">
        <include refid="query_sql_n" />
        ${r"${ew.customSqlSegment}"}
    </sql>

    <select id="selectById" resultType="${package.Entity}.${entity}">
        <include refid="query_sql_n" />
        where id=${r"${_parameter}"}
    </select>

    <select id="selectPage" resultType="${package.Entity}.${entity}">
        <include refid="query_sql"/>
    </select>

    <select id="selectList" resultType="${package.Entity}.${entity}">
        <include refid="query_sql"/>
    </select>
</mapper>
