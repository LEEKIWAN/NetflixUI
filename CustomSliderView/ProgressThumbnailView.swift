//
//  ProgressThumbnailView.swift
//  CustomSliderView
//
//  Created by kiwan on 2020/05/29.
//  Copyright © 2020 kiwan. All rights reserved.
//

import UIKit
import SnapKit
class ProgressThumbnailView: UIView {
    
    var isShown: Bool = false {
        didSet {
            self.setShown(isShown)
        }
    }
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    //MARK: - Func
    override init(frame: CGRect) {
        super.init(frame: frame)
        setNib()
        setEvent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setNib()
        setEvent()
    }
    
    private func setNib() {
        let view = Bundle.main.loadNibNamed("ProgressThumbnailView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    private func setEvent() {
        
    }
    
    private func setShown(_ shown: Bool) {
        shown ? show() : hide()
    }
    
    private func show() {
        guard let vc = parentViewController as? ViewController else { return }
        
        UIView.animate(withDuration: 0.1) {
            vc.consWidth.constant = 200
            vc.consBottomMargin.constant = 20
            
            vc.thumbnailView.alpha = 1
            vc.view.layoutIfNeeded()
        }
    }
    
    private func hide() {
        guard let vc = parentViewController as? ViewController else { return }
        vc.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.1) {
            vc.consWidth.constant = 100
            vc.consBottomMargin.constant = 0
            
            vc.thumbnailView.alpha = 0
            
            vc.view.layoutIfNeeded()
            
        }
    }
    
    
    func setThumbnail(image: UIImage? = nil, time: String) {
        if image != nil {
            thumbnailImageView.image = image
            thumbnailImageView.isHidden = false
        }
        else {
            thumbnailImageView.isHidden = true
        }
        
        
        currentTimeLabel.text = time
    }
    

}
