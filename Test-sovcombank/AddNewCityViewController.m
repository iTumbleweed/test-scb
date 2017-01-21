//
//  AddNewCityViewController.m
//  Test-sovcombank
//
//  Created by Ruslan on 20/01/2017.
//  Copyright © 2017 Ruslan. All rights reserved.
//

#import "AddNewCityViewController.h"
#import "BounceAnimationController.h"
#import "RoundRectPresentationController.h"
#import "StyleGuide.h"
#import "DataStore.h"

@interface AddNewCityViewController ()<PlaceSearchTextFieldDelegate, UITextFieldDelegate, UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet MVPlaceSearchTextField *cityNameAutocompleteField;

@end

@implementation AddNewCityViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        if ([self respondsToSelector:@selector(setTransitioningDelegate:)]) {
            self.modalPresentationStyle = UIModalPresentationCustom;
            self.transitioningDelegate = self;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameField.placeSearchDelegate = self;
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapBehind:)];
    
    [recognizer setNumberOfTapsRequired:1];
    recognizer.cancelsTouchesInView = NO; //So the user can still interact with controls in the modal view
    [self.view.window addGestureRecognizer:recognizer];
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

-(void) handleTapBehind:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint location = [sender locationInView: self.presentingViewController.view]; //Passing nil gives us coordinates in the window
        
        //Then we convert the tap's location into the local view's coordinate system, and test to see if it's in or outside. If outside, dismiss the view.
        
        if (![self.view pointInside:[self.view convertPoint:location fromView:self.view.window] withEvent:nil])
        {
            // Remove the recognizer first so it's view.window is valid.
            [self.view.window removeGestureRecognizer:sender];
            [self closeAddNewCityViewController:self];
        }
    }
}

- (IBAction)add:(id)sender
{
    [DataStore addCityWithName:self.nameField.text region:self.regionField.text foundationyear:self.foundationYear.text image:self.addPhotoButton.currentBackgroundImage];
    [self closeAddNewCityViewController:self];
}

- (IBAction)closeAddNewCityViewController:(id)sender
{
    [self.delegate didDismissAddNewCityViewController:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - Place search Textfield Delegate

-(void)placeSearch:(MVPlaceSearchTextField*)textField ResponseForSelectedPlace:(GMSPlace*)responseDict
{
    [self.view endEditing:YES];
    NSLog(@"SELECTED ADDRESS :%@",responseDict);
}

-(void)placeSearchWillShowResult:(MVPlaceSearchTextField*)textField
{
    
}

-(void)placeSearchWillHideResult:(MVPlaceSearchTextField*)textField
{
    
}
-(void)placeSearch:(MVPlaceSearchTextField*)textField ResultCell:(UITableViewCell*)cell withPlaceObject:(PlaceObject*)placeObject atIndex:(NSInteger)index{
    if(index%2==0){
        cell.contentView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    }else{
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[BounceAnimationController alloc] init];
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[RoundRectPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end
