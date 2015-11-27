//
//  Photo.h
//  MyPhotoApp
//
//  Created by Rawitat Pulam on 7/21/2556 BE.
//  Copyright (c) 2556 Code App Co., LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
//@class Photo;

//@protocol PhotoDelegate <NSObject>

//- (void)photoDidFinishLoadingImage:(Photo *)photo; //ต้องส่งตัวเองมาเปน argument

//@end

@interface Photo : NSObject
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *message;
@property (nonatomic, readonly) NSString *flickrURL;
@property (nonatomic, readonly) UIImage *photoImage;

//@property (nonatomic, weak) id <PhotoDelegate> delegate; //Input เป็นอะไรก็ได้ ไม่แคร

-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
