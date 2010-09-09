#import <Cocoa/Cocoa.h>
#import "Wallpaper.h"
#import "DPConnection.h"
#import "InterfaceLiftClient.h"

@interface WallpaperRepository : NSObject <InterfaceLiftClientDelegate> {
	NSArray *wallpapers;
	NSUInteger wallpaperCalls;
	InterfaceLiftClient* interfaceLift;
}

-(Wallpaper *)next;

@end