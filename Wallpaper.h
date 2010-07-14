#import <Cocoa/Cocoa.h>

@interface Wallpaper : NSObject {
	NSURL *thumbnail;
}

@property (readwrite, assign) NSURL *thumbnail;

-(BOOL)isEqual:(id)object;
-(BOOL)isEqualToWallpaper:(Wallpaper *)wallpaper;
-(NSString *)description;

-(Wallpaper *) initWithThumbnailURL:(NSURL *)thumbnail;
+(Wallpaper *)wallpaperWithThumbnailURL:(NSURL *)thumbnail;

@end
