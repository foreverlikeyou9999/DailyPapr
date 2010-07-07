#import <SenTestingKit/SenTestingKit.h>
#import "WallpaperRepository.h"
#import "Wallpaper.h"

@interface WallpaperRepositoryTest : SenTestCase 
{		
	NSFileManager *fileManager;
	NSError *error;	
	WallpaperRepository *repository;
}
@end

@implementation WallpaperRepositoryTest

-(void)setUp
{
	fileManager = [[NSFileManager alloc] init];
	NSData *data = [fileManager contentsAtPath:@"InterfaceLIFT.html"];
	NSXMLDocument *document = [[NSXMLDocument alloc] initWithData:data options:NSXMLDocumentTidyHTML error:&error];
	
	repository = [[WallpaperRepository alloc] initWithXML:document];
}

-(void)tearDown
{
	[fileManager release];
	[repository release];
}

-(void)test_Should_Get_First_Wallpaper_When_Call_Next_First_Time
{
	Wallpaper *expected = [[Wallpaper alloc] init];
	expected.thumbnailSizePath = @"http://interfacelift.com/wallpaper_beta/previews/02288_futbolito.jpg";
	
	Wallpaper *received = [repository next];
	
	STAssertEqualObjects(expected, received, @"We expect %@, but it was %@", expected, received);
}

@end
