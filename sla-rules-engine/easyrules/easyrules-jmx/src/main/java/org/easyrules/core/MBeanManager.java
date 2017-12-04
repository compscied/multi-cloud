/*
 * The MIT License
 *
 *  Copyright (c) 2016, Mahmoud Ben Hassine (mahmoud.benhassine@icloud.com)
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */

package org.easyrules.core;

import javax.management.MBeanServer;
import javax.management.MalformedObjectNameException;
import javax.management.ObjectName;
import java.lang.management.ManagementFactory;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Handles keeping track of MBeans and helps reduce Boilerplate code.
 *
 * @author Drem Darios (drem.darios@gmail.com)
 */
class MBeanManager {

    private static final Logger LOGGER = Logger.getLogger(MBeanManager.class.getName());

    /**
     * The JMX server instance in which rule's MBeans will be registered.
     */
    private MBeanServer mBeanServer = ManagementFactory.getPlatformMBeanServer();

    /*
     * Unregister the JMX MBean of a rule.
     */
    public void unregisterJmxMBean(final Object rule) {

        ObjectName name;
        try {
            name = getObjectName(rule);
            if (mBeanServer.isRegistered(name)) {
                mBeanServer.unregisterMBean(name);
                LOGGER.log(Level.INFO, "JMX MBean unregistered successfully for rule: ''{0}''", rule);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, String.format("Unable to unregister JMX MBean for rule: '%s'", rule), e);
        }
    }

    /*
     * Register a JMX MBean for a rule.
     */
    public void registerJmxMBean(final Object rule) {

        ObjectName name;
        try {
            name = getObjectName(rule);
            if (!mBeanServer.isRegistered(name)) {
                mBeanServer.registerMBean(rule, name);
                LOGGER.log(
                        Level.INFO,
                        "JMX MBean registered successfully as: ''{0}'' for rule: ''{1}''",
                        new Object[]{name.getCanonicalName(), rule});
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, String.format("Unable to register JMX MBean for rule: '%s'", rule), e);
        }

    }

    /*
     * Utility method to get rule's JMX Object name
     */
    private ObjectName getObjectName(Object rule)
            throws MalformedObjectNameException {
        return new ObjectName(String.format("org.easyrules.core.jmx:type=%s,name=%s", rule.getClass().getSimpleName(), rule));
    }
}
