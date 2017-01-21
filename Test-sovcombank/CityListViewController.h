//
//  CityListViewController.h
//  Test-sovcombank
//
//  Created by Ruslan on 20/01/2017.
//  Copyright © 2017 Ruslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewCityViewController.h"

@interface CityListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, AddNewCityDelegate>

@property (weak, nonatomic) IBOutlet UITableView *cityTable;
@property (weak, nonatomic) IBOutlet UIButton *addNewCityButton;
@property (weak, nonatomic) IBOutlet UILabel *listLabel;


@end
