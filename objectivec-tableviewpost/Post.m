//
//  Post.m
//  Udemy-ObjectiveC-Assign4
//
//  Created by Ignacio Lizarralde on 10/20/16.
//  Copyright © 2016 Ignacio Lizarralde. All rights reserved.
//

#import "Post.h"

@interface Post()
    
@end

@implementation Post

- (id)initWithImagePath:(NSString*) imagePath title:(NSString*) title description:(NSString*) description {
    self = [super init];
    _imagePath = imagePath;
    _postTitle = title;
    _postDescription = description;
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_imagePath forKey:@"imagePath"];
    [aCoder encodeObject:_postDescription forKey:@"description"];
    [aCoder encodeObject:_postTitle forKey:@"title"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    self.imagePath = [aDecoder decodeObjectForKey:@"imagePath"];
    self.postDescription = [aDecoder decodeObjectForKey:@"description"];
    self.postTitle = [aDecoder decodeObjectForKey:@"title"];
    return self;
}

@end
