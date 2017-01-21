//
//  AddNewCityViewController.h
//  Test-sovcombank
//
//  Created by Ruslan on 20/01/2017.
//  Copyright © 2017 Ruslan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVPlaceSearchTextField.h"

@protocol AddNewCityDelegate <NSObject>
-(void)didDismissAddNewCityViewController:(UIViewController *)vc;
@end

@interface AddNewCityViewController : UIViewController
@property (weak, nonatomic) IBOutlet MVPlaceSearchTextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *regionField;
@property (weak, nonatomic) IBOutlet UITextField *foundationYear;
@property (weak, nonatomic) IBOutlet UIButton *addPhotoButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@property (nonatomic, weak) id <AddNewCityDelegate> delegate;

@end
