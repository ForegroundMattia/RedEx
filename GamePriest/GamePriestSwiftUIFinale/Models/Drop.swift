//
//  Drop.swift
//  GamePriestSwiftUIFinale
//
//  Created by Mattia Marranzino on 16/12/23.
//

import Foundation
//
//  Drop.swift
//  GamePriest
//
//  Created by Maria Concetta on 07/12/23.
//

import Foundation
import GameplayKit
import SpriteKit

class Drop: SKSpriteNode {
      init(scale: CGFloat) {
          let texture = SKTexture(imageNamed: "Drop")
          let size = CGSize(width: texture.size().width * scale, height: texture.size().height * scale)
          super.init(texture: texture, color: .clear, size: size)
      }

      required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}
