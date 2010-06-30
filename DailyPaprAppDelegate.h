#import <Cocoa/Cocoa.h>
#import "WallpaperView.h"

@interface DailyPaprAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	IBOutlet NSMenu *statusMenu;
	IBOutlet WallpaperView *wallpaperView;
	NSStatusItem *statusItem;
}

@property (assign) IBOutlet NSWindow *window;

-(void)displayStatusBarMenu;

-(void)configureStatusMenu;

@end
