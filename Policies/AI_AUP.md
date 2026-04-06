AI Acceptable Usable Policy (AUP)
1. Purpose
This document outlines the AI Acceptable Use Policy ("AUP") for the use of artificial intelligence (AI) technology within our organization.
The goal of this policy is to promote innovative ideas while helping mitigate the risks associated with leakage of intellectual property ("IP"), protection of data privacy and prevention of shadow usage of AI.

2. Scope
The AUP applies to everyone that has authorized access to the organization's resources including employees, contractors and third-party parties. It covers:
- Generative AI: Large Language Models (LLMs) like ChatGPT, Claude, and Gemini.
- Code Assistants: GitHub Copilot, Cursor, Windsurf.
- Integrated AI: AI features embedded in existing SaaS tools (e.g., grammarly, Zoom AI).

3. Data Classification & Usage
To ensure compliance with SOC 2 and ISO 42001, data must be handled according to the following matrix:

Data Classification	    Public AI (e.g., ChatGPT Free)	    Enterprise AI (e.g., AWS Bedrock)	
Public Information	            Allowed	                                Allowed	
Internal Only	                Prohibited	                              Allowed	
Confidential/PII	        Strictly Prohibited	                      Restricted (Requires Privacy Impact Assessment)	
Source Code	              Strictly Prohibited	                      Allowed (Enterprise Version Only)

4. Approved vs. Unauthorized AI Services
The Governance, Risk and Compliance ("GRC") team has developed a "Whitelist" of acceptable AI services.
- Approved: Company-provided GitHub Copilot (Enterprise version).
- Unauthorized ("Shadow AI"): Personal OpenAI Accounts; Unverified Browser Extensions; 

5. Monitoring and Enforcement
In line with ISO 27001:2022 A.8.15, our organisation will perform automated continuous monitoring (detection) to identify any unapproved AI API calls.
- Detection: DNS Request Logging with Route 53.
- Alerting: CloudWatch Alarms will generate real-time alerts for AI access to unapproved domains.
- Consequences: Any non-compliance with this Policy may result in access being revoked and/or potential disciplinary action.

6. Prohibited Activities
- Prompt Injection - Attempting to circumvent the safety filters of AI systems.
- Automated Exfiltration - Using automated means (such as scripts or Docker containers) for the systematic exfiltration of company data to unapproved AI systems.
- Shadow AI - Deploying AI models in an operational capacity without conducting a Formal Risk Assessment.
