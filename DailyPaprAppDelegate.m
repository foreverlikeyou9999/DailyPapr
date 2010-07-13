#import "DailyPaprAppDelegate.h"
#import "WallpaperView.h"
#import "WallpaperRepository.h"

@implementation DailyPaprAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {		
}

-(void)awakeFromNib {	
	NSString *userAgent = @"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us) AppleWebKit/534.1+ (KHTML, like Gecko) Version/5.0 Safari/533.16";	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://interfacelift.com/wallpaper_beta/downloads/date/widescreen/1440x900/"]											 
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
										               timeoutInterval:60.0];	
	[request setValue:userAgent forHTTPHeaderField:@"User-Agent"];
	
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];	
	if(connection)	{
		requestData = [[NSMutableData data] retain]; 
	} else {
		NSLog(@"Connection failed!");
	}

	[self displayStatusBarMenu];
}

-(void)displayStatusBarMenu 
{
	statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:80.0];
	[statusItem retain];
	[statusItem setTitle: @"DailyPapr"];
	[statusItem setMenu:statusMenu];
	[statusItem setHighlightMode:YES];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [requestData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [requestData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [requestData release];
    NSLog(@"Connection failed! Error - %@",[error localizedDescription]);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Succeeded! Received %d bytes of data",[requestData length]);	
	
	if ([requestData length] > 0) {
		NSError *error;
		NSXMLDocument *document = [[NSXMLDocument alloc] initWithData:requestData options:NSXMLDocumentTidyHTML error:&error];	
		repository = [[WallpaperRepository alloc] initWithXML:document];
		[statusMenu setUpWallpaper:[repository next]];
	}
	
    [requestData release];
}

@end
