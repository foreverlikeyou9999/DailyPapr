//
//  DailyPaprController.m
//  DailyPapr
//
//  Created by Diogo on 7/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DailyPaprController.h"


@implementation DailyPaprController

-(void)awakeFromNib
{
	repository =  [[WallpaperRepository alloc] initWithWebService:[[WallpaperWebService alloc] init]];

	statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:80.0] retain];
	[statusItem setTitle: @"DailyPapr"];
	[statusItem setMenu:statusMenu];
	[statusItem setHighlightMode:YES];
}

-(IBAction)nextWallpaper:(id)sender
{
	Wallpaper *wallpaper = [repository next];
	[statusMenu setUpWallpaper:wallpaper];
	
	[wallpaper release];
}

-(void)dealloc
{
	[statusMenu release];
	[statusItem release];
	[repository release];
	
	[super dealloc];	
}

@end
