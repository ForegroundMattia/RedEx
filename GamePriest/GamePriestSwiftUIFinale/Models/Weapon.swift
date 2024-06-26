//
//  Weapeon.swift
//  GamePriestSwiftUIFinale
//
//  Created by Mattia Marranzino on 16/12/23.
//

import Foundation
import SpriteKit


class Croce: SKSpriteNode{
    var damege: Int = 10
    var range: Int = 1
    
    //INIZIALIZZAZIONE
    init() {
        let texture = SKTexture(imageNamed: "Spada")
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class Granata: SKSpriteNode{
    var damege: Int = 5
    var range: Int = 20
    
    //INITIALIZATIION
    init() {
        let texture = SKTexture(imageNamed: "Granata")
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class Aspersorio: SKSpriteNode{
    var damege: Int = 1
    var range: Int = 5
    
    //INITIALIZATIION
    init() {
        let texture = SKTexture(imageNamed: "HolyWater1")
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


