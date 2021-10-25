%dw 2.0
output application/json
---
{
  x_correlation_id: vars.correlationId,
  x_message_timestamp: now() as DateTime,
  x_correlation_id_internal_esb: attributes.Headers."x_correlation_id_internal_esb" default "Unknown internal correlation-id",
  x_request_id: null,
  x_previous_request_id: null,
  x_external_reference_id: attributes.Headers."x_external_reference_id" default "Unknown external-reference-id",
  x_domain: Mule::p('secure::api.subdomain'),
  x_origin: attributes.Headers."x_origin" default "Unknown origin",
  x_destination: attributes.Headers."x_destination" default "Unknown destination"
}