#import <Cocoa/Cocoa.h>
#import "Wallpaper.h"

@protocol WallpaperWebServiceDelegate
-(void)receiveWallpapers:(NSArray *)wallpapers;
@end

@interface WallpaperWebService : NSObject {
	NSMutableURLRequest *request;
	NSMutableData *webData;
	NSMutableArray *wallpapers;
	id <WallpaperWebServiceDelegate> delegate;
}

@property (retain, nonatomic) id <WallpaperWebServiceDelegate> delegate;

-(void)doRequest;
-(NSMutableURLRequest *)getRequest;

@end
