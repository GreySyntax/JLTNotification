//
//  JLTNotification.h
//  Notifs
//
//  Created by Joshua Lee Tucker on 03/09/2010.
//  Copyright 2010 Stunnify. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JLTNotification : NSObject {
	int		badgeNumber;
}

// Configuration and accessor methods
- (void)setBadgeNumber:(int)num;
- (void)clearBadge;
- (int)badgeNumber;

@end
