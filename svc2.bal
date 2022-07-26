import ballerina/http;

service /api on serviceListener2 {
    resource function get test() returns json {
        return {api2: true};
    }
}
