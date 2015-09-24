//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var shiftButton: UIButton!
    @IBOutlet var spaceButton: UIButton!
    @IBOutlet var backspaceButton: UIButton!
    @IBOutlet var returnButton: UIButton!
    //@IBOutlet var animalButtons: [UIButton]!
    @IBOutlet var mouseButton: UIButton!
    @IBOutlet var catButton: UIButton!
    @IBOutlet var dogButton: UIButton!
    @IBOutlet var pigButton: UIButton!
    @IBOutlet var cowButton: UIButton!
    @IBOutlet var bearButton: UIButton!
    @IBOutlet var horseButton: UIButton!
    @IBOutlet var fishButton: UIButton!
    @IBOutlet var snakeButton: UIButton!
    @IBOutlet var tigerButton: UIButton!
    
    var keyboardView: UIView!
    var shiftIsPressed: Bool = false;
    let arrayOfNoiseStrings: [String] = ["squeak", "meow", "woof", "oink", "moo", "go bears", "neigh", "glub", "hsss", "rawr"]
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode:", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
    }
    
    @IBAction func pressShift(sender: UIButton) {
        shiftIsPressed = !shiftIsPressed
        if shiftIsPressed {
            shiftButton.backgroundColor = UIColor.grayColor()
        } else {
            shiftButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        }
    }
    
    @IBAction func hitSpace(sender: UIButton) {
        (textDocumentProxy as UIKeyInput).insertText(" ")
        sender.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
    }
    
    @IBAction func hitReturn(sender: UIButton) {
        (textDocumentProxy as UIKeyInput).insertText("\n")
        sender.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
    }

    @IBAction func hitBackspace(sender: UIButton) {
        (textDocumentProxy as UIKeyInput).deleteBackward()
        sender.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
    }
    
    @IBAction func typeAnimalNoise(sender: UIButton) {
        if shiftIsPressed {
            (textDocumentProxy as UIKeyInput).insertText(arrayOfNoiseStrings[sender.tag].uppercaseString)
            pressShift(shiftButton)
        } else {
            (textDocumentProxy as UIKeyInput).insertText(arrayOfNoiseStrings[sender.tag])
        }
        sender.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
    }
    
    @IBAction func changeColorWhenPressed(sender: UIButton) {
        sender.backgroundColor = UIColor.grayColor()
    }

}
