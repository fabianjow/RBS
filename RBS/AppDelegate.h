//
//  AppDelegate.h
//  RBS
//
//  Created by Fabian Jow on 9/1/19.
//  Copyright © 2019 fabian jow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

