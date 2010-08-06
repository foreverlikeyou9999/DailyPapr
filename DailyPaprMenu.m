#import "DailyPaprMenu.h"


@implementation DailyPaprMenu

@synthesize controllerRef;

-(void)awakeFromNib
{	
	view.delegate = controllerRef;
	
	NSMenuItem *menuItem = [self itemAtIndex:0];
	[menuItem setView: view];
	[menuItem setAction:@selector(wallpaperClick:)];
	[menuItem setTarget:self];
}

-(void)setUpWallpaper:(Wallpaper *)wallpaper
{
	[wallpaper retain];
	[view setUpWallpaper:wallpaper];
	[view display];
	
	[wallpaper release];
}
	 
-(IBAction)wallpaperClick:(id)sender
{
	NSLog(@"Clicou no wallpaper!");
}

-(void)dealloc
{
	[view release];
	
	[super dealloc];
}

@end
