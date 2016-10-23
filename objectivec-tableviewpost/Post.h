//
//  Post.h
//  Udemy-ObjectiveC-Assign4
//
//  Created by Ignacio Lizarralde on 10/20/16.
//  Copyright © 2016 Ignacio Lizarralde. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject <NSCoding>

@property(nonatomic, strong) NSString* imagePath;
@property(nonatomic, strong) NSString* postTitle;
@property(nonatomic, strong) NSString* postDescription;

- (id)initWithImagePath:(NSString*) imagePath title:(NSString*) title description:(NSString*) description;
@end
