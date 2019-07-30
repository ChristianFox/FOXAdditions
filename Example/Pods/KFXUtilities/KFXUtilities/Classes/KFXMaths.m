/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXUtilities
 *
 ************************************/


#import "KFXMaths.h"



@implementation KFXMaths

//-----------------------------------------------------------
#pragma mark - Random Numbers
//-----------------------------------------------------------
u_int32_t randomUnsignedIntegerWithMinAndMax(u_int32_t min, u_int32_t max){
    
    // if min is greater than max assume it is accidental and switch them
    if (min > max) {
        u_int32_t temp = min;
        min = max;
        max = temp;
    }

    u_int32_t range = max - min;
    u_int32_t rand = arc4random_uniform(range)+min;
    return rand;
}

int randomIntWithMinAndMax(int min,int max){
    if (min > max) {
        int temp = min;
        min = max;
        max = temp;
    }
    int range = max - min;
    int rand = (arc4random() % (range + 1)) + min;
    return rand;
}

float randomFloatWithMinAndMax(float min, float max){
    if (min > max) {
        float temp = min;
        min = max;
        max = temp;
    }
    
    float range = max-min;
    float randomFloat = (((float)arc4random()/0x100000000)*(range)+min);
    return randomFloat;
}


double randomDoubleWithMinAndMax(double min, double max){
    
    if (min > max) {
        double temp = min;
        min = max;
        max = temp;
    }
    
    double range = max-min;
    double rand  = (((double)arc4random()/0x100000000)*(range)+min);
    return rand;
}





@end
