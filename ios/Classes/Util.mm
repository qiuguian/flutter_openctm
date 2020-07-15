//
//  Util.m
//  flutter_openctm
//
//  Created by qiuguian on 2020/7/15.
//

#import "Util.h"
#include "openctm.h"
#include "openctmpp.h"
#include "stdio.h"
#include "ctm.h"
#include "mesh.h"
#include "obj.h"

@implementation Util

+(SCNNode *)loadCtmWithUrl:(NSString *)ctmurl{
    
    NSURL *url = [NSURL URLWithString:ctmurl];

    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];

    NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];

    NSString *temp = NSTemporaryDirectory();
       
    NSFileManager *fm = [NSFileManager defaultManager];
       
    NSString *path = [temp stringByAppendingPathComponent:@"local.ctm"];

    BOOL b = [fm createFileAtPath:path contents:data attributes:nil];
       
    if(b){
        NSLog(@"load ctm sccuess");
    }else{
        NSLog(@"load ctm error");
    }
    
    Mesh *mesh = new Mesh;

    Import_CTM((char*) [path cStringUsingEncoding:NSUTF8StringEncoding],mesh);

    NSString *objPath = [temp stringByAppendingPathComponent:@"local.obj"];

    Options *a = new Options();
    
    Export_OBJ((char*) [objPath cStringUsingEncoding:NSUTF8StringEncoding], mesh, *a);
    
    SCNScene *scene = [SCNScene sceneWithURL:[NSURL fileURLWithPath:objPath] options:nil error:nil];
    SCNNode *objNosde = scene.rootNode.childNodes[0];
    
    return objNosde;
}

@end
