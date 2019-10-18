//
//  ViewController.swift
//  MyPickerView
//
//  Created by maro on 29/09/2019.
//  Copyright © 2019 마현아. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var labelFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    let MAX_ARRAY_NUM = 5
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT: CGFloat = 80
    
    var imageArray: Array<UIImage?> = []
    var imageFlieName = [
        "p_img01.png", "p_img02.png", "p_img03.png",
        "p_img04.png", "p_img05.png"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<MAX_ARRAY_NUM {
            let image = UIImage(named: imageFlieName[i])
            imageArray.append(image)
        }
        
        self.labelFileName.text = imageFlieName[0]
        self.imageView.image = imageArray[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.imageFlieName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        return imageView
    }
    
    func pickerView(_ pickView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.labelFileName.text = self.imageFlieName[row]
        self.imageView.image = self.imageArray[row]
    }

}

