//
//  GameScene.m
//  SKiOS8NewFeatTutorial
//
//  Created by Orlando Pereira on 07/10/14.
//  Copyright (c) 2014 Orlando Pereira. All rights reserved.
//

#import "GameScene.h"

#import "ShaderScene.h"
#import "LightingScene.h"
#import "PhysicsScene.h"
#import "SceneKitScene.h"

@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */    
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    
    myLabel.text = @"iOS8 SK New Features";
    myLabel.fontSize = 45;
    myLabel.fontColor = [UIColor redColor];
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+300);
    
    [self addChild:myLabel];
    
    SKSpriteNode *btnShaderSize = [[SKSpriteNode alloc] initWithImageNamed:@"btnShaderSize.png"];
    btnShaderSize.position = CGPointMake(CGRectGetMidX(self.frame)+5,CGRectGetMidY(self.frame)+200);
    btnShaderSize.name = @"buttonShaderSize";
    btnShaderSize.size = CGSizeMake(400, 100);
    [self addChild:btnShaderSize];
    
    SKSpriteNode *btnShaderCoder = [[SKSpriteNode alloc] initWithImageNamed:@"btnShaderCoder.png"];
    btnShaderCoder.position = CGPointMake(CGRectGetMidX(self.frame)+5,CGRectGetMidY(self.frame)+100);
    btnShaderCoder.name = @"buttonShaderCoder";
    btnShaderCoder.size = CGSizeMake(400, 100);
    [self addChild:btnShaderCoder];
    
    
    SKSpriteNode *btnLighting = [[SKSpriteNode alloc] initWithImageNamed:@"btnLighting.png"];
    btnLighting.position = CGPointMake(CGRectGetMidX(self.frame)+5,CGRectGetMidY(self.frame));
    btnLighting.name = @"buttonLighting";
    btnLighting.size = CGSizeMake(400, 100);
    [self addChild:btnLighting];
    
    SKSpriteNode *btnPhysics = [[SKSpriteNode alloc] initWithImageNamed:@"btnPhysics.png"];
    btnPhysics.position = CGPointMake(CGRectGetMidX(self.frame)+5,CGRectGetMidY(self.frame)-100);
    btnPhysics.name = @"buttonPhysics";
    btnPhysics.size = CGSizeMake(400, 100);
    [self addChild:btnPhysics];
    
    SKSpriteNode *btnSceneKit = [[SKSpriteNode alloc] initWithImageNamed:@"btnSceneKit.png"];
    btnSceneKit.position = CGPointMake(CGRectGetMidX(self.frame)+5,CGRectGetMidY(self.frame)-200);
    btnSceneKit.name = @"buttonSceneKit";
    btnSceneKit.size = CGSizeMake(400, 100);
    [self addChild:btnSceneKit];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        
        if ([node.name isEqualToString:@"buttonShaderSize"]) {
            SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionLeft duration:1];
            ShaderScene *scene = [[ShaderScene alloc] initWithSize:CGSizeMake(640, 1136)];
            [self.scene.view presentScene:scene transition:reveal];
        }
        
        if ([node.name isEqualToString:@"buttonShaderCoder"]) {
            // Complete this
        }
        
        if ([node.name isEqualToString:@"buttonLighting"]) {
            LightingScene *scene = [LightingScene unarchiveFromFile:@"LightingSceneEditor"];
            [self.scene.view presentScene:scene];
        }
        
        if ([node.name isEqualToString:@"buttonPhysics"]) {
            PhysicsScene *scene = [PhysicsScene unarchiveFromFile:@"PhysicsSceneEditor"];
            [self.scene.view presentScene:scene];
        }
        
        if ([node.name isEqualToString:@"buttonSceneKit"]) {
            SceneKitScene *scene = [SceneKitScene unarchiveFromFile:@"SceneKitSceneEditor"];
            [self.scene.view presentScene:scene];
        }
        
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
