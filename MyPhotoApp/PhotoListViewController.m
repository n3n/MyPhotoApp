//
//  ViewController.m
//  MyPhotoApp
//
//  Created by Rawitat Pulam on 7/21/2556 BE.
//  Copyright (c) 2556 Code App Co., LTD. All rights reserved.
//

#import "PhotoListViewController.h"
#import "Photo.h"
#import "PhotoTableViewCell.h"

@interface PhotoListViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)loadImageButtonTapped:(id)sender;
@end

@implementation PhotoListViewController {
    NSArray *_photos;
}

- (void)loadPhotoData {
    NSLog(@"Start loading");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https:desolate-thicket-4255.herokuapp.com/photos.json"]]; // ได้แต่ url ของรูปที่เปนแบบ JSON
        NSLog(@"finish loading");
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]; // ให้ JSON obj ไป Serializtion ตัว data ให้ obj-c อ่านได้
        
        NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:json.count];
        for (NSDictionary *dict in json) {
            [tmp addObject:[[Photo alloc] initWithDictionary:dict]];
        }
        _photos = [NSArray arrayWithArray:tmp];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _photos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhotoCell"];
    [cell configureWithPhoto:_photos[indexPath.row]];
    return cell;
}

- (IBAction)loadImageButtonTapped:(id)sender {
    [self loadPhotoData];
}
@end
