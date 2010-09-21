#import "DailyPaprMenu.h"


@implementation DailyPaprMenu

@synthesize delegate;

-(void)awakeFromNib
{	
	view.delegate = self;	
	menuItem = [self itemAtIndex:0];
	[menuItem setView: view];
}

-(void)setUpWallpaper:(Wallpaper *)wallpaper
{
	[wallpaper retain];
	
	[view setUpWallpaper:wallpaper];
	[view display];	
	
	[wallpaper release];
} 

-(void)mouseDownAction:(Wallpaper *)clickedWallpaper
{
	NSLog(@"clicou");
	[delegate mouseDownAction:clickedWallpaper];
}

-(void)dealloc
{
	[view release];
	[menuItem release];
	
	[super dealloc];
}

@end
