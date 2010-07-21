#import "DailyPaperController.h"


@implementation DailyPaperController

-(IBAction)nextWallpaper:(id)sender
{
	NSLog(@"nextWallpaper ... ");
	Wallpaper *wallpaper = [repository next];
	
	NSLog(@"%@", [wallpaper.thumbnail description]);
	
	[menu setUpWallpaper:wallpaper];	
}

-(void)configureMenu
{
	NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:80.0];
	[statusItem retain];
	[statusItem setTitle: @"DailyPapr"];
	[statusItem setMenu:menu];
	[statusItem setHighlightMode:YES];
}

-(void)awakeFromNib
{
	webService = [[[WallpaperWebService alloc] init] retain];	
	repository = [[[WallpaperRepository alloc] initWithWebService:webService] retain];
	
	[self configureMenu];
}

-(void)dealloc
{
	[webService release];
	[repository release];
	[menu release];
	
	[super dealloc];
}

@end
