#import <Cocoa/Cocoa.h>
#import "Wallpaper.h"
#import "WallpaperWebService.h"

@interface WallpaperRepository : NSObject <WallpaperWebServiceDelegate> {
	NSArray *wallpapers;
	WallpaperWebService *webService;
	NSUInteger *wallpaperCalls;
}

-(id)initWithWebService:(WallpaperWebService *)aWebService;
-(Wallpaper *)next;

@end