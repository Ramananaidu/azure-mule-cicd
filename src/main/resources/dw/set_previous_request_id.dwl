%dw 2.0
output application/java
---
if(vars.apiHeader.x_request_id != null) (vars.apiHeader.x_request_id) else ("no previous request id")
