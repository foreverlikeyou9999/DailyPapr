//
//  DailyPaprController.h
//  DailyPapr
//
//  Created by Diogo on 7/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WallpaperRepository.h"
#import "WallpaperWebService.h"
#import "DailyPaprMenu.h"

@interface DailyPaprController : NSObject {
	IBOutlet DailyPaprMenu *statusMenu;
	NSStatusItem *statusItem;
	WallpaperRepository *repository;
}

-(IBAction)nextWallpaper:(id)sender;

@end
