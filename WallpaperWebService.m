//
//  WallpaperWebService.m
//  DailyPapr
//
//  Created by Diogo on 7/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WallpaperWebService.h"

@implementation WallpaperWebService

@synthesize delegate;

-(id)init
{
	if ([super init]) {
		wallpapers = [[NSMutableArray alloc]initWithCapacity:10];
		webData = [[NSMutableData alloc] init];
	}	
	
	return self;
}

-(void)doRequest
{
	[[NSURLConnection alloc] initWithRequest:[self getRequest] delegate:self];	
}

-(NSURLRequest *)getRequest
{
	request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://interfacelift.com/wallpaper_beta/downloads/date/widescreen/1440x900/"]											 
								      cachePolicy:NSURLRequestUseProtocolCachePolicy
							      timeoutInterval:60.0];
	
	NSString *userAgent = @"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us) AppleWebKit/534.1+ (KHTML, like Gecko) Version/5.0 Safari/533.16";	
	[request setValue:userAgent forHTTPHeaderField:@"User-Agent"];
	
	return request;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[webData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[webData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", [error localizedDescription]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Received %d bytes of data",[webData length]);	
	
	if ([webData length] > 0) {
		NSError *error;
		NSXMLDocument *document = [[NSXMLDocument alloc] initWithData:webData options:NSXMLDocumentTidyHTML error:&error];
		NSArray *nodes = [[document rootElement] nodesForXPath:@"//div[@class='preview']/a/img" error:&error];		
		for (NSXMLElement *img in nodes) {
			Wallpaper *wallpaper = [Wallpaper wallpaperWithThumbnailURL:[NSURL URLWithString:[[img attributeForName:@"src"] stringValue]]];
			[wallpaper retain];
			[wallpapers addObject:wallpaper];
		}
		
		[delegate receiveWallpapers:wallpapers];		
	} 
}

@end
