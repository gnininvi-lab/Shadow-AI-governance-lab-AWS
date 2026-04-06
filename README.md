# Automated Shadow AI Discovery & Governance Lab (AWS)

## Executive Summary
As organizations rapidly adopt Generative AI, "Shadow AI"—the unauthorized use of AI services—poses a significant risk to data privacy and intellectual property. This project demonstrates a technical implementation of a Continuous Monitoring Control in AWS. 
By simulating unauthorized AI traffic via Docker, I engineered a serverless detection pipeline that identifies unvetted AI API calls (OpenAI, Gemini, etc.) and triggers real-time alerts for GRC oversight.

## Governance & Compliance Mapping
This lab operationalizes key controls within global AI and Security frameworks:
Control Area                  AWS Implementation                 Framework Alignment 
AI Policy Enforcement         Route 53 Resolver Logs             ISO 42001:2023 (Clause 5.2) 
Continuous Monitoring         CloudWatch Metric Filters          NIST CSF 2.0 (PR.DS-11) 
Audit Logging Amazon           S3 + Athena                       SOC 2 Type II (CC6.6 / CC7.1) 

## Technical Architecture
The solution utilizes a "Defense in Depth" approach to monitor outbound network traffic:

1. Simulation Layer:A Dockerized Alpine Linux container running on EC2 acts as a "Shadow AI" user, periodically pinging AI endpoints.
2. Ingestion Layer:Route 53 Resolver Query Logging - captures every DNS request within the VPC.
3. Storage Layer: Logs are archived in Amazon S3 for long-term audit retention and compliance.
4. Analysis Layer: Amazon Athena provides a SQL interface to query raw JSON logs for unauthorized domain access.
5. Alerting Layer:** CloudWatch Logs + Metric Filters scan for patterns and trigger SNS notifications to the GRC team within <2 minutes of detection.

## Lab Execution & Simulation

1. The "Shadow AI" Generator 
I deployed a synthetic user inside a Docker container to validate the control with periodic DNS pings to simulate unauthorized LLM usage:

while true;do wget --spider https://api.openai.com/v1/models; wget --spider https://generativelanguage.googleapis.com/v1/models;

2. Audit Evidence (Athena SQL)
To provide auditors with a list of unauthorized access events:

SELECT query_timestamp, srcaddr, query_name
FROM "shadow_ai_discovery"."r53_query_logs"
WHERE query_name LIKE '%openai%' OR query_name LIKE '%googleapis%'
ORDER BY query_timestamp DESC;

## Evidence of Effectiveness (Screenshots)
1. Detection: Athena Query Results
This screenshot shows attempts to reach unauthorized AI domains.
<img width="1912" height="978" alt="Athena queries result" src="https://github.com/user-attachments/assets/9b429f3c-f1ea-4261-bc8f-cd3873bb113b" />
2. Alerting: Real-time SNS Notification
This screenshot confirms the GRC team received an email alert within 2 minutes of the unauthorized activity.
<img width="1606" height="825" alt="Alert evidence" src="https://github.com/user-attachments/assets/1f350aba-70e6-4391-85de-5cb7a57ffb16" />

## Repository Contents
/Scripts: Dockerfile and scripts used to generate test traffic.
/policies: A sample AI Acceptable Use Policy (AUP) governing organizational AI usage.
/Athena_queries: SQL DDL and DML for Amazon Athena.
/evidence: Visual proof of control effectiveness for audit purposes.

## GRC Wins
- MTTD reduction with near-real-time detection model
- Cost-Effective Governance with the use of serverless AWS tools (Athena/S3)
- Evidence Integrity with an immutable audit trail of DNS traffic that satisfies SOC 2 "Completeness and Accuracy" requirements.




