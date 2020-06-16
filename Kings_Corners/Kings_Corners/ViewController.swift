//
//  ViewController.swift
//  Kings_Corners
//
//  Created by Brandi Bailey on 6/4/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDragInteractionDelegate {
    
    var card: Card?
    var deck: [Card] = []
    var currentCard: Card?
    var spentDeck: [Card] = []
    
    @IBOutlet weak var createNewDeckButton: UIButton!
    @IBOutlet weak var cardImageView: UIImageView!
    
    @IBOutlet weak var cardGrid00: UIImageView!
    @IBOutlet weak var cardGrid01: UIImageView!
    @IBOutlet weak var cardGrid02: UIImageView!
    @IBOutlet weak var cardGrid03: UIImageView!
    @IBOutlet weak var cardGrid10: UIImageView!
    @IBOutlet weak var cardGrid11: UIImageView!
    @IBOutlet weak var cardGrid12: UIImageView!
    @IBOutlet weak var cardGrid13: UIImageView!
    @IBOutlet weak var cardGrid20: UIImageView!
    @IBOutlet weak var cardGrid21: UIImageView!
    @IBOutlet weak var cardGrid22: UIImageView!
    @IBOutlet weak var cardGrid23: UIImageView!
    @IBOutlet weak var cardGrid30: UIImageView!
    @IBOutlet weak var cardGrid31: UIImageView!
    @IBOutlet weak var cardGrid32: UIImageView!
    @IBOutlet weak var cardGrid33: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureNewGame()
        print(deck)
    }
    
    @IBAction func createNewDeckTapped(_ sender: Any) {
        
        handleDeck()
    }
    
    
    // Functions
    
    func configureNewGame() {
        deck = createNewDeck()
        
        let dragInteraction = UIDragInteraction(delegate: self)
        dragInteraction.isEnabled = true
        cardImageView.addInteraction(dragInteraction)
        
        let dropInteraction = UIDropInteraction(delegate: self)
        cardGrid00.addInteraction(dropInteraction)
        cardGrid01.addInteraction(dropInteraction)
        cardGrid02.addInteraction(dropInteraction)
        cardGrid03.addInteraction(dropInteraction)
        cardGrid10.addInteraction(dropInteraction)
        cardGrid11.addInteraction(dropInteraction)
        cardGrid12.addInteraction(dropInteraction)
        cardGrid13.addInteraction(dropInteraction)
        cardGrid20.addInteraction(dropInteraction)
        cardGrid21.addInteraction(dropInteraction)
        cardGrid22.addInteraction(dropInteraction)
        cardGrid23.addInteraction(dropInteraction)
        cardGrid30.addInteraction(dropInteraction)
        cardGrid31.addInteraction(dropInteraction)
        cardGrid32.addInteraction(dropInteraction)
        cardGrid33.addInteraction(dropInteraction)
        
    }
    
    func handleDeck() {
        for card in deck {
            print(card.name, card.value)
        }
        
        let firstCard = deck[0]
        cardImageView.image = firstCard.img
        
        let nextCard = deck[1]
        
        let currentCard = firstCard
        deck.remove(at: 0)
        print(firstCard.name, currentCard.name, nextCard.name)
        
        spentDeck.append(currentCard)
        for card in spentDeck {
            print("SpentDeck: ", card.value)
        }
        
        
        if deck.count == 0 {
            deck = createNewDeck()
        }
        
        print("Number of items in deck: ", deck.count)
    }
    
    
    
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        
        guard let image = cardImageView.image else { return []}
        //        guard let upCard = currentCard else { return []}
        let item = UIDragItem(itemProvider: NSItemProvider(object: image))
        item.localObject = item
        
        return [item]
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, sessionDidTransferItems session: UIDragSession) {
        handleDeck()
    }
    
    
}


extension ViewController: UIDropInteractionDelegate {
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self) && session.items.count == 1
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        let dropLocation = session.location(in: view)
        let operation: UIDropOperation
        if cardGrid00.frame.contains(dropLocation) {
            operation = session.localDragSession == nil ? .copy : .move
        }
//        } else if cardGrid01.frame.contains(dropLocation) {
//            operation = session.localDragSession == nil ? .copy : .move
//        } else if cardGrid02.frame.contains(dropLocation) {
//            operation = session.localDragSession == nil ? .copy : .move
//        } else if cardGrid03.frame.contains(dropLocation) {
//            operation = session.localDragSession == nil ? .copy : .move
//        } else if cardGrid10.frame.contains(dropLocation) {
//            operation = session.localDragSession == nil ? .copy : .move
//        } else if cardGrid11.frame.contains(dropLocation) {
//            operation = session.localDragSession == nil ? .copy : .move
//        } else if cardGrid12.frame.contains(dropLocation) {
//            operation = session.localDragSession == nil ? .copy : .move
//        } else if cardGrid13.frame.contains(dropLocation) {
//            operation = session.localDragSession == nil ? .copy : .move
//        } else if cardGrid30.frame.contains(dropLocation) {
//            operation = session.localDragSession == nil ? .copy : .move
//        } else if cardGrid21.frame.contains(dropLocation) {
//            operation = session.localDragSession == nil ? .copy : .move
        else {
            operation = .cancel
        }
        
        return UIDropProposal(operation: operation)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: UIImage.self) { imageItems in
            guard let images = imageItems as? [UIImage] else { return }
            self.cardGrid00.image = images.first
        }
    }
}
