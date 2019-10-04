//
//  Sample.swift
//  Leetcode
//
//  Created by 陈欢 on 2019/10/3.
//  Copyright © 2019 Matcha00. All rights reserved.
//

import UIKit
import Highlightr
var textView : UITextView!
var highlightr : Highlightr!
let textStorage = CodeAttributedString()
class Sample:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.backgroundColor = UIColor.white
        textStorage.language = "htmlbars".lowercased()
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        
        let textContainer = NSTextContainer(size: view.bounds.size)
        layoutManager.addTextContainer(textContainer)
        
        textView = UITextView(frame: self.view.bounds, textContainer: textContainer)
        textView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        textView.autocorrectionType = UITextAutocorrectionType.no
        textView.autocapitalizationType = UITextAutocapitalizationType.none
        textView.textColor = UIColor(white: 0.8, alpha: 1.0)
//        textView.inputAccessoryView = textToolbar
//        viewPlaceholder.addSubview(textView)
        self.view.addSubview(textView)
        
//        let code = try! String.init(contentsOfFile: Bundle.main.path(forResource: "sampleCode", ofType: "txt")!)
        textView.text = "<html></html>";
        
        highlightr = textStorage.highlightr
        
        textStorage.highlightr.setTheme(to: "nord".lowercased())
    }
    
    func updateColors()
    {
        textView.backgroundColor = highlightr.theme.themeBackgroundColor
    }
    
    func invertColor(_ color: UIColor) -> UIColor
    {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: nil)
        return UIColor(red:1.0-r, green: 1.0-g, blue: 1.0-b, alpha: 1)
    }
}
