//
//  AddNewCityViewController.m
//  Test-sovcombank
//
//  Created by Ruslan on 20/01/2017.
//  Copyright © 2017 Ruslan. All rights reserved.
//

#import "AddNewCityViewController.h"
#import "MVPlaceSearchTextField.h"

@interface AddNewCityViewController ()<PlaceSearchTextFieldDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet MVPlaceSearchTextField *cityNameAutocompleteField;

@end

@implementation AddNewCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityNameAutocompleteField.placeSearchDelegate = self;
    // Do any additional setup after loading the view.
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

#pragma mark - Place search Textfield Delegates

-(void)placeSearch:(MVPlaceSearchTextField*)textField ResponseForSelectedPlace:(GMSPlace*)responseDict{
    [self.view endEditing:YES];
    NSLog(@"SELECTED ADDRESS :%@",responseDict);
}
-(void)placeSearchWillShowResult:(MVPlaceSearchTextField*)textField{
    
}
-(void)placeSearchWillHideResult:(MVPlaceSearchTextField*)textField{
    
}
-(void)placeSearch:(MVPlaceSearchTextField*)textField ResultCell:(UITableViewCell*)cell withPlaceObject:(PlaceObject*)placeObject atIndex:(NSInteger)index{
    if(index%2==0){
        cell.contentView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    }else{
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
}

@end
