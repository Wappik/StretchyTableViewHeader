import UIKit


final class ScretchyTableHeaderView: UIView {
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var imageViewHeight = NSLayoutConstraint()
    private var imageViewBottom = NSLayoutConstraint()
    private var conteinerView = UIView()
    private var conteinerViewHeight = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
        setViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createViews() {
        addSubview(conteinerView)
        conteinerView.addSubview(imageView)
    }
    
    func setViewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: conteinerView.widthAnchor),
            centerXAnchor.constraint(equalTo: conteinerView.centerXAnchor),
            heightAnchor.constraint(equalTo: conteinerView.heightAnchor)
        ])
        
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        
        conteinerView.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        conteinerViewHeight = conteinerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        conteinerViewHeight.isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewBottom = imageView.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor)
        imageViewBottom.isActive = true
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: conteinerView.heightAnchor)
        imageViewHeight.isActive = true
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        conteinerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        conteinerView.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = (offsetY >= 0) ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
