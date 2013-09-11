//
//  AppDelegate.m
//  CocoaServer
//
//  Created by sanooj_s on 9/11/13.
//  Copyright (c) 2013 sanooj_s. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    NSLog(@"applicationDidFinishLaunching");
    
    registeredUsers =
    [[NSMutableArray alloc]init];
    
    //service object that will
    //advertise the server's
    //existence on the local network
    
    //To publish a service only on your own computer so that
    //your applications can find each other, use the string
    //local., including the dot.)
    service =
    [[NSNetService alloc]initWithDomain:@""
                                   type:@"_http._tcp"
                                   name:@"CocoaHTTPServer"
                                   port:10000];
    
    [service setDelegate:self];
    [service publish];
    
}


//NSNetServiceDelegate

-(void)netServiceDidPublish:(NSNetService *)sender
{
    NSLog(@"netServiceDidPublish");
    //service succeeds in publishing
    [[self statusField]setStringValue:@"Server is advertising"];
}

-(void)netServiceDidStop:(NSNetService *)sender
{
     NSLog(@"netServiceDidStop");
    //service stops for some reason
    [[self statusField]setStringValue:@"Service is not advertising"];
}

-(void)netService:(NSNetService *)sender didNotPublish:(NSDictionary *)errorDict
{
    NSLog(@"netService:didNotPublish:");
    // If the service fails to publish, either immediately or in the future...
    [[self statusField]setStringValue:@"Server is not advertising"];
}

@end
