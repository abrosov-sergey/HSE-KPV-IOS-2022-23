import UIKit

class ViewController: UIViewController {
    
    var mainView: VieViewController = VieViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        mainView.frame = self.view.bounds
        view.addSubview(mainView)
    }
    
}

