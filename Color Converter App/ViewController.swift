//
//  ViewController.swift
//  Color Converter App
//
//  Created by Mouhamed Camara on 9/28/20.
//

import UIKit

class ViewController: UIViewController
{

    //MARK: Outlets
    
    @IBOutlet weak var redTextField: UITextField!
    
    @IBOutlet weak var greenTextField: UITextField!
    
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var alphaTextField: UITextField!
    
    @IBOutlet weak var convertionButton: UIButton!
    
    @IBOutlet weak var selectSegment: UISegmentedControl!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    //MARK: Actions
    
    @IBAction func selectSegmentAction(_ sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex
        {
            case 0:
                conversion = .hexToRGB
                convertionButton.setTitle("Convert Hex To RGB", for: .normal)
            case 1:
                conversion = .RGBToHex
                convertionButton.setTitle("Convert RGB To Hex", for: .normal)
            default:
                conversion = .hexToRGB
                convertionButton.setTitle("Convert Hex To RGB", for: .normal)
        }
        
        redTextField.text?.removeAll()
        greenTextField.text?.removeAll()
        blueTextField.text?.removeAll()
        alphaTextField.text?.removeAll()
    }
    
    @IBAction func convertAction(_ sender: UIButton)
    {
        switch conversion
        {
            case .hexToRGB:
                self.view.backgroundColor = convertHexToRGB()
            case .RGBToHex:
                self.view.backgroundColor = convertRGBToHex()
        }
    }
    
    
    //MARK: Properties
    var conversion: Conversion = .hexToRGB
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        setup()
    }
    
    //MARK: Enum
    
    enum Conversion
    {
        case hexToRGB
        case RGBToHex
    }
    
    //MARK: Functions
    
    private func setup()
    {
        selectSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        
        selectSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        
        selectSegment.layer.borderColor = UIColor.black.cgColor
        selectSegment.layer.borderWidth = 0.8
        

    }
    
    func convertHexToRGB() -> UIColor?
    {
        guard let redText = UInt8(redTextField.text!, radix: 16)  else { return nil }
        
        guard let greenText = UInt8(greenTextField.text!, radix: 16) else { return nil }
        
        guard let blueText = UInt8(blueTextField.text!, radix: 16) else { return nil }
        
        guard let alphaText = Float(alphaTextField.text!) else { return nil }
        
        if alphaText > 1 || alphaText < 0
        {
            return nil
        }
        
        print("Text entered: \(redText), \(greenText), \(blueText), \(alphaText)")
        
        resultLabel.text = "Red: \(redText)\nGreen: \(greenText)\nBlue: \(blueText)\nAlpha: \(alphaText) "
        
        
        let theColor = UIColor(red: CGFloat(redText)/255, green: CGFloat(greenText)/255, blue: CGFloat(blueText)/255, alpha: CGFloat(alphaText))
        
        return theColor
    }
    
    func convertRGBToHex()-> UIColor?
    {
        guard let redText = UInt8(redTextField.text!)  else { return nil }
        
        guard let greenText = UInt8(greenTextField.text!) else { return nil }
        
        guard let blueText = UInt8(blueTextField.text!) else { return nil }
        
        guard let alphaText = Float(alphaTextField.text!) else { return nil }
        
        if alphaText > 1 || alphaText < 0
        {
            return nil
        }
        
        let redString = String(format: "%2X", redText)
        let greenString = String(format: "%2X", greenText)
        let blueString = String(format: "%2X", blueText)
        
        print("Text entered: \(redText), \(greenText), \(blueText), \(alphaText)")
        
        resultLabel.text = "Hex code: #\(redString)\(greenString)\(blueString)\nAlpha: \(alphaText) "
        
        
        let theColor = UIColor(red: CGFloat(redText)/255, green: CGFloat(greenText)/255, blue: CGFloat(blueText)/255, alpha: CGFloat(alphaText))
        
        return theColor
    }


}

