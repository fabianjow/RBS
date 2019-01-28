//
//  Booking.m
//  RBS
//
//  Created by Fabian Jow on 27/1/19.
//  Copyright © 2019 fabian jow. All rights reserved.
//

#import "Booking.h"


@interface Booking (){
    
}

@end

@implementation Booking

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // create the array of data
    NSMutableArray* rooms = [[NSMutableArray alloc] init];
    NSMutableArray* roomsLvl = [[NSMutableArray alloc] init];
    
    // add some sample data
    [rooms addObject:@"Bloomberg PC"];
    [rooms addObject:@"Discussion Room"];
    [rooms addObject:@"Recording Pod"];
    [roomsLvl addObject:@"Level 2"];
    [roomsLvl addObject:@"Level 3"];
    [roomsLvl addObject:@"Level 4"];
    [roomsLvl addObject:@"Level 5"];
    
    // bind yourTextField to DownPicker
    self.roomType = [[DownPicker alloc] initWithTextField:self.roomType withData:rooms];
    self.roomLvl = [[DownPicker alloc] initWithTextField:self.roomLvl withData:roomsLvl];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
