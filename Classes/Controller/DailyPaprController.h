#import <Cocoa/Cocoa.h>
#import "DailyPaprMenu.h"
#import "WallpaperRepository.h"
#import "OriginalDownloader.h"

@interface DailyPaperController : NSObject <WallpaperViewDelegate, OriginalDownloaderDelegate> {
	IBOutlet DailyPaprMenu *menu;
	WallpaperRepository *repository;
}

-(IBAction)nextWallpaper:(id)sender;
-(void)configureMenu;

@end
