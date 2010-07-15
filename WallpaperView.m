#import "WallpaperView.h"

@implementation WallpaperView

- (void) awakeFromNib 
{
	[self setUp];
}

- (void) setUp 
{
	[self setUpWallpaper:[Wallpaper wallpaperDefault]];
}

-(void) setUpWallpaper:(Wallpaper *)wallpaper
{
	NSURL *imageURL = wallpaper.thumbnail;
	NSData *imageData = [imageURL resourceDataUsingCache:NO];
	image = [[[NSImage alloc] initWithData:imageData] retain];
}

- (Boolean) wallpaperConfigured 
{
	return image != nil;
}

- (void) drawRect:(NSRect)rect 
{	
	[image drawInRect:[self viewRect] fromRect:[self imageRect]	operation:NSCompositeCopy  fraction:1.0];
}

- (NSRect) viewRect 
{
  return NSMakeRect([self bounds].origin.x + 5, [self bounds].origin.y +10, [self frame].size.width -10, [self frame].size.height -10);
}

- (NSRect) imageRect 
{
	return NSMakeRect(0,0,[image size].width,[image size].height);
}

- (void) dealloc 
{
	[image release];
	[super dealloc];
}

@end
