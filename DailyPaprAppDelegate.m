#import "DailyPaprAppDelegate.h"
#import "WallpaperView.h"
#import "WallpaperRepository.h"

@implementation DailyPaprAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {		
}

-(void)awakeFromNib {	
	
	[self displayStatusBarMenu];
}

-(void)displayStatusBarMenu 
{
	statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:80.0];
	[statusItem retain];
	[statusItem setTitle: @"DailyPapr"];
	[statusItem setMenu:statusMenu];
	[statusItem setHighlightMode:YES];
}


@end
