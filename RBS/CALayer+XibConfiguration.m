//
//  CALayer+XibConfiguration.m
//  RBS
//
//  Created by Fabian Jow on 21/1/19.
//  Copyright © 2019 fabian jow. All rights reserved.
//

#import "CALayer+XibConfiguration.h"


@implementation CALayer (XibConfiguration)

-(void)setBorderUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}

-(UIColor*)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
