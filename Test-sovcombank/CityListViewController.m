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
#import "CityDetailViewController.h"
#import "DataStore.h"
#import "BounceAnimationController.h"
#import "RoundRectPresentationController.h"

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *city = [self.cities objectAtIndex:indexPath.row];
    CityDetailViewController *cdvc = [self.storyboard instantiateViewControllerWithIdentifier:@"CityDetailViewController"];
    cdvc.image = [UIImage imageWithData:[city valueForKey:@"image"]];
    cdvc.name = [city valueForKey:@"name"];
    cdvc.region = [city valueForKey:@"region"];
    cdvc.foundationYear = [city valueForKey:@"foundationyear"];
    NSLog(@"Image: %@", [city valueForKey:@"image"]);
    [self presentViewController:cdvc animated:YES completion:nil];
}

@end
