import ballerina/http;
import ballerina/log;
import app.test.interceptors;
import app.test.apiclient;

service /api on serviceListener1 {
    resource function get test(http:Request req, string read_body_in_svc) returns json {
        if read_body_in_svc == "true"{
            json|http:ClientError jsonPayload = req.getJsonPayload();
            if jsonPayload is json {
                log:printInfo("read_body_in_svc", jsonPayload = jsonPayload);
            }
        }
        var res = apiclient.forwardRequest(req);
        if res is json{
            log:printInfo("res:", res= res);
        }else{
            log:printInfo("res err");
        }
        return {api: true};
    }
}
