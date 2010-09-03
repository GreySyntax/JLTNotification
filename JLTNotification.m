//
//  JLTNotification.m
//  Notifs
//
//  Created by Joshua Lee Tucker on 03/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import "JLTNotification.h"


@implementation JLTNotification


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

@end
