#import "WallpaperRepository.h"


@implementation WallpaperRepository

-(WallpaperRepository *)initWithXML:(NSXMLDocument *)xmlDocument
{
	[self init];
	
	NSError *error;
	nodes = [[xmlDocument rootElement] nodesForXPath:@"//div[@class='preview']/a/img" error:&error];	
	
	if(error) 
	{
		NSLog(@"Error: %@", error);
	}	
	
	return self;
}

-(Wallpaper *)next
{
	NSXMLElement *img = [nodes objectAtIndex:0];
	
	Wallpaper *wallpaper = [[Wallpaper alloc] init];
	wallpaper.thumbnailSizePath = [[img attributeForName:@"src"] stringValue];
	
	return nil;
}

@end