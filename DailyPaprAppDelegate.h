#import <Cocoa/Cocoa.h>

@interface DailyPaprAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	IBOutlet NSMenu *statusMenu;
	NSStatusItem *statusItem;
}

@property (assign) IBOutlet NSWindow *window;

-(void)displayStatusBarMenu;

@end
