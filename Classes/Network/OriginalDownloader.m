//
//  OriginalDownloader.m
//  DailyPapr
//
//  Created by Diogo on 8/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OriginalDownloader.h"


@implementation OriginalDownloader

@synthesize delegate;

-(void)download:(NSURL *)originalURl to:(NSString *)aFilePath
{
	
	filePath = [aFilePath retain];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:originalURl
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:60.0];
	
	NSString *userAgent = @"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us) AppleWebKit/534.1+ (KHTML, like Gecko) Version/5.0 Safari/533.16";	
	[request setValue:userAgent forHTTPHeaderField:@"User-Agent"];
	
	NSURLDownload *download = [[NSURLDownload alloc] initWithRequest:request delegate:self];
	[download setDestination:filePath allowOverwrite:TRUE];	
}

- (NSURLRequest *)download:(NSURLDownload *)download willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse
{
	
	NSMutableURLRequest *mutableRequest = [request mutableCopyWithZone:nil];
	
	NSString *userAgent = @"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us) AppleWebKit/534.1+ (KHTML, like Gecko) Version/5.0 Safari/533.16";	
	[mutableRequest setValue:userAgent forHTTPHeaderField:@"User-Agent"];
	
	return mutableRequest;
	
}

- (void)downloadDidFinish:(NSURLDownload *)download
{

	NSLog(@"%@ download did finish.", filePath);
	[delegate downloadDidFinish:filePath];
	
}

-(void)dealloc
{
	[filePath release];
	
	[super dealloc];
}


@end
