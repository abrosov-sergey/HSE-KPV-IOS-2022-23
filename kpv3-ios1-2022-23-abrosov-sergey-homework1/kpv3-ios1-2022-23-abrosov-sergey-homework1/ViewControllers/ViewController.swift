import UIKit

class ViewController: UIViewController {
    
    var mainView: VieViewController = VieViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.frame = view.bounds
        view.addSubview(mainView)
        mainView.backgroundColor = .systemGreen
        
        mainView.creatingInterfaceElements()
        mainView.addParametersForElements()
        mainView.addConnectForElements()
        mainView.addElementsToView()
        mainView.addConstraintsForElements()
    }
    
}

