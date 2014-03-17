//
//  EmpezarViewController.m
//  Rehab
//
//  Created by monica.martin1 on 17/03/14.
//  Copyright (c) 2014 monica.esteve. All rights reserved.
//

#import "EmpezarViewController.h"

@interface EmpezarViewController ()

@end

@implementation EmpezarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)comienza:(NSTimer *) elContador {
    //Comienzo a restar la cantidad de 1 a i por cada segundo que pasa.
    _i=_i-1;
    //Mientras i sea mayor o igual de 0 el segundero seguirá cambiando de valor en pantalla.
    if(_i>=0){ _tiempoLabel.text = [[NSNumber numberWithInt:_i] stringValue];
    }
    if((_i%5)==0){
        _descripcioLabel.text = @"Retraer el mentón y apetrarlo contra el pecho. No bajar la mirada, siempre al frente.";
        _imatgeLabel.image = [UIImage imageNamed:@"imatge2.png"];
    }
    //Cuando i tome el valor de 0 cambio el caracter de segundero por este otro y hago que suene mi alarma.
    if (_i==0){ _tiempoLabel.text = @"Fin";
        SystemSoundID soundID;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"alarma" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)[NSURL fileURLWithPath:path],&soundID);
        AudioServicesPlaySystemSound (soundID);
    }
}

- (IBAction)empezarButton:(id)sender {
    //Como se puede ver inicio la variable i con el valor 10
    _i=45; _contadorTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(comienza:) userInfo:nil repeats:YES];
    
}
@end
