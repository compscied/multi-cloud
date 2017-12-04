# Open Source Implementation Options for Cloud Healer SLA Rules Pattern
# Problem: 
- You have deployed X number of components on multiple private/public cloud IaaS and you need to keep resurrect / heal the instances that fail.  Additionally something might not be in failed state, but all of the symptoms are there that something is about to fail or over utilized.  For example CPU or Memory is growing and currently at 80% - in this case we can spin up a new instance to horizontally scale and reduce the load on the current components.
- SLA Monitoring feeds information to Cloud Healer / Resurector to process, apply rules and decide on action to be taken.  Here is an example of a rule
- When
-    <Condition is true> CPU_Utilization_Percentage == 80 
- Then
-    <Take desired Action> Invoke_Deployer_to_Create_New_Node()


# JSON Rules - the most simple option in JavaScript
- https://www.npmjs.com/package/json-rules-engine

# Easy Rules - Java - simple
- https://github.com/j-easy/easy-rules


# Drools - Java - more complicated
- To develop and view rules in Eclipse install:
- Install Eclipse: https://www.eclipse.org/downloads/
- Install the GEF Plugin for Eclipse:
~~~~
In Eclipse IDE

Select Help > Install New Software….

In the Work with: combo box type: http://download.eclipse.org/tools/gef/updates/releases/
~~~~~

- Install Drools
~~~~~
Select Help > Install New Software….

In the Work with: combo box type: http://download.jboss.org/drools/release/6.4.0.Final/org.drools.updatesite/

Select all
~~~~~

# SLA Rules and Setup