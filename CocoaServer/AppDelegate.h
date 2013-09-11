//
//  AppDelegate.h
//  CocoaServer
//
//  Created by sanooj_s on 9/11/13.
//  Copyright (c) 2013 sanooj_s. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,
NSNetServiceDelegate,
NSTableViewDataSource,NSTableViewDelegate>
{
    NSNetService* service;
    NSMutableArray* registeredUsers;
}
@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *statusField;
@property (weak) IBOutlet NSScrollView *tableView;
@end
