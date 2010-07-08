#import "WallpaperRepository.h"


@implementation WallpaperRepository

-(id)initWithXML:(NSXMLDocument *)xmlDocument
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
	wallpaper.thumbnail = [NSURL URLWithString:[[img attributeForName:@"src"] stringValue]];
	
	return wallpaper;
}

@end