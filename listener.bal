import ballerina/http;
import app.test.interceptors;

interceptors:RequestValidator requestValidator = new;

listener http:Listener serviceListener1 = new (8090, config = {
    interceptors: [requestValidator]
});
listener http:Listener serviceListener2 = new (8091, config = {});
