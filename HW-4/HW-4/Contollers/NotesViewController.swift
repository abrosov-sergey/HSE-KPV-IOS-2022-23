import UIKit

final class NotesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupView()
    }
    
    private func setupView() {
        setupNavBar()
    }
    
    private func setupNavBar() {
        self.title = "Notes"
    }
}

extension NotesViewController {
    
}
