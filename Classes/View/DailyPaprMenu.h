#import <Cocoa/Cocoa.h>
#import "WallpaperView.h"
#import "Wallpaper.h"

@interface DailyPaprMenu : NSMenu <WallpaperViewDelegate> {
	IBOutlet WallpaperView *view;
	NSMenuItem *menuItem;
	id <WallpaperViewDelegate> delegate;
}

@property (retain, nonatomic) id <WallpaperViewDelegate> delegate;

-(void)setUpWallpaper:(Wallpaper *)wallpaper;

@end