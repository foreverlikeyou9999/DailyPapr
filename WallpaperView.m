#import "WallpaperView.h"

@implementation WallpaperView


- (void) awakeFromNib {
	[self setupImage];
}

- (void) setupImage {
	//if(! [self imageConfigured]) {
		image = [[NSImage imageNamed:@"wallpaper.jpg"] retain];
	//}
}

- (Boolean) imageConfigured {
	return image != nil;
}

- (void) drawRect:(NSRect)rect {	
	[image drawInRect:[self viewRect] fromRect:[self imageRect]	operation:NSCompositeCopy  fraction:1.0];
}

- (NSRect) viewRect {
  return NSMakeRect([self bounds].origin.x + 5, [self bounds].origin.y +10, [self frame].size.width -10, [self frame].size.height -10);
}

- (NSRect) imageRect {
	return NSMakeRect(0,0,[image size].width,[image size].height);
}

- (void) dealloc {
	[image release];
	[super dealloc];
}


@end
