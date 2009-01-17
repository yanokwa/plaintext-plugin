//
//  PlainTextPlugin.m
//  PlainTextPlugin
//
//  Created by Yaw Anokwa on 09/11/08.
//  Copyright 2008 Yaw Anokwa. All rights reserved.
//

#import "PlainTextPlugin.h"



/*
 * @class PlainTextPlugin
 * @brief Filter plugin which converts strips bold, italics and underline from incoming text.
 */

@implementation PlainTextPlugin

- (void)installPlugin
{	
	NSLog(@"PlainTextPlugin installed");
	
	// Changes actual message and non-message content
	[[adium contentController] registerContentFilter:self ofType:AIFilterContent direction:AIFilterOutgoing];
	[[adium contentController] registerContentFilter:self ofType:AIFilterContent direction:AIFilterIncoming];
}

- (void)uninstallPlugin
{
	NSLog(@"PlainTextPlugin uninstalled");
	
	[[adium contentController] unregisterContentFilter:self];
}


- (NSAttributedString *)filterAttributedString:(NSAttributedString *)inAttributedString context:(id)context
{
	NSMutableAttributedString *newMessage = [[NSMutableAttributedString alloc] initWithAttributedString:inAttributedString];
	
	// remove bold, italics and underline
	[newMessage applyFontTraits:NSUnboldFontMask range:NSMakeRange(0, [newMessage length])];
	[newMessage applyFontTraits:NSUnitalicFontMask range:NSMakeRange(0, [newMessage length])];
	[newMessage removeAttribute:NSUnderlineStyleAttributeName range:NSMakeRange(0, [newMessage length])];
	
	// remove color and size?
	
	return [newMessage autorelease];
}

- (float)filterPriority
{
	return DEFAULT_FILTER_PRIORITY;
}


- (NSString *)pluginAuthor
{
	return @"Yaw Anokwa";
}

- (NSString *)pluginVersion
{
	return @"1.2";
}

- (NSString *)pluginDescription
{
	return @"This plugin removes bold, italics and underline formatting from incoming messages.";
}

- (NSString *)pluginURL
{
	return @"http://www.adiumxtras.com/index.php?a=xtras&xtra_id=1977";
}
@end
