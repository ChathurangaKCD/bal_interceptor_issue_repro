import ballerina/http;
import ballerina/log;

public isolated service class RequestValidator {
    *http:RequestInterceptor;

    isolated resource function 'default [string... path](http:RequestContext ctx, http:Request req)
    returns http:NextService|error? {
        var shouldRead = req.getQueryParamValue("read_body_in_interceptor") == "true";
        if shouldRead{
            var jsonPayload = req.getJsonPayload();
            if jsonPayload is json {
                log:printInfo("RequestValidator: request body",jsonPayload=jsonPayload );
            }
        }
        return ctx.next();
    }
}