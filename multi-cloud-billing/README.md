# Open Source Implementation Options for Multi-Cloud Billing Aggregation
# Problem: How do we aggregate billing and cost from different multi-cloud deployments?  In a multi-cloud deployment scenario one needs to keep track and aggregate billing from multiple cloud providers.  
# The key motivations for the pattern are:
-	Aggregate billing helps with chargeback to appropriate cost centers
-	One might want to make sure that none of the cloud providers exceed billing quotas
-	You might want to generate alerts based on cloud utilization
-	It also might make sense to process more using a cheaper cloud provider based on billing metrics

# Options referenced in this repository
- Bilean is a billing service for OpenStack clouds, it provides trigger-type billing based on other OpenStack services' notification.
- Elastic-bill is a multi-cloud platform billing management tool. Using this tool you can manage your billing, resource utilization across multiple cloud platforms
- Forecast is Hybrid Cloud metering/billing system