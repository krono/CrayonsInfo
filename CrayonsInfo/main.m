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
            printf("%-10s", [key UTF8String]);
            printf("\t\tr: %3d g: %3d b: %3d",
                  bcomponent(color.redComponent),
                  bcomponent(color.greenComponent),
                  bcomponent(color.blueComponent));
            printf("\t\t#%02X%02X%02X",
                   bcomponent(color.redComponent),
                   bcomponent(color.greenComponent),
                   bcomponent(color.blueComponent));
            printf("\t\tr: %-10g g: %-10g b: %-10g",
                   color.redComponent,
                   color.greenComponent,
                   color.blueComponent);
            printf("\n");
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
