package org.hibernaterevengwrapper;

import org.hibernate.cfg.reveng.DelegatingReverseEngineeringStrategy;
import org.hibernate.cfg.reveng.ReverseEngineeringStrategy;
import org.hibernate.cfg.reveng.TableIdentifier;

public class CustomDelegatingReverseEngineeringStrategy extends DelegatingReverseEngineeringStrategy {

    public CustomDelegatingReverseEngineeringStrategy(ReverseEngineeringStrategy delegate) {
        super(delegate);
    }

    @Override
    public String tableToClassName(TableIdentifier tableIdentifier) {
        String className = super.tableToClassName(tableIdentifier);
        return Inflector.getInstance().singularize(className);
    }

}
