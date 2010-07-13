#import <Cocoa/Cocoa.h>
#import "WallpaperView.h"
#import "Wallpaper.h"

@interface DailyPaprMenu : NSMenu {
	IBOutlet WallpaperView *view;
}

-(void)setUpWallpaper:(Wallpaper *)wallpaper;

@end