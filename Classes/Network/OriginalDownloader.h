//
//  OriginalDownloader.h
//  DailyPapr
//
//  Created by Diogo on 8/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol OriginalDownloaderDelegate
-(void)downloadDidFinish:(NSString *)filePath;
@end


@interface OriginalDownloader : NSObject {
	id <OriginalDownloaderDelegate> delegate;
	NSString *filePath;
}

@property (retain, nonatomic) id <OriginalDownloaderDelegate> delegate;

-(void)download:(NSURL *)originalURl to:(NSString *)aFilePath;

@end
