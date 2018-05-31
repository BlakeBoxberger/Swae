#import <Cephei/HBPreferences.h>

NSString *font;

@interface _UIStatusBarStringView : UIView
@property (copy) UIFont *font;
@end

%hook _UIStatusBarStringView

- (void)setFont:(UIFont *)arg1 {
  UIFont *ui_font = [UIFont fontWithName:font size:arg1.pointSize];
  if(ui_font != nil) {
    %orig(ui_font);
  }
  else {
    %orig(arg1);
  }
}

%end

%ctor {
    // Fix rejailbreak bug
    if (![NSBundle.mainBundle.bundleURL.lastPathComponent.pathExtension isEqualToString:@"app"]) {
      return;
    }
    HBPreferences *settings = [[HBPreferences alloc] initWithIdentifier:@"com.neinzedd9.swaesettings"];
    [settings registerDefaults:@{
  																@"tweakEnabled": @YES,
  																@"font": @"Chalkduster",
  															 }];
    BOOL tweakEnabled = [settings boolForKey:@"tweakEnabled"];
    font = (NSString *)[settings objectForKey:@"font"];

    if(tweakEnabled) {
      %init;
    }
}
