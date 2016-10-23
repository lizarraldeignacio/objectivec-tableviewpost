//
//  ViewController.m
//  Udemy-ObjectiveC-Assign4
//
//  Created by Ignacio Lizarralde on 10/20/16.
//  Copyright © 2016 Ignacio Lizarralde. All rights reserved.
//

#import "ViewController.h"
#import "DataService.h"
#import "PostCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [[DataService instance] loadPosts];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onPostsLoaded:) name:@"postsLoaded" object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onPostsLoaded:(id) anyObject {
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[DataService instance] loadedPosts] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Post* post = [[[DataService instance] loadedPosts] objectAtIndex:[indexPath row]];
    PostCell* cell = (PostCell*) [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    if (cell == nil) {
        cell = [[PostCell alloc] init];
    }
    [cell configureCell:post];
    return cell;
}

@end
