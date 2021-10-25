%dw 2.0
fun updateRequestIdsApiHeader(apiHeader, requestId, previousRequestId) = 
apiHeader mapObject (value, key) -> {
	(x_request_id: requestId) if(key as String == "x_request_id"),
	(x_previous_request_id: previousRequestId) if(key as String == "x_previous_request_id"),
	((key): value) if(key as String != "x_request_id" and key as String != "x_previous_request_id")
}
