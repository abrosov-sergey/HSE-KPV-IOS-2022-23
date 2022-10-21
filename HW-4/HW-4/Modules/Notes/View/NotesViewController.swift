import UIKit

final class NotesViewController: UIViewController {
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .systemGray
        tableView.dataSource = self
        return tableView
    }()
    
    private var mainArrayNotes: [SavedNotes] = {
        var arrayNotes = []
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension NotesViewController {
    private func configUI() {
        view = mainTableView
    }
}

// MARK: - DataSource

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1: return 1
        case 2: return
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
