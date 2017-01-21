//
//  DataStore.h
//  Test-sovcombank
//
//  Created by Ruslan on 21/01/2017.
//  Copyright © 2017 Ruslan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface DataStore : NSObject

+(NSManagedObjectContext *)getContext;
+(void)addCityWithName:(NSString *)name region:(NSString *)region foundationyear:(NSString *)foundationyear image:(UIImage *)image;
+(NSMutableArray *)getCitiesList;

@end
