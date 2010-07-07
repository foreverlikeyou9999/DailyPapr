#import <Cocoa/Cocoa.h>

@interface Wallpaper : NSObject {
	NSString *name;
	NSString *description;
	NSString *thumbnailSizePath;
	NSString *originalSizePath;
	NSDate *date;	
}

@property (readwrite, assign) NSString *name; 
@property (readwrite, assign) NSString *description; 
@property (readwrite, assign) NSString *thumbnailSizePath;
@property (readwrite, assign) NSString *originalSizePath;
@property (readwrite, assign) NSDate *date;

-(BOOL)isEqual:(id)object;
-(BOOL)isEqualToWallpaper:(Wallpaper *)wallpaper;
-(NSString *)description;

@end
