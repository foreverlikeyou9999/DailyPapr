#import "WallpaperRepository.h"


@implementation WallpaperRepository

-(id)init
{
	self = [super init];
	
	interfaceLift = [[InterfaceLiftClient alloc] initWithDelegate:self];
	[interfaceLift getWallpapers];		
	
	wallpaperCalls = 0;
	
	wallpapers = [NSMutableArray arrayWithCapacity:10];
	[wallpapers retain];
		
	return self;
}

-(Wallpaper *)next
{
	if(! [self hasReceivedWallpapers]) {		
		NSLog(@"Wallpapers not received yet.");
		return [Wallpaper wallpaperDefault];
	}
	
	if([self hasWallpapers]) {
		wallpaperCalls++;
		return [[wallpapers objectAtIndex:wallpaperCalls] autorelease];
	} else {
		NSLog(@"No more wallpapers to display.");		
		return [wallpapers objectAtIndex:0];
	}
}

- (BOOL)hasReceivedWallpapers
{
	return [wallpapers count] > 0;
}

- (BOOL)hasWallpapers
{
	return [wallpapers count] > wallpaperCalls;
}

- (void)clientDidSucceed:(NSArray *)wallpapersArray
{
	[wallpapers addObjectsFromArray:wallpapersArray];
	NSLog(@"%u wallpapers reveived.", [wallpapers count]);
}

- (void)clientDidFail:(id)sender error:(NSString*)error
{
	
}

-(void)dealloc
{
	[wallpapers release];
	[interfaceLift release];
	
	[super dealloc];
}

@end