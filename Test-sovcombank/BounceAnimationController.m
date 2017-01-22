//
//  BounceAnimationController.m
//  Test-sovcombank
//
//  Created by Ruslan on 20/01/2017.
//  Copyright © 2017 Ruslan. All rights reserved.
//

#import "BounceAnimationController.h"

@implementation BounceAnimationController

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.7;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    UIView *presentedView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    presentedView.frame = containerView.bounds;
    [containerView addSubview:presentedView];
    
    CGAffineTransform transform = presentedView.transform;
    presentedView.transform = CGAffineTransformTranslate(transform, 0, containerView.bounds.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:10
                        options:0
                     animations:^{
                         presentedView.transform = transform;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
