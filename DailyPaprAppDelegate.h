#import <Cocoa/Cocoa.h>
#import "WallpaperView.h"
#import	"WallpaperRepository.h"

@interface DailyPaprAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	IBOutlet NSMenu *statusMenu;
	IBOutlet WallpaperView *wallpaperView;
	NSStatusItem *statusItem;
	WallpaperRepository *repository;
	NSMutableData *requestData;
	NSURLConnection *connection;
}

@property (assign) IBOutlet NSWindow *window;

-(void)displayStatusBarMenu;

-(void)configureStatusMenu;

@end
