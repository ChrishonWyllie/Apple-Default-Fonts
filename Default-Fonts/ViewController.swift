//
//  ViewController.swift
//  Default-Fonts
//
//  Created by Chrishon Wyllie on 3/30/17.
//  Copyright © 2017 Chrishon Wyllie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fontFamilyNames = [String]()
    
    var fontNames: [String]?
    
    var fonts = [String: [String]]()
    
    // Inititf
    var fontFamilyName: String?
    
    
    
    var chosenFont: String?
    
    @IBOutlet var familyNamePickerView: UIPickerView!
    
    
    @IBOutlet var fontNamePickerView: UIPickerView!
    
    @IBOutlet var textView: UITextView!
    
    
    
    
    
    
    @IBOutlet var showFont: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
        for name in UIFont.familyNames {
            
            fontFamilyNames.append(name)
            
            //print("family name: \(name)")
            if let nameString = name as? String {
                //print(UIFont.fontNames(forFamilyName: nameString))
                
                fontNames = UIFont.fontNames(forFamilyName: nameString)
                
                
                fonts[nameString] = fontNames
                
            }
        }
        
        
        
        fontFamilyName = fontFamilyNames[0]
        
        familyNamePickerView.delegate = self
        familyNamePickerView.dataSource = self
        fontNamePickerView.delegate = self
        fontNamePickerView.dataSource = self
        
        
        //print("all fontst \(fonts)")

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setToChosenFont(_ font: String) {
        
        self.textView.font = UIFont(name: font, size: 20)
        
    }
    

}



extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        
        if pickerView == familyNamePickerView {
            return fontFamilyNames.count
        } else {
            return fontNames!.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 70
    }

    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == familyNamePickerView {
            
            
            fontFamilyName = fontFamilyNames[row]
            
            fontNames = fonts[fontFamilyName!]
            
            fontNamePickerView.reloadAllComponents()
            
            //print(fontFamilyName)
            
            
        } else {
            
            // Unexpectedly causes an error for font names that contain no "children"
            guard let font = fontNames?[row] else { return }
            
            self.chosenFont = font
            
            setToChosenFont(chosenFont!)
            
            print("chosen font: \(String(describing: chosenFont))")
            
            
        }
    }
 
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
       
        
        if pickerView == familyNamePickerView {
            
            let fontnameForRow = fontFamilyNames[row]
            
            return fontnameForRow
            
        } else {
            
            let fontNamesForFamily = fonts[fontFamilyName!]
            
            //print("font names for family: \(String(describing: fonts[fontFamilyName!]))")
            
            //print(fontNamesForFamily?.count)
            
            let singleFontName = fontNamesForFamily?[row]
            
            return singleFontName
            
        }
        
    }
    
}

