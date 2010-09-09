//
//  DPConnection.m
//  DailyPapr
//
//  Created by Diogo on 9/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DPConnection.h"

#define NETWORK_TIMEOUT 60.0

@implementation DPConnection

@synthesize buffer;
@synthesize statusCode;
@synthesize requestURL;

- (id)initWithDelegate:(id)aDelegate 
{
	self = [super init];
	delegate = aDelegate;
	statusCode = 0;

	return self;
}

- (void)get:(NSString*)aURL
{
	[connection release];
	[buffer release];
    statusCode = 0;

    self.requestURL = aURL;
    NSLog(@"%@", aURL);

  	buffer = [[NSMutableData data] retain];
	
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.requestURL]											 
														   cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
													   timeoutInterval: NETWORK_TIMEOUT];
		
	[self addAgentInfo:request];
	
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self]; 
}

- (void)addAgentInfo:(NSMutableURLRequest*)request
{
	NSString *userAgent = @"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us) AppleWebKit/534.1+ (KHTML, like Gecko) Version/5.0 Safari/533.16";	
	[request setValue:userAgent forHTTPHeaderField:@"User-Agent"];	
}

- (void)cancel
{
	if (connection) {
        [connection cancel];
        [connection autorelease];
        connection = nil;
    }
}

- (void)dealloc
{
    [requestURL release];
	[connection release];
	[buffer release];
	
	[super dealloc];
}

// ------ Connection Delegate ----------------

- (void)connectionDidFinishLoading:(NSURLConnection *)aConn
{
    NSString* s = [[[NSString alloc] initWithData:buffer encoding:NSUTF8StringEncoding] autorelease];
    
    [self DPConnectionDidFinishLoading:s];
	
    [connection autorelease];
    connection = nil;
    [buffer autorelease];
    buffer = nil;
}


- (void)connection:(NSURLConnection *)aConn didFailWithError:(NSError *)error
{
	[connection autorelease];
	connection = nil;
	[buffer autorelease];
	buffer = nil;
    
    NSString* msg = [NSString stringWithFormat:@"Error: %@", [error localizedDescription]];
    
    NSLog(@"Connection failed: %@", msg);
    
    [self DPConnectionDidFailWithError:error];
    
}

- (void)connection:(NSURLConnection *)aConnection didReceiveResponse:(NSURLResponse *)aResponse
{
    NSHTTPURLResponse *resp = (NSHTTPURLResponse*)aResponse;
    if (resp) {
        statusCode = resp.statusCode;
        NSLog(@"Response: %d", statusCode);
    }
	[buffer setLength:0];
}

- (void)connection:(NSURLConnection *)aConn didReceiveData:(NSData *)data
{
	[buffer appendData:data];
}

// ------ abstract methods ----------------

- (void)DPConnectionDidFailWithError:(NSError*)error
{	
}

- (void)DPConnectionDidFinishLoading:(NSString*)content
{	
}

@end
