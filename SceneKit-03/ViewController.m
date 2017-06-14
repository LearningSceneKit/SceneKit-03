//
//  ViewController.m
//  SceneKit-03
//
//  Created by ShiWen on 2017/6/14.
//  Copyright © 2017年 ShiWen. All rights reserved.
//

#import "ViewController.h"
#import <SceneKit/SceneKit.h>

@interface ViewController ()
@property (nonatomic,strong) SCNView *scnView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SCNScene *scene = [SCNScene scene];
    self.scnView.scene =  scene;
    
    //创建球
    SCNSphere *sphere = [SCNSphere sphereWithRadius:0.5];
    sphere.firstMaterial.diffuse.contents = [UIColor yellowColor];
    SCNNode *sphereNode = [SCNNode node ];
    sphereNode.geometry = sphere;
    
    [scene.rootNode addChildNode:sphereNode];
    
    
    
//    灯光
    SCNLight *light = [SCNLight light];
//    灯光颜色
    light.color = [UIColor whiteColor];
//    设置灯光类型
    light.type = SCNLightTypeOmni;
//    内夹角
//    light.spotInnerAngle = 20;
////    是否捕捉阴影
//    light.castsShadow = YES;

////    灯光能照射最远单位
    light.zFar = 10;
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = light;
//    位置
    lightNode.position = SCNVector3Make(1, 0.5, 0.7);
    [sphereNode addChildNode:lightNode];

    
    [self.view addSubview:self.scnView];
    
    
    
}

-(SCNView *)scnView{
    if (!_scnView) {
        _scnView = [[SCNView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        _scnView.center = self.view.center;
        _scnView.backgroundColor = [UIColor redColor];
//        开启交互
        _scnView.allowsCameraControl = YES;
    }
    return _scnView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
