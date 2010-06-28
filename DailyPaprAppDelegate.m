#import "DailyPaprAppDelegate.h"

@implementation DailyPaprAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

-(void)awakeFromNib {
	[self displayStatusBarMenu];
}

-(void)displayStatusBarMenu {
	statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:80.0];
	[statusItem retain];
	[statusItem setTitle: @"DailyPapr"];
	[statusItem setMenu:statusMenu];
	[statusItem setHighlightMode:YES];
}

@end
