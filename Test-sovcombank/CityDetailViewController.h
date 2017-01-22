//
//  CityDetailViewController.h
//  Test-sovcombank
//
//  Created by Ruslan on 20/01/2017.
//  Copyright © 2017 Ruslan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *regionLabel;
@property (weak, nonatomic) IBOutlet UILabel *foundationYearLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coatOfArmsView;

@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) NSString *region;
@property (weak, nonatomic) NSString *foundationYear;
@property (strong, nonatomic) UIImage *image;

@end
