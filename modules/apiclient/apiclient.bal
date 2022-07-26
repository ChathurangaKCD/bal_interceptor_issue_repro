import ballerina/http;

final http:Client c = check new ("http://localhost:8091");

public isolated function forwardRequest(http:Request req) returns json|error {
    return c->forward("/api/test", req, targetType = json);
}
