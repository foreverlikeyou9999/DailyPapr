//
//  InterfaceLiftClient.m
//  DailyPapr
//
//  Created by Diogo on 9/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InterfaceLiftClient.h"

#define DEFAULT_URL @"http://interfacelift.com/wallpaper_beta/downloads/date/widescreen/1440x900/"

@implementation InterfaceLiftClient


-(NSString*)getURL
{
	return DEFAULT_URL;	
}

- (NSArray*)parseDocument:(NSXMLDocument*)document
{
	NSMutableArray *wallpapers = [[NSMutableArray alloc]initWithCapacity:10];
	
	NSArray *thumbnails = [[document rootElement] nodesForXPath:@"//div[@class='preview']/a/img" error:&error];		
	for (NSXMLElement *img in thumbnails) {
		Wallpaper *wallpaper = [Wallpaper wallpaperWithThumbnailURL:[NSURL URLWithString:[[img attributeForName:@"src"] stringValue]]];
		[wallpaper retain];
		[wallpapers addObject:wallpaper];
	}
	
	NSArray *originals = [[document rootElement] nodesForXPath:@"//div[@class='preview']/div[@class='download']/div" error:&error];		
	NSUInteger i, count = [wallpapers count];
	for (i = 0; i < count; i++) {			
		NSXMLElement *div = [originals objectAtIndex:i];
		NSXMLElement *link = [[div elementsForName:@"a"] objectAtIndex:0];			
		NSString *originalURL = [[link attributeForName:@"href"] stringValue];
		
		Wallpaper *paper = [wallpapers objectAtIndex:i];
		paper.original = [NSURL URLWithString:[@"http://interfacelift.com" stringByAppendingString:originalURL]];
		[wallpapers replaceObjectAtIndex:i withObject:paper];
	}
	
	return wallpapers;
}
@end
