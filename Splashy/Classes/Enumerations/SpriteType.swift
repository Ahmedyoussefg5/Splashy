//
//  SpriteType.swift
//  Splashy
//
//  Created by Pedro Carrasco on 23/01/18.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import SpriteKit

enum SpriteType: String {
    case splashy = "character-main"
    case enemy = "character-enemy"
    case ruby = "score-ruby"
    case ground = "ground"
    case sky = "sky"
    case background = "background"
}

extension SpriteType {
    var node: SKSpriteNode {
        if case .sky = self {
            return SKSpriteNode(color: .clear, size: CGSize(width: UIScreen.main.bounds.width, height: 1))
        } else {
            return SKSpriteNode(imageNamed: rawValue)
        }
    }
    
    var zPosition: CGFloat {
        switch self {
        case .background:
            return 1
        case .enemy:
            return 2
        case .ruby:
            return 2
        case .ground, .sky:
            return 3
        case .splashy:
            return 4
        
        }
    }
    
    var scale: CGFloat {
        switch self {
        case .splashy:
            return 0.5
        case .enemy:
            return 0.9
        case .ruby:
            return 0.5
        default:
            return 1
        }
    }
    
    var physicsId: UInt32 {
        switch self {
        case .splashy:
            return 0x1 << 1
        case .enemy:
            return 0x1 << 2
        case .ruby:
            return 0x1 << 3
        case .ground:
            return 0x1 << 4
        case .background:
            return 0x1 << 5
        case .sky:
            return 0x1 << 6
        }
    }
    
    var colisionBitmask: UInt32 {
        switch self {
        case .splashy:
            return SpriteType.ground.physicsId | SpriteType.enemy.physicsId | SpriteType.sky.physicsId
        case .background:
            return 0
        default:
            return SpriteType.splashy.physicsId
            
        }
    }
    
    var isDynamic: Bool {
        switch self {
        case .splashy:
            return true
        default:
            return false
        }
    }
    
    var isAffectedByGravity: Bool {
        switch self {
        default:
            return false
        }
    }
    
    func position(in frame: CGRect, with sprite: SKSpriteNode) -> CGPoint {
        switch self {
        case .splashy:
            return CGPoint(x: frame.width/2 - sprite.frame.width, y: frame.height/2)
        case .enemy, .ruby:
            return CGPoint(x: frame.width * 1.25, y: frame.height/2)
        case .ground:
            return CGPoint(x: frame.width/2, y: sprite.frame.height/2)
        case .background:
            return CGPoint(x: frame.width/2, y: frame.height/2)
        case .sky:
            return CGPoint(x: frame.width/2, y: frame.height)
        }
    }
    
    func physicsBody(with size: CGSize) -> SKPhysicsBody {
        switch self {
        case .splashy:
            let texture = SKTexture(imageNamed: rawValue)
            let size = CGSize(width: size.width * SplashyConstants.physicsBodyRatio,
                              height: size.height * SplashyConstants.physicsBodyRatio)
            return SKPhysicsBody(texture: texture, size: size)
        case .enemy, .ruby:
            let texture = SKTexture(imageNamed: rawValue)
            return SKPhysicsBody(texture: texture, size: size)
        case .ground, .sky:
            return SKPhysicsBody(rectangleOf: size)
        case .background:
            return SKPhysicsBody()
        }
    }
}
