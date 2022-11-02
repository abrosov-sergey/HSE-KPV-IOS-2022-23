import Foundation
import UIKit

struct NewInfo {
    private var newsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private var newsImage: UIImage = {
        let image = UIImage()
        return image
    }()
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .systemGray
        return textField
    }()
    
    init(newsLabel: UILabel, newsImage: UIImage, textField: UITextField) {
        self.newsLabel = newsLabel
        self.newsImage = newsImage
        self.textField = textField
    }
}
