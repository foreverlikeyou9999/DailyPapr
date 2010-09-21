#import <Cocoa/Cocoa.h>
#import "Wallpaper.h"
#import "DPConnection.h"
#import "InterfaceLiftClient.h"

@interface WallpaperRepository : NSObject <ClientDelegate> {
	NSMutableArray *wallpapers;
	NSUInteger wallpaperCalls;
	InterfaceLiftClient* interfaceLift;
}

- (Wallpaper *)next;
- (BOOL)hasReceivedWallpapers;
- (BOOL)hasWallpapers;

@end