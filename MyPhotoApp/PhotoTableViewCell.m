//
//  PhotoTableViewCell.m
//  MyPhotoApp
//
//  Created by Rawitat Pulam on 7/21/2556 BE.
//  Copyright (c) 2556 Code App Co., LTD. All rights reserved.
//

#import "PhotoTableViewCell.h"
#import "Photo.h"

@interface PhotoTableViewCell () //<PhotoDelegate>
@property (strong, nonatomic) Photo *photo;
@property (weak, nonatomic) IBOutlet UILabel *photoNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@end

@implementation PhotoTableViewCell

static NSString *kPhotoImageKeyPath = @"photoImage";

- (void)prepareForReuse {
    // เรียกก่อน resue cell
    // แก้ปัญหาตอน ภาพ มัน แว๊บ ๆ ขึ้นมา เกิดจาก ภาพมันค้าง เนื่องจาก มันเก็บ cell  เข้าไปเลย
//    self.photo.delegate = nil;
    self.imageView.image = nil;
}

- (void)configureWithPhoto:(Photo *)photo {
    self.photoNameLabel.text = photo.name;
    self.photoImageView.image = photo.photoImage;
    self.photo = photo;
//    self.photo.delegate = self;
    
    // kvo
    [self.photo addObserver:self forKeyPath:kPhotoImageKeyPath options:NSKeyValueObservingOptionNew context:nil];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    UIImage *image = change[NSKeyValueChangeNewKey];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.photoImageView.image = image;

    });
}

- (void)photoDidFinishLoadingImage:(Photo *)photo {
    self.photoImageView.image = photo.photoImage;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
