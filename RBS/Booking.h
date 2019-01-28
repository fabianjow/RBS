//
//  Booking.h
//  RBS
//
//  Created by Fabian Jow on 27/1/19.
//  Copyright © 2019 fabian jow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownPicker.h"

@interface Booking : UIViewController
@property (strong, nonatomic) DownPicker *roomType;
@property (strong, nonatomic) DownPicker *roomLvl;

@end
