#import <SenTestingKit/SenTestingKit.h>

@interface XmlParseTest : SenTestCase
{
	NSFileManager *fileManager;
	NSXMLElement *rootNode;
	NSError *error;
}
@end


@implementation XmlParseTest

-(void)setUp
{
	fileManager = [[NSFileManager alloc] init];
	NSData *data = [fileManager contentsAtPath:@"InterfaceLIFT.html"];
	NSXMLDocument *document = [[NSXMLDocument alloc] initWithData:data options:NSXMLDocumentTidyHTML error:&error];
	rootNode = [document rootElement];	
}

-(void)tearDown
{
	[fileManager release];
}

-(void)testLoadXmlFromFile
{
	STAssertEqualObjects(@"html", [rootNode name], @"We expect 'html', but it was '%s'", [[rootNode name] UTF8String]);
}

-(void)testXPathQuery
{
	NSArray *nodes = [rootNode nodesForXPath:@"//div[@class='preview']/a/img" error:&error];	
	NSNumber *expected = [NSNumber numberWithInt:10];
	NSNumber *nodesCount = [NSNumber numberWithUnsignedInteger:[nodes count]];
	STAssertEqualObjects(expected, nodesCount, @"Nodes count must be 10, but it was %u instead!", [nodesCount intValue]);
}

-(void)testGetFirstWallpaperPath
{
	NSArray *nodes = [rootNode nodesForXPath:@"//div[@class='preview']/a/img" error:&error];
	NSXMLElement *img = [nodes objectAtIndex:0];	
	NSString *src = [[img attributeForName:@"src"] stringValue];
	
	STAssertEqualObjects(@"http://interfacelift.com/wallpaper_beta/previews/02288_futbolito.jpg", src, @"Expect img, but was '%s'", [src UTF8String]);
}

@end
