import ballerina/log;

service /api on serviceListener2 {
    resource function default test() returns json {
        log:printInfo("serviceListener2: request recieved" );
        return {api2: true};
    }
}
