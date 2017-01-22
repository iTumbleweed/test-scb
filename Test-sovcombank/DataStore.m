//
//  DataStore.m
//  Test-sovcombank
//
//  Created by Ruslan on 21/01/2017.
//  Copyright © 2017 Ruslan. All rights reserved.
//

#import "DataStore.h"

@implementation DataStore

+(NSManagedObjectContext *)getContext
{
    // Getting the CoreData context to work with
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
    return context;
}

+(void)addCityWithName:(NSString *)name region:(NSString *)region foundationyear:(NSString *)foundationyear image:(UIImage *)image
{
    NSManagedObjectContext *context = [self getContext];
    NSManagedObject *newCity = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:context];
    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    [newCity setValue:name forKey:@"name"];
    [newCity setValue:region forKey:@"region"];
    [newCity setValue:foundationyear forKey:@"foundationyear"];
    [newCity setValue:imageData forKey:@"image"];
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"Can't save! %@ %@", error, [error localizedDescription]);
    }
}

+(NSMutableArray *)getCitiesList
{
    NSManagedObjectContext *context = [self getContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"City"];
    NSMutableArray* cities = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    return cities;
}

+(void)deleteCity:(NSManagedObjectID *)id
{
    NSManagedObjectContext *context = [self getContext];
    [context deleteObject:[context existingObjectWithID:id error:nil]];
}

@end
