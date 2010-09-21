//
//  Client.m
//  DailyPapr
//
//  Created by Diogo on 9/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Client.h"

@implementation Client

- (void)getWallpapers
{	
	[super get:[self getURL]];
}

- (void)DPConnectionDidFailWithError:(NSError*)anError
{
	[delegate clientDidFail:self error:[anError localizedDescription]];
	
    [self autorelease];
}

- (void)DPConnectionDidFinishLoading:(NSString*)content
{
    if (statusCode == 200 && [buffer length] > 0) {
		NSXMLDocument *document = [[NSXMLDocument alloc] initWithData:buffer options:NSXMLDocumentTidyHTML error:&error];			
		NSArray *wallpapers = [self parseDocument:document];			
		[delegate clientDidSucceed:wallpapers];
    } else {
		[delegate clientDidFail:self error:[NSString stringWithFormat:@"Server responded with %d", statusCode]];
    }
	
    [self autorelease];
}

- (NSString*)getURL
{
	// let the subclasses implement it
}

- (NSArray*)parseDocument:(NSXMLDocument*)document
{
	// let the subclasses implement it
}

- (void)dealloc
{
	[error release];
	
	[super dealloc];
}

@end

