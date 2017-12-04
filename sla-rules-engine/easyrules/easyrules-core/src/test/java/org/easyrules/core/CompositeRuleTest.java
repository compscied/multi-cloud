package org.easyrules.core;

import org.easyrules.api.RulesEngine;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import static org.easyrules.core.RulesEngineBuilder.aNewRulesEngine;
import static org.mockito.Mockito.*;

/**
 * Test class for composite rule execution.
 *
 * @author Mahmoud Ben Hassine (mahmoud.benhassine@icloud.com)
 */
@RunWith(MockitoJUnitRunner.class)
public class CompositeRuleTest {

    @Mock
    private BasicRule rule1, rule2;

    private CompositeRule compositeRule;

    private RulesEngine rulesEngine;

    @Before
    public void setup() throws Exception {

        when(rule1.getName()).thenReturn("r1");
        when(rule1.getDescription()).thenReturn("d1");
        when(rule1.getPriority()).thenReturn(1);
        when(rule1.evaluate()).thenReturn(true);
        when(rule1.compareTo(rule2)).thenCallRealMethod();

        when(rule2.getName()).thenReturn("r2");
        when(rule2.getDescription()).thenReturn("d2");
        when(rule1.getPriority()).thenReturn(2);
        when(rule2.evaluate()).thenReturn(true);
        when(rule2.compareTo(rule1)).thenCallRealMethod();

        compositeRule = new CompositeRule("cr");

        rulesEngine = aNewRulesEngine().build();
    }

    @Test
    public void compositeRuleAndComposingRulesMustBeExecuted() throws Exception {

        compositeRule.addRule(rule1);
        compositeRule.addRule(rule2);

        rulesEngine.registerRule(compositeRule);

        rulesEngine.fireRules();

        verify(rule1).execute();

        verify(rule2).execute();

    }

    @Test
    public void compositeRuleMustNotBeExecutedIfAComposingRuleEvaluatesToFalse() throws Exception {

        when(rule2.evaluate()).thenReturn(false);

        compositeRule.addRule(rule1);
        compositeRule.addRule(rule2);

        rulesEngine.registerRule(compositeRule);

        rulesEngine.fireRules();

        /*
         * The composing rules should not be executed
         * since not all rules conditions evaluate to TRUE
         */

        //Rule 1 should not be executed
        verify(rule1, never()).execute();

        //Rule 2 should not be executed
        verify(rule2, never()).execute();

    }

}
