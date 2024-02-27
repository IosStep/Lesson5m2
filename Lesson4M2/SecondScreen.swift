import UIKit

class SecondScreen: UIViewController {
    
    let button: CustomButton = {
       let button = CustomButton()
        button.setTitle("some Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    lazy var someView = LabelWithButton()
    lazy var secondView = LabelWithButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(someView)
        view.addSubview(secondView)
        someView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(90)
        }
        
        secondView.snp.makeConstraints { make in
            make.top.equalTo(someView.snp.bottom)
            make.centerX.equalTo(someView)
            make.height.equalTo(90)

        }

        // Do any additional setup after loading the view.
    }
    
}
