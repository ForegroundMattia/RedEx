//
//  TouchActions.swift
//  GamePriest
//
//  Created by DONATO BASTIONE on 11/12/23.
//

import Foundation
import SpriteKit
import GameplayKit

extension GameScene {
    
    //PARTE RELATIVA AL PRETE E ALLA GOCCIA
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        // Calcola la distanza tra il tocco e la posizione del prete
        let distanceToPriest = touchLocation.distance(to: prete.position)
        
        // Imposta una distanza massima consentita per considerare il tocco come sul prete
        let maxDistanceToPriest: CGFloat = 50.0
        
        // Controlla se il tocco è abbastanza vicino alla posizione del prete
        if distanceToPriest <= maxDistanceToPriest {
            isMoving = true
            previousTouchPosition = touchLocation
            startTextureChangeTimer()
            isTouchingPriest = true
            startDropTimer(interval: 0.2)
        }
    }
    //TOCCO SUL PRETE: se sto continuando a tenerlo premuto
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //guard isTouchingPriest, let touch = touches.first else { return }
        guard !isPriestPaused, isTouchingPriest, isMoving, let touch = touches.first else {
                return
            }
        let touchLocation = touch.location(in: self)
        
        // Chiamare la funzione move(to:) solo se il tocco è ancora sulla scena
        if self.frame.contains(touchLocation) {
            prete.move(to: touchLocation)
            
            // Calcola la direzione del movimento
            if let previousPosition = previousTouchPosition {
                let delta = touchLocation - previousPosition
                
                // Cambia le immagini in base alla direzione del movimento
                if delta.x > 0 {
                    changeTexture(for: .right)
                } else if delta.x < 0 {
                    changeTexture(for: .left)
                } else if delta.y > 0 {
                    changeTexture(for: .up)
                } else {
                    changeTexture(for: .straight)
                }
            }
            // Aggiorna la posizione precedente del tocco
            previousTouchPosition = touchLocation
        }
    }
    
    //TOCCO SUL PRETE: appena lo rilascio
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isMoving = false
        previousTouchPosition = nil
        stopDropTimer()
        
        stopTextureChangeTimer()
        isTouchingPriest = false
    }
}
