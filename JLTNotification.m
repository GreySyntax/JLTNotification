//
//  JLTNotification.m
//  Notifs
//
//  Created by Joshua Lee Tucker on 03/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "JLTNotification.h"


@implementation JLTNotification

@synthesize delegate;

#pragma mark Configuration and accessor methods

- (void)setBadgeNumber:(int)num {
	badgeNumber = num;
	[[UIApplication sharedApplication] setApplicationIconBadgeNumber:num];
}

- (void)clearBadge {
	[[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (int)badgeNumber {
	return badgeNumber;
}

- (id)devTokenBytes {
	return devTokenBytes;
}

- (BOOL)remoteRegistered {
	return remoteRegistered;
}

#pragma mark Notification Methods

- (UILocalNotification *)localNotificationWithMessage:(NSString *)message andAction:(NSString *)action {
	UILocalNotification *notif = [[UILocalNotification alloc] init];
	if (notif == nil) {
		return 0;
	}
	notif.alertBody = [NSString stringWithFormat:NSLocalizedString(@"%@", nil), message];
	notif.alertAction = [NSString stringWithFormat:NSLocalizedString(@"%@", nil), action];
	notif.soundName = UILocalNotificationDefaultSoundName;
	
	return notif;
}

- (void)registerForRemoteNotifications {
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
	devTokenBytes = [devToken bytes];
	remoteRegistered = YES;
	[self.delegate gotDeviceToken:devTokenBytes];
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    NSLog(@"JLTNotification: Unable to register for remote notifications: %@", err);
}

@end
