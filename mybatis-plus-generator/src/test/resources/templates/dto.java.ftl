package ${package.Entity};


/**
 * @author ${author}
 * @since ${date}
 */
<#if entityLombokModel>
@Data
@Accessors(chain = true)
</#if>
public class ${entity}DTO {
    private ${entity} ${entity?uncap_first};
    private Integer pageNo;
    private Integer pageSize;
}
