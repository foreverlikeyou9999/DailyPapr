#import <Cocoa/Cocoa.h>
#import "WallpaperView.h"
#import	"WallpaperRepository.h"
#import "DailyPaprMenu.h"

@interface DailyPaprAppDelegate : NSObject <NSApplicationDelegate> {
	IBOutlet DailyPaprMenu *statusMenu;
	NSStatusItem *statusItem;
}

-(void)displayStatusBarMenu;

@end
