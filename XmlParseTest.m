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
	NSArray *nodes = [rootNode nodesForXPath:@"//div[@class='preview']" error:&error];	
	NSNumber *expected = [NSNumber numberWithInt:10];
	NSNumber *nodesCount = [NSNumber numberWithUnsignedInteger:[nodes count]];
	STAssertEqualObjects(expected, nodesCount, @"Nodes count must be 10, but it was %u instead!", [nodesCount intValue]);
}

@end
