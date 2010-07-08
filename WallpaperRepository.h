#import <Cocoa/Cocoa.h>
#import "Wallpaper.h"

@interface WallpaperRepository : NSObject {
	NSArray *nodes;
}

-(id)initWithXML:(NSXMLDocument *)xmlDocument;
-(Wallpaper *)next;

@end