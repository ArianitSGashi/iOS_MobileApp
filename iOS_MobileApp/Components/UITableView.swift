import SwiftUI
import UIKit

struct TableViewWrapper: UIViewRepresentable {
    @EnvironmentObject var cartManager: CartManager
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(SwiftUIHostingCell.self, forCellReuseIdentifier: "HostingCell")
        tableView.dataSource = context.coordinator
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        uiView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITableViewDataSource {
        var parent: TableViewWrapper
        
        init(_ tableViewWrapper: TableViewWrapper) {
            self.parent = tableViewWrapper
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return parent.cartManager.products.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HostingCell", for: indexPath) as? SwiftUIHostingCell else {
                return UITableViewCell()
            }
            
            let product = parent.cartManager.products[indexPath.row]
            cell.host(ProductRow(product: product).environmentObject(parent.cartManager))
            
            return cell
        }
        
    }
}
