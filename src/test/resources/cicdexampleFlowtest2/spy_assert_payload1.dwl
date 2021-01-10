%dw 2.0
import * from dw::test::Asserts
---
payload must [
  beObject(),
  $[*"result"] must haveSize(1),
  $[*"result"][0] must equalTo("Sucess")
]