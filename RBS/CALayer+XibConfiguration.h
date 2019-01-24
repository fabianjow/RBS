//
//  CALayer+XibConfiguration.h
//  RBS
//
//  Created by Fabian Jow on 21/1/19.
//  Copyright © 2019 fabian jow. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (XibConfiguration)

// This assigns a CGColor to borderColor.
@property(nonatomic, assign) UIColor* borderUIColor;

@end
