#import "Wallpaper.h"


@implementation Wallpaper

@synthesize thumbnail;


+(Wallpaper *)wallpaperDefault
{
	NSString *path = [[NSBundle mainBundle] pathForResource:@"wallpaper" ofType:@"jpg"]; 
	return [self wallpaperWithThumbnailURL:[NSURL fileURLWithPath:path]];
}

-(Wallpaper *)initWithThumbnailURL:(NSURL *)aThumbnail
{
	if([super init]) {		
		thumbnail = aThumbnail;		
	}
	
	return self;
}

+(Wallpaper *)wallpaperWithThumbnailURL:(NSURL *)aThumbnail
{
	return [[Wallpaper alloc] initWithThumbnailURL:aThumbnail];
}

- (BOOL)isEqual:(id)other 
{
    if (other == self) {
        return YES;
	}
    if (!other || ![other isKindOfClass:[self class]]) {
        return NO;
	}
    return [self isEqualToWallpaper:other];
}

- (BOOL)isEqualToWallpaper:(Wallpaper *)wallpaper 
{
    if (self == wallpaper){
        return YES;
	}	
    if (![(id)[self thumbnail] isEqual:[wallpaper thumbnail]]) {
        return NO;
	}
    
    return YES;
}

-(NSString *)description
{
	return @"Wallpaper instance";
}

@end
