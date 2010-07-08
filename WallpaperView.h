#import <Cocoa/Cocoa.h>
#import "Wallpaper.h"

@interface WallpaperView : NSView {
	NSImage *image;
}

- (void)setupImage;

- (void)setup:(Wallpaper *)wallpaper;

- (Boolean)imageConfigured;

- (NSRect) viewRect ;

- (NSRect) imageRect ;

@end
