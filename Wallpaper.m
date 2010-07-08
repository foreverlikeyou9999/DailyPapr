#import "Wallpaper.h"


@implementation Wallpaper

@synthesize thumbnail;

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToWallpaper:other];
}

- (BOOL)isEqualToWallpaper:(Wallpaper *)wallpaper {
    if (self == wallpaper) 
	{
        return YES;
	}
	
    if (![(id)[self thumbnail] isEqual:[wallpaper thumbnail]]) 
	{
        return NO;
	}
    
    return YES;
}

-(NSString *)description
{
	return @"Wallpaper instance";
}

@end
