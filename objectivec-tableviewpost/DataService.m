//
//  DataService.m
//  Udemy-ObjectiveC-Assign4
//
//  Created by Ignacio Lizarralde on 10/20/16.
//  Copyright © 2016 Ignacio Lizarralde. All rights reserved.
//

#import "DataService.h"

@interface DataService()
@end

NSString* const KEY_POSTS = @"POSTS";

@implementation DataService

- (id)init {
    _loadedPosts = [[NSMutableArray alloc] init];
    return self;
}

+ (id)instance {
    static DataService* dataServiceInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataServiceInstance = [[self alloc] init];
    });
    return dataServiceInstance;
}

- (void)loadPosts {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *postsData = [userDefaults objectForKey:KEY_POSTS];
    if (postsData != nil) {
        _loadedPosts = [NSKeyedUnarchiver unarchiveObjectWithData:postsData];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"postsLoaded" object:nil];
}

- (void)savePosts {
    NSData* postData = [NSKeyedArchiver archivedDataWithRootObject:_loadedPosts];
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:postData forKey:KEY_POSTS];
    [userDefaults synchronize];
}

- (NSString*)saveImageAndCreatePath:(UIImage*) image {
    NSData* imageData = UIImagePNGRepresentation(image);
    NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate];
    NSMutableString* imagePath = [[NSMutableString alloc] init];
    [imagePath appendString:[NSString stringWithFormat:@"%f", timeInterval]];
    [imagePath appendString:@".png"];
    NSString* fullPath = [self documentsPathForFilename:imagePath];
    [imageData writeToFile:fullPath atomically:YES];
    return imagePath;
}
- (UIImage*)imageForPath:(NSString*) path {
    NSString* fullPath = [self documentsPathForFilename:path];
    UIImage* image = [[UIImage alloc] initWithContentsOfFile:fullPath];
    return image;
}

- (void)addPost:(Post*) post {
    [_loadedPosts addObject:post];
    [self savePosts];
    [self loadPosts];
}

- (NSString*) documentsPathForFilename:(NSString*) filename {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* fullPath = [paths objectAtIndex:0];
    return [fullPath stringByAppendingPathComponent: filename];
}

@end
