//
//  DataService.h
//  Udemy-ObjectiveC-Assign4
//
//  Created by Ignacio Lizarralde on 10/20/16.
//  Copyright © 2016 Ignacio Lizarralde. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Post;
extern NSString* const KEY_POSTS;

@interface DataService : NSObject

@property(nonatomic, strong) NSMutableArray* loadedPosts;

+ (id)instance;
- (void)loadPosts;
- (void)savePosts;
- (NSString*)saveImageAndCreatePath:(UIImage*) image;
- (UIImage*)imageForPath:(NSString*) path;
- (void)addPost:(Post*) post;
- (NSString*) documentsPathForFilename:(NSString*) filename;
@end
