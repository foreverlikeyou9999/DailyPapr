#import <Cocoa/Cocoa.h>
#import "Wallpaper.h"

@interface WallpaperView : NSView {
	NSImage *image;
}

-(void)setUp;
-(void)setUpWallpaper:(Wallpaper *)wallpaper;
-(Boolean)wallpaperConfigured;
-(NSRect)viewRect;
-(NSRect)imageRect;

@end
