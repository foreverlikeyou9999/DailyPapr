#import <Cocoa/Cocoa.h>
#import "Wallpaper.h"
#import "WallpaperView.h"

@protocol WallpaperViewDelegate
-(void)mouseDownAction:(Wallpaper *)clickedWallpaper;
@end

@interface WallpaperView : NSView {
	NSImage *image;
	Wallpaper *wallpaper;
	id <WallpaperViewDelegate> delegate;
}

@property (retain, nonatomic) id <WallpaperViewDelegate> delegate;

-(void)setUp;
-(void)setUpWallpaper:(Wallpaper *)aWallpaper;
-(NSRect)viewRect;
-(NSRect)imageRect;

@end
