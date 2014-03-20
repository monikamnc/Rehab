//
//  EmpezarViewController.h
//  Rehab
//
//  Created by monica.martin1 on 17/03/14.
//  Copyright (c) 2014 monica.esteve. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface EmpezarViewController : ViewController
@property (weak, nonatomic) IBOutlet UILabel *descripcioLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imatgeLabel;
- (IBAction)empezarButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *tiempoLabel;
@property (nonatomic, strong) NSTimer *contadorTimer;
@property (nonatomic) int i;
@property (nonatomic) int ejercicioIndex2;

@property (nonatomic) NSString *text1;
@property (nonatomic) NSString *text2;
@property (nonatomic) NSString *imatge1;
@property (nonatomic) NSString *imatge2;

@property (nonatomic) int comptador;


@end
