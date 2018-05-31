#include "SwaeRootListController.h"
#import <Cephei/HBRespringController.h>
#import <Cephei/HBPreferences.h>

@implementation SwaeRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

+ (NSString *)hb_shareText {
	return @"I'm using #Swae by @NeinZedd9 to change my iPhone X's status bar font!";
}

- (void)respring {
	[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil]; // Dismisses keyboard
	[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Swae"]];
}

@end
