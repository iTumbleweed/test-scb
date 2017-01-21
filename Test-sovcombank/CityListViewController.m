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
#import "DataStore.h"

@interface CityListViewController ()

@property (strong) NSMutableArray *cities;

@end

@implementation CityListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.addNewCityButton setBackgroundColor:[StyleGuide baseColor]];
    [self.addNewCityButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.listLabel setTextColor:[StyleGuide baseColor]];
    self.cities = [DataStore getCitiesList];
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

-(void)updateCitiesList
{
    self.cities = [DataStore getCitiesList];
    [self.cityTable reloadData];
}

- (IBAction)openNewCityViewController:(id)sender
{
    AddNewCityViewController* ancvc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddNewCityViewController"];
    ancvc.delegate = self;
    [self presentViewController:ancvc animated:YES completion:nil];
}

#pragma mark - AddNewCity delegate

- (void) didDismissAddNewCityViewController:(UIViewController *)vc
{
    [self updateCitiesList];
}

# pragma mark Table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSManagedObject *city = [self.cities objectAtIndex:indexPath.row];
    [cell.textLabel setText:[city valueForKey:@"name"]];
    return cell;
}

@end
