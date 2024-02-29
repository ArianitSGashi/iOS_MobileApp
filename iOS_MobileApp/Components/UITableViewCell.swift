import UIKit
import SwiftUI

class SwiftUIHostingCell: UITableViewCell {
    private var hostController: UIHostingController<AnyView>?
    
    func host<Content: View>(_ view: Content) {
        
        let hostController = UIHostingController(rootView: AnyView(view))
        
        hostController.view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(hostController.view)
        
        NSLayoutConstraint.activate([
            hostController.view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            hostController.view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            hostController.view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            hostController.view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
        
        self.hostController = hostController
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        hostController?.view.removeFromSuperview()
        hostController = nil
    }
}

