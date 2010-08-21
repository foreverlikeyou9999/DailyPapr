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
	menu.controllerRef = self;
	
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


-(void)mouseDownAction:(Wallpaper *)clickedWallpaper
{
	NSDate *date = [NSDate date];
	unsigned long actualTime = [date timeIntervalSinceReferenceDate];	
	id path = [@"/tmp/" stringByAppendingFormat: @"%qu.jpg", actualTime];	
	NSLog(@"Saving wallpaper to %@", path);
	
	OriginalDownloader *downloader = [[OriginalDownloader alloc] init];
	downloader.delegate = self;
	[downloader download:clickedWallpaper.original to:path];
}

-(void)downloadDidFinish:(NSString *)filePath
{	
	NSURL *fileURL = [NSURL fileURLWithPath:filePath];	
	NSError *error;
	NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], NSWorkspaceDesktopImageAllowClippingKey, [NSNumber numberWithInteger:NSImageScaleProportionallyUpOrDown], NSWorkspaceDesktopImageScalingKey, nil];
	BOOL result = [[NSWorkspace sharedWorkspace] setDesktopImageURL:fileURL forScreen:[[NSScreen screens] lastObject] options:options error:&error];
	if (!result) {
		NSLog(@"Error: %@", [error localizedDescription]);
	}	
}


-(void)dealloc
{
	[webService release];
	[repository release];
	[menu release];
	
	[super dealloc];
}

@end
