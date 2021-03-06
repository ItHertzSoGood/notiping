#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NPISubPageController.h"
#import "spawn.h"

@implementation NPISubPageController

- (NSMutableArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Alert" target:self];
    }
    return _specifiers;
}

- (id)readPreferenceValue:(PSSpecifier *)specifier {
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/dev.ametrine.notiping.plist"];
    id object = [dict objectForKey:[specifier propertyForKey:@"key"]];
    if (!object) {
        object = [specifier propertyForKey:@"default"];
    }
    return object;
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/dev.ametrine.notiping.plist"];
    if (!dict) {
        dict = [[NSMutableDictionary alloc] init];
    }
    [dict setObject:value forKey:[specifier propertyForKey:@"key"]];
    [dict writeToFile:@"/var/mobile/Library/Preferences/dev.ametrine.notiping.plist" atomically:YES];
}

- (void)openGitHub
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/ItHertzSoGood/notiping"] options:@{} completionHandler:nil];
}

- (void)openTwitter
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/quiprr"] options:@{} completionHandler:nil];
}

- (void)openWebsite
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://ametrine.dev/"] options:@{} completionHandler:nil];
}

- (void)openReddit
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://reddit.com/u/quiprr"] options:@{} completionHandler:nil];
}
@end