#import <Cocoa/Cocoa.h>
#import "WallpaperView.h"
#import "Wallpaper.h"

@interface DailyPaprMenu : NSMenu {
	IBOutlet WallpaperView *view;
	id <WallpaperViewDelegate> controllerRef;
}

@property (retain, nonatomic) id <WallpaperViewDelegate> controllerRef;

-(void)setUpWallpaper:(Wallpaper *)wallpaper;
-(IBAction)wallpaperClick: (id)sender;

@end