#import "DailyPaprMenu.h"


@implementation DailyPaprMenu


-(void)awakeFromNib
{	
	NSMenuItem *menuItem = [self itemAtIndex:0];
	[menuItem setView: view];
	[menuItem setTarget:self];
}

-(void)setUpWallpaper:(Wallpaper *)wallpaper
{
	[view setUpWallpaper:wallpaper];
	[view display];
}

@end
