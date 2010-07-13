#import <Cocoa/Cocoa.h>
#import "WallpaperView.h"
#import	"WallpaperRepository.h"
#import "DailyPaprMenu.h"

@interface DailyPaprAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	IBOutlet DailyPaprMenu *statusMenu;
	NSStatusItem *statusItem;
	WallpaperRepository *repository;
	NSMutableData *requestData;
	NSURLConnection *connection;
}

@property (assign) IBOutlet NSWindow *window;

-(void)displayStatusBarMenu;

@end
