//
//  PlainTextPlugin.h
//  PlainTextPlugin
//
//  Created by Yaw Anokwa on 09/11/08.
//  Copyright 2008 Yaw Anokwa. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <Adium/AIPlugin.h>
#import <Adium/AISharedAdium.h>
#import <Adium/AIContentControllerProtocol.h>

@protocol AIContentFilter;

@interface PlainTextPlugin : AIPlugin <AIContentFilter> {
}

@end

