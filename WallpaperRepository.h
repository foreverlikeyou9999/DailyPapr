#import <Cocoa/Cocoa.h>


@interface WallpaperRepository : NSObject {		
	NSMutableData *responseData;
	NSURL *baseURL;	
}

-(void)wallpaper;

@end
