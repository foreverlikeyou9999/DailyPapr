#import <Cocoa/Cocoa.h>

@interface Wallpaper : NSObject {
	NSURL *thumbnail;
	NSURL *original;
}

@property (readwrite, assign) NSURL *thumbnail;
@property (readwrite, retain) NSURL *original;

-(BOOL)isEqual:(id)object;
-(BOOL)isEqualToWallpaper:(Wallpaper *)wallpaper;
-(NSString *)description;

-(Wallpaper *)initWithThumbnailURL:(NSURL *)aThumbnail;
+(Wallpaper *)wallpaperWithThumbnailURL:(NSURL *)aThumbnail;
+(Wallpaper *)wallpaperDefault;

@end
