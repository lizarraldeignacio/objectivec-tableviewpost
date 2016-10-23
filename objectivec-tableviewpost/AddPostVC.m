//
//  AddPostVC.m
//  Udemy-ObjectiveC-Assign4
//
//  Created by Ignacio Lizarralde on 10/20/16.
//  Copyright © 2016 Ignacio Lizarralde. All rights reserved.
//

#import "AddPostVC.h"
#import "Post.h"
#import "DataService.h"

@interface AddPostVC ()
@property(nonatomic, strong) UIImagePickerController* imagePicker;
@end

@implementation AddPostVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addPick:(id)sender {
    [self presentViewController:_imagePicker animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)makePostBtnPressed:(id)sender {
    if (_titleTextField.text && _titleTextField.text.length > 0 &&
        _descriptionTextfield.text && _descriptionTextfield.text.length> 0
        && _imagePickView.image) {
        NSString* imagePath = [[DataService instance] saveImageAndCreatePath:_imagePickView.image];
        Post* post = [[Post alloc] initWithImagePath:imagePath title:_titleTextField.text description:_descriptionTextfield.text];
        [[DataService instance] addPost:post];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (IBAction)cancelBtnPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0) {
    _imagePickView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
    _pickButton.hidden = YES;
}

@end
