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
- (void)gotDeviceToken:(id)token;
@end


@interface JLTNotification : NSObject {
	id		delegate;
	
	int		badgeNumber;
	id		devTokenBytes;
	BOOL	remoteRegistered;
}

@property (nonatomic, assign) id delegate;

// Configuration and accessor methods
- (void)setBadgeNumber:(int)num;
- (void)clearBadge;
- (int)badgeNumber;
- (id)devTokenBytes;
- (BOOL)remoteRegistered;

- (UILocalNotification *)localNotificationWithMessage:(NSString *)message andAction:(NSString *)action;
- (void)registerForRemoteNotifications;
@end
