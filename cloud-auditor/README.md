# Multi-Cloud Auditor Pattern
- Problem: How do we ensure that all of our cloud deployments are secure and have not been tempered with?

# Example Open Source Projects

# AWS - Scout2
- Scout2 is a security tool that lets AWS administrators assess their environment's security posture. Using the AWS API, Scout2 gathers configuration data for manual inspection and highlights high-risk areas automatically. Rather than pouring through dozens of pages on the web, Scout2 supplies a clear view of the attack surface automatically.
- https://github.com/nccgroup/Scout2

#AWS - Cloud Custodian
- "Cloud Custodian is a rules engine for AWS fleet management. It allows users to define policies to enable a well managed cloud infrastructure, that's both secure and cost optimized. It consolidates many of the adhoc scripts organizations have into a lightweight and flexible tool, with unified metrics and reporting.
- Custodian can be used to manage AWS accounts by ensuring real time compliance to security policies (like encryption and access requirements), tag policies, and cost management via garbage collection of unused resources and off-hours resource management."
- https://github.com/capitalone/cloud-custodian

#Google Cloud - gcp-audit
- A tool for auditing security properties of GCP projects. Inspired by Scout2.
- gcp-audit takes a set of projects and audits them for common issues as defined by its ruleset. Issues can include, but are certainly not limited to, storage buckets with read/write permissions for anyone and compute engine instances with services exposed to the Internet.
- The results are written to a report containing information about issues that were found along with information about which objects these issues were found in so that it's possible to address the problems.
- https://github.com/spotify/gcp-audit
- https://labs.spotify.com/2017/02/22/google-cloud-security-toolbox/

