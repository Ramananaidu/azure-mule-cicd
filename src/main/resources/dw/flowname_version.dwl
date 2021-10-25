%dw 2.0
output application/java
---
"api-template-api-status-get-" ++ Mule::p('flowname.version.status.post')
