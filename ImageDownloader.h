//
//  ImageDownloader.h
//  DailyPapr
//
//  Created by Diogo on 9/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DPConnection.h"

@protocol ImageDownloaderDelegate
- (void)imageDownloaderDidSucceed:(NSString *)filePath;
- (void)imageDownloaderDidFail:(id)sender error:(NSString*)error;
@end


@interface ImageDownloader : DPConnection {
		
}

-(void)download:(NSURL *)URL to:(NSString *)filePath;

@end
