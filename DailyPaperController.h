#import <Cocoa/Cocoa.h>
#import "DailyPaprMenu.h"
#import "WallpaperRepository.h"
#import "WallpaperWebService.h"

@interface DailyPaperController : NSObject <WallpaperViewDelegate> {
	IBOutlet DailyPaprMenu *menu;
	WallpaperRepository *repository;
	WallpaperWebService *webService;
}

-(IBAction)nextWallpaper:(id)sender;
-(void)configureMenu;

@end
