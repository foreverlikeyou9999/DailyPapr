//
//  InterfaceLiftClient.h
//  DailyPapr
//
//  Created by Diogo on 9/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DPConnection.h"
#import "Wallpaper.h"

@protocol InterfaceLiftClientDelegate
- (void)interfaceLiftClientDidSucceed:(NSArray*)wallpapers;
- (void)interfaceLiftClientDidFail:(id)sender error:(NSString*)error;
@end


@interface InterfaceLiftClient : DPConnection {

}


- (void)getWallpapers;

@end
