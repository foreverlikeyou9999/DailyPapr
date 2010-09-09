#import "WallpaperRepository.h"


@implementation WallpaperRepository

-(id)init
{
	self = [super init];
	interfaceLift = [[InterfaceLiftClient alloc] initWithDelegate:self];
	[interfaceLift getWallpapers];		
	wallpaperCalls = 0;
		
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

- (void)interfaceLiftClientDidSucceed:(NSArray *)wallpapersArray
{
	wallpapers = [[NSArray alloc] initWithArray:wallpapersArray];
	[wallpapers retain];
	NSLog(@"%u wallpapers reveived.", [wallpapers count]);
}

- (void)interfaceLiftClientDidFail:(id)sender error:(NSString*)error
{
	
}

-(void)dealloc
{
	[wallpapers release];
	[interfaceLift release];
	
	[super dealloc];
}

@end