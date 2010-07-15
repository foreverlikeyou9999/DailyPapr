#import "WallpaperRepository.h"


@implementation WallpaperRepository

-(id)initWithWebService:(WallpaperWebService *)aWebService
{
	if([super init]) {
		webService = aWebService;
		[webService doRequest];
		wallpaperCalls = 0;
	}
	
	return self;
}

-(Wallpaper *)next
{
	if (wallpapers != nil) {
		Wallpaper *w = [wallpapers objectAtIndex:0];
		return w;
	} else {
		NSLog(@"Wallpapars Array not initialized yet.");
		return [Wallpaper wallpaperDefault];
	}	
}

-(void)receiveWallpapers:(NSArray *)aWallpapersArray
{
	wallpapers = aWallpapersArray;
}

@end