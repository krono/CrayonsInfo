//
//  main.m
//  CrayonsInfo
//
//  Created by Tobias Pape on 12.11.15.
//
//

#import <Foundation/Foundation.h>
@import AppKit;

#define bcomponent(cgfloatcomponent) ((int)round((cgfloatcomponent) * 255.0))

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSColorList *colorList = [NSColorList colorListNamed: @"Crayons"];
        for (NSString *key in [colorList allKeys]) {
            NSColor *color = [colorList colorWithKey:key];
            printf("%-10s\t", [key UTF8String]);
            printf("r: %3d g: %3d b: %3d\n",
                  bcomponent(color.redComponent),
                  bcomponent(color.greenComponent),
                  bcomponent(color.blueComponent));
        }
        if (!([[NSFileManager defaultManager] createDirectoryAtPath:@"OldCrayons.clr"
                                        withIntermediateDirectories:NO
                                                         attributes:nil
                                                              error:nil])){
            return 1;
        }
        [colorList writeToFile: @"OldCrayons.clr/OldCrayons.clr"];
    }
    return 0;
}
