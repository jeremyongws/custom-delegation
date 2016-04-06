//
//  ViewController.m
//  FeedImage
//
//  Created by Jeremy Ong on 06/04/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "ViewController.h"
#import "PictureCollectionViewCell.h"
#import "Picture.h"
#import "CustomView.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, CustomViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSMutableArray *pictures;
@property NSIndexPath *lastIndexPathClicked;

@end

@implementation ViewController

- (void)viewDidLoad {
	self.collectionView.delegate = self;
	self.collectionView.dataSource = self;
	[self populatePictures];
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	PictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
	cell.imageView.image = [[self.pictures objectAtIndex:[indexPath row]] image];
	cell.backgroundColor = [[self.pictures objectAtIndex:[indexPath row] ] frameColor];
	return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	CGSize tmpSize = self.collectionView.bounds.size;
	return CGSizeMake(tmpSize.width, tmpSize.height);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	return [[self pictures] count];
}

- (void)onColourButtonPressed:(UIButton *)button{
	Picture *picture = [self.pictures objectAtIndex:[self.lastIndexPathClicked row]];
	if ([[button restorationIdentifier] isEqualToString:@"red"]){
		picture.frameColor = [UIColor redColor];
		
	} else if ([[button restorationIdentifier] isEqualToString:@"blue"]){
		picture.frameColor = [UIColor blueColor];
	} else if ([[button restorationIdentifier] isEqualToString:@"green"]){
		picture.frameColor = [UIColor greenColor];
	}
	[[[self.view.subviews lastObject] viewWithTag:123] removeFromSuperview];
	[self.collectionView reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
	NSArray *nibContentsArray = [[NSBundle mainBundle] loadNibNamed: @"CustomizationView" owner: self options: nil];
	CustomView *nibContents = [nibContentsArray objectAtIndex:0];
	nibContents.frame = self.view.frame;
	nibContents.delegate = self;
	nibContents.tag = 123;
	self.lastIndexPathClicked = indexPath;
	 [self.view addSubview:nibContents];
}

- (void)onGoButtonPressed:(UIButton *)button withRedSliderValue:(float)redSliderValue withGreenSliderValue:(float)greenSliderValue withBlueSliderValue:(float)blueSliderValue{
	float redValue = redSliderValue;
	float greenValue = greenSliderValue;
	float blueValue = blueSliderValue;
	
	NSIndexPath *indexPath = self.lastIndexPathClicked;
	Picture *picture = [self.pictures objectAtIndex:[indexPath row]];
	picture.frameColor = [UIColor colorWithRed:redValue
																			 green:greenValue
																				blue:blueValue
																			 alpha:1];
	[[[self.view.subviews lastObject] viewWithTag:123] removeFromSuperview];
	[self.collectionView reloadData];
}


// no touch plz
- (void)populatePictures{
	Picture *one = [[Picture alloc] initWithImageName:@"woman_one" andColor:[UIColor whiteColor]];
	Picture *two = [[Picture alloc] initWithImageName:@"woman_two" andColor:[UIColor whiteColor]];
	Picture *three = [[Picture alloc] initWithImageName:@"woman_three" andColor:[UIColor whiteColor]];
	Picture *four = [[Picture alloc] initWithImageName:@"woman_four" andColor:[UIColor whiteColor]];
	Picture *five = [[Picture alloc] initWithImageName:@"woman_five" andColor:[UIColor whiteColor]];
	
	self.pictures = [[NSMutableArray alloc] initWithObjects:one, two, three, four, five, nil];
}

@end
