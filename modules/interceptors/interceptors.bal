import ballerina/http;
import ballerina/log;

public isolated service class RequestValidator {
    *http:RequestInterceptor;

    isolated resource function 'default [string... path](http:RequestContext ctx, http:Request req)
    returns http:NextService|error? {
        var shouldRead = req.getQueryParamValue("read_body_in_interceptor");
        if shouldRead == "true"{
            var jsonPayload = req.getJsonPayload();
            if jsonPayload is json {
                log:printInfo("requst body",jsonPayload=jsonPayload );
            }
        }
        return ctx.next();
    }
}