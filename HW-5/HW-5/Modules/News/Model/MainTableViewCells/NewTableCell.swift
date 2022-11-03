import UIKit

class NewTableCell: UITableViewCell {

    private var newsLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textColor     = .black
        label.font          = UIFont(name: "", size: 20)
        
        return label
    }()
    
    private var newsImage: UIImageView = {
        let image = UIImageView()
        
        image.layer.cornerRadius = 10
        image.clipsToBounds      = true
        
        return image
    }()
    
    private var textField: UITextField = {
        let textField = UITextField()
        
        textField.textColor = .systemGray2
        textField.font      = UIFont(name: "", size: 15)
        
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(new: New) {
        newsImage.image = new.image
        newsLabel.text = new.title
        textField.text = new.text
    }
    
    private func setupUI() {
        
        makeConstraints()
        
    }
}

extension NewTableCell {
    private func makeConstraints() {
        addSubview(newsLabel)
        addSubview(newsImage)
        addSubview(textField)
        
        // MARK: - newsLabel
        
        newsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(120)
        }
        
        // MARK: - newsImage
        
        newsImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(12)
            make.height.equalTo(150)
            make.width.equalTo(100)
        }
        
        // MARK: - textField
        
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(120)
            make.trailing.lessThanOrEqualTo(-20)
        }
    }
}
