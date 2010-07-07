#import <Cocoa/Cocoa.h>
#import "Wallpaper.h"

@interface WallpaperRepository : NSObject {
	NSArray *nodes;
}

-(WallpaperRepository *)initWithXML:(NSXMLDocument *)xmlDocument;
-(Wallpaper *)next;

@end