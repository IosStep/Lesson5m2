import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class LabelWithButton: UIView {
    
    let label: UILabel = {
       let label = UILabel()
        label.text = "Some text"
        label.textColor = .black
        return label
    }()

    
    let button: UIButton = {
       let button = UIButton()
        button.setTitle("some title", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label)
        self.addSubview(button)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(8)
            make.centerX.equalTo(label)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
