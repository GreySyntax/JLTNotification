//
//  JLTNotification.h
//  Notifs
//
//  Created by Joshua Lee Tucker on 03/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JLTNotificationDelegate
@required
- (void)gotDeviceToken:(NSData *)token;
@end

@interface JLTNotification : NSObject {
	// Used to send data back to user of instance
	id		delegate;
	
	int		badgeNumber;
	NSData	*deviceToken;
	BOOL	remoteRegistered;
}

@property (nonatomic, assign) id delegate;

#pragma mark Configuration and accessor methods

// Configuration and accessor methods
- (void)setBadgeNumber:(int)num;
- (void)clearBadge;
- (int)badgeNumber;
- (NSData *)deviceToken;
- (BOOL)remoteRegistered;

#pragma mark Notification Methods

// Notification Methods
- (UILocalNotification *)localNotificationWithMessage:(NSString *)message andAction:(NSString *)action;
- (void)registerForRemoteNotifications;
@end
