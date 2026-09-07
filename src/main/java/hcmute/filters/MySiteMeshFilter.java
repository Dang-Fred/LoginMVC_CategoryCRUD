package hcmute.filters;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class MySiteMeshFilter extends ConfigurableSiteMeshFilter {
    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        // Thiết lập cấu hình trực tiếp bằng Java
        builder.addDecoratorPath("/*", "/web.jsp")
               .addDecoratorPath("/admin/*", "/admin.jsp")
               .addExcludedPath("/login*")
               .addExcludedPath("/api*");
    }
}