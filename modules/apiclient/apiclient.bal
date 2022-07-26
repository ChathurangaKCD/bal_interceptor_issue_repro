import ballerina/http;
import ballerina/log;

final http:Client c = check new ("http://localhost:8091");

public isolated function forwardRequest(http:Request req) returns json|error {
    log:printInfo("forwarding...");
    var res = c->forward("/api/test", req, targetType = json);
    log:printInfo("forwarded successfully");
    return res;
}
