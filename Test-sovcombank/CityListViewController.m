//
//  CityListViewController.m
//  Test-sovcombank
//
//  Created by Ruslan on 20/01/2017.
//  Copyright © 2017 Ruslan. All rights reserved.
//

#import "CityListViewController.h"
#import "StyleGuide.h"
#import "AddNewCityViewController.h"

@interface CityListViewController ()

@end

@implementation CityListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.addNewCityButton setBackgroundColor:[StyleGuide baseColor]];
    [self.addNewCityButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
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

- (IBAction)openNewCityViewController:(id)sender
{
    AddNewCityViewController* ancvc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddNewCityViewController"];
    //ancvc.delegate = self;
    [self presentViewController:ancvc animated:YES completion:nil];
}

@end
