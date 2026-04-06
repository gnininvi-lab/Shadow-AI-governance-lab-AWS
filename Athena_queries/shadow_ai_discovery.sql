- Purpose: Identify unauthorized AI API calls from VPC Flow/Route53 Logs
- Mapping: ISO 27001:2022 A.8.15 (Logging)
SELECT 
    query_timestamp, 
    srcaddr AS source_ip, 
    query_name AS accessed_ai_domain
FROM shadow_ai_discovery.r53_query_logs
WHERE query_name LIKE '%openai.com%' 
   OR query_name LIKE '%googleapis.com%'
ORDER BY query_timestamp DESC;
