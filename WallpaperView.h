#import <Cocoa/Cocoa.h>

@interface WallpaperView : NSView {
	NSImage *image;
}

- (void)setupImage;

- (Boolean)imageConfigured;

- (NSRect) viewRect ;

- (NSRect) imageRect ;

@end
