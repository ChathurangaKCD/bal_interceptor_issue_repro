This request doesn't complete.
```
curl --location --request POST 'http://localhost:8090/api/test?read_body_in_interceptor=true' \
--header 'Content-Type: text/plain' \
--data-raw '{
	"testKey": "testVal"
}'
```
```
time = 2022-07-26T12:47:05.740+05:30 level = INFO module = chathurangada/app_test.interceptors message = "RequestValidator: request body" jsonPayload = {"testKey":"testVal"}
time = 2022-07-26T12:47:05.752+05:30 level = INFO module = chathurangada/app_test.apiclient message = "forwarding..."
```

This one works as expected.
```
curl --location --request POST 'http://localhost:8090/api/test?read_body_in_svc=true&read_body_in_interceptor=true' \
--header 'Content-Type: text/plain' \
--data-raw '{
	"testKey": "testVal"
}'
```
```
time = 2022-07-26T12:46:42.535+05:30 level = INFO module = chathurangada/app_test.interceptors message = "RequestValidator: request body" jsonPayload = {"testKey":"testVal"}
time = 2022-07-26T12:46:42.542+05:30 level = INFO module = chathurangada/app_test message = "read_body_in_svc" jsonPayload = {"testKey":"testVal"}
time = 2022-07-26T12:46:42.548+05:30 level = INFO module = chathurangada/app_test.apiclient message = "forwarding..."
time = 2022-07-26T12:46:42.577+05:30 level = INFO module = chathurangada/app_test message = "serviceListener2: request recieved"
time = 2022-07-26T12:46:42.602+05:30 level = INFO module = chathurangada/app_test.apiclient message = "forwarded successfully"
time = 2022-07-26T12:46:42.605+05:30 level = INFO module = chathurangada/app_test message = "res:" res = {"api2":true}
```