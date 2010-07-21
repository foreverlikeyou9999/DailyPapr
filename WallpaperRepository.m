#import "WallpaperRepository.h"


@implementation WallpaperRepository

-(id)initWithWebService:(WallpaperWebService *)aWebService
{
	if([super init]) {
		webService = aWebService;
		webService.delegate = self;
		[webService doRequest];
		wallpaperCalls = 0;
	}
	
	return self;
}

-(Wallpaper *)next
{
	if (wallpapers != nil) {
		NSUInteger totalWallpapers = [wallpapers count];
		if(totalWallpapers > wallpaperCalls) {
			Wallpaper *w = [[wallpapers objectAtIndex:wallpaperCalls] retain];
			wallpaperCalls++;
			return w;
		} else {
			NSLog(@"No more wallpapers to display.");
			return [wallpapers objectAtIndex:([wallpapers count] -1)];
		}
	} else {
		NSLog(@"Wallpapers not received yet.");
		return [Wallpaper wallpaperDefault];
	}	
}

-(void)receiveWallpapers:(NSArray *)aWallpapersArray
{
	wallpapers = [[NSArray alloc] initWithArray:aWallpapersArray];
	[wallpapers retain];
	NSLog(@"%u wallpapers reveived.", [wallpapers count]);
}

-(void)dealloc
{
	[wallpapers release];
	[webService release];
	
	[super dealloc];
}

@end