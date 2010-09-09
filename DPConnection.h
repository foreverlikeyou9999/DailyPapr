//
//  DPConnection.h
//  DailyPapr
//
//  Created by Diogo on 9/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DPConnection : NSObject {	
	id					delegate;
	NSString*			requestURL;
	NSURLConnection*	connection;
	NSMutableData*		buffer;	
	int					statusCode;
}

@property (nonatomic, readonly) NSMutableData* buffer;
@property (nonatomic, assign) int statusCode;
@property (nonatomic, copy) NSString* requestURL;

- (id)initWithDelegate:(id)delegate;
- (void)get:(NSString*)URL;
- (void)cancel;
- (void)addAgentInfo:(NSMutableURLRequest *)request;

- (void)DPConnectionDidFailWithError:(NSError*)error;
- (void)DPConnectionDidFinishLoading:(NSString*)content;

@end