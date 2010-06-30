#import "WallpaperRepository.h"


@implementation WallpaperRepository

- (void)dealloc {
	[responseData release];
	[baseURL release];
	[super dealloc];
}

-(void)wallpaper {		
	responseData = [[NSMutableData data] retain];
	baseURL = [[NSURL URLWithString:@"http://store.apple.com"] retain];
	
    NSURLRequest *request =	[NSURLRequest requestWithURL:baseURL];
    [[[NSURLConnection alloc] initWithRequest:request delegate:self] autorelease];
}

- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse {
    [baseURL autorelease];
    baseURL = [[request URL] retain];
    return request;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [[NSAlert alertWithError:error] runModal];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSError *error;
	NSXMLDocument *document =
	[[NSXMLDocument alloc] initWithData:responseData options:NSXMLDocumentTidyHTML error:&error];
	
	NSXMLElement *rootNode = [document rootElement];
	
	NSLog([rootNode name], @"");
	
	for(NSXMLNode *child in [rootNode nodesForXPath:@" XPath query here! " error:&error]) {
			
		//TODO: learn xpath :P
		
	}
}


@end
