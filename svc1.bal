import ballerina/http;
import ballerina/log;
import app_test.apiclient;

service /api on serviceListener1 {
    resource function default test(http:Request req) returns json {
        var read_body_in_svc = req.getQueryParamValue("read_body_in_svc");
        if read_body_in_svc== "true"{
            json|http:ClientError jsonPayload = req.getJsonPayload();
            if jsonPayload is json {
                log:printInfo("read_body_in_svc", jsonPayload = jsonPayload);
            }
        }
        var res = apiclient:forwardRequest(req);
        if res is json{
            log:printInfo("res:", res= res);
            return {res : res, success: true};
        }else{
            log:printInfo("res err");
        }
        return { success: false };
    }
}
