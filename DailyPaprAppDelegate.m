#import "DailyPaprAppDelegate.h"
#import "WallpaperView.h"
#import "WallpaperRepository.h"

@implementation DailyPaprAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

-(void)awakeFromNib {	
	[self configureStatusMenu];
	[self displayStatusBarMenu];
	
	WallpaperRepository *repository = [[WallpaperRepository alloc] init];	
	[repository wallpaper];	
}

-(void)displayStatusBarMenu {
	statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:80.0];
	[statusItem retain];
	[statusItem setTitle: @"DailyPapr"];
	[statusItem setMenu:statusMenu];
	[statusItem setHighlightMode:YES];
}

-(void)configureStatusMenu {	
	[wallpaperView setupImage];
	
	NSMenuItem *menuItem = [statusMenu itemAtIndex:0];
	[menuItem setView: wallpaperView];
	[menuItem setTarget:self];
}

@end
