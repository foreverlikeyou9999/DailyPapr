//
//  Client.h
//  DailyPapr
//
//  Created by Diogo on 9/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


#import <Cocoa/Cocoa.h>
#import "DPConnection.h"
#import "Wallpaper.h"

@protocol ClientDelegate
- (void)clientDidSucceed:(NSArray*)wallpapers;
- (void)clientDidFail:(id)sender error:(NSString*)error;
@end

@interface Client : DPConnection {
	NSError *error;
}

- (NSString*)getURL;
- (NSArray*)parseDocument:(NSXMLDocument*)document;

@end
