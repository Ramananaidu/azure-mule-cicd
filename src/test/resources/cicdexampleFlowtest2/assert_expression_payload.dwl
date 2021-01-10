%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "result": "Sucess",
  "correlationId": "253563"
})