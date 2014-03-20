//
//  EmpezarViewController.m
//  Rehab
//
//  Created by monica.martin1 on 17/03/14.
//  Copyright (c) 2014 monica.esteve. All rights reserved.
//

#import "EmpezarViewController.h"
#import "EjercicioCell.h"

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
    
    NSLog(@"%i",_ejercicioIndex2);
    
    switch (_ejercicioIndex2) {
        case 0:
            
            _imatge1 = @"imatge1.png";
            _imatge2 = @"imatge2.png";
            
            _text1 = @"Dejar los brazos relajados, con la espalda recta y la columna lumbar corregida.";
            _text2 = @"Retraer el mentón y apetrarlo contra el pecho. No bajar la mirada, siempre al frente.";
            
            break;
        case 1:
            _imatge1 = @"cuello1.png";
            _imatge2 = @"cuello2.png";
            
            _text1 = @"Dejar caer la cabeza lentemente hacia adelante, hasta que la barbilla se acerque lo posible al pecho.";
            _text2 = @"Levantar lentamente la cabeza y llevarla hacia atrás tanto como se pueda.";
            
            break;
        case 2:
            _imatge1 = @"isometrico1.png";
            _imatge2 = @"isometrico2.png";
            
            _text1 = @"Dejar caer la cabeza lentemente hacia adelante, hasta que la barbilla se acerque lo posible al pecho.";
            _text2 = @"Levantar lentamente la cabeza y llevarla hacia atrás tanto como se pueda.";
            
            break;
        case 3:
            _imatge1 = @"musculo1.png";
            _imatge2 = @"musculo2.png";
            
            _text1 = @"Dejar caer la cabeza lentemente hacia adelante, hasta que la barbilla se acerque lo posible al pecho.";
            _text2 = @"Levantar lentamente la cabeza y llevarla hacia atrás tanto como se pueda.";
            
            break;
            
        default:
            break;
    }
    _descripcioLabel.text  = _text1;
    _imatgeLabel.image = [UIImage imageNamed: _imatge1];
    
    _comptador = 0;

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
    if(_comptador == 0){
        if((_i%5)==0){
            _descripcioLabel.text = _text2;
            _imatgeLabel.image = [UIImage imageNamed: _imatge2];
            _comptador++;
        }
        
    }else{
        if((_i%5)==0){
            _descripcioLabel.text = _text1;
            _imatgeLabel.image = [UIImage imageNamed: _imatge1];
            _comptador--;
        }
        
    }
    if (_i==0){ _tiempoLabel.text = @"Fin";
        SystemSoundID soundID;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"alarma" ofType:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)[NSURL fileURLWithPath:path],&soundID);
        AudioServicesPlaySystemSound (soundID);
}
    //Cuando i tome el valor de 0 cambio el caracter de segundero por este otro y hago que suene mi alarma.
    if (_i==-1){ _tiempoLabel.text = @"Fin";
                sleep(2);
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (IBAction)empezarButton:(id)sender {
    //Como se puede ver inicio la variable i con el valor 10
    _i=10; _contadorTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(comienza:) userInfo:nil repeats:YES];
    
}
@end
