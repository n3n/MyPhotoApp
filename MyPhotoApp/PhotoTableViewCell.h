//
//  PhotoTableViewCell.h
//  MyPhotoApp
//
//  Created by Rawitat Pulam on 7/21/2556 BE.
//  Copyright (c) 2556 Code App Co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;

@interface PhotoTableViewCell : UITableViewCell
-(void)configureWithPhoto:(Photo *)photo;
@end
