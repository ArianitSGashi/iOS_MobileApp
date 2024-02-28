import UIKit
import SwiftUI

class SwiftUIHostingCell: UITableViewCell {
    private var hostController: UIHostingController<AnyView>?

    func host<Content: View>(_ view: Content) {
        let hostController = UIHostingController(rootView: AnyView(view))
        // Ensure the host controller's view fully occupies the cell.
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
        // Remove the hosted SwiftUI view to prepare the cell for reuse.
        hostController?.view.removeFromSuperview()
        hostController = nil
    }
}

