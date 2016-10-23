//
//  PostCell.m
//  Udemy-ObjectiveC-Assign4
//
//  Created by Ignacio Lizarralde on 10/20/16.
//  Copyright © 2016 Ignacio Lizarralde. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"
#import "DataService.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _postImage.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell:(Post *)post {
    self.postTitle.text = post.postTitle;
    self.postDescription.text = post.postDescription;
    self.postImage.image = [[DataService instance] imageForPath:post.imagePath];
}

@end
