//
//  Photo.m
//  MyPhotoApp
//
//  Created by Rawitat Pulam on 7/21/2556 BE.
//  Copyright (c) 2556 Code App Co., LTD. All rights reserved.
//

#import "Photo.h"

@interface Photo ()
@property (nonatomic, strong) UIImage *photoImage;

@end

@implementation Photo //{
//    UIImage *_photoImage;
//}

-(UIImage *)photoImage {
    if (!_photoImage) {
        // เตะ photo ไปที่ background
        [self loadPhotoImage];
        
    }
    return _photoImage;
}

- (void)loadPhotoImage {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSData *photoData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.flickrURL]];
        self.photoImage = [UIImage imageWithData:photoData];
        
        // เมื่อ โหลด Photo เสร็จแล้วให้ เตะ Photo กลับไปที่ Main
        //dispatch_async(dispatch_get_main_queue(), ^{
            //                [self.delegate photoDidFinishLoadingImage:self];
        //});
        
    });
}

-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _name = dictionary[@"name"];
        _message = dictionary[@"message"];
        _flickrURL = dictionary[@"flickrurl"];
    }
    return self;
}
@end
