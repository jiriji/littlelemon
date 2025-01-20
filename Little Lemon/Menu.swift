import SwiftUI
import CoreData

struct Menu: View {
    
    @State var searchText: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    static func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString.localizedStandardCompare)
            )
        ]
    }
    
    func buildPredicate() -> NSPredicate {
            if searchText.isEmpty {
                return NSPredicate(value: true)
            } else {
                return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
            }
        }
    
    func getMenuData() {
        let context = viewContext
        PersistenceController.shared.clear()
        let menuAdress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        guard let url = URL(string: menuAdress) else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                if let menuList = try? decoder.decode(MenuList.self, from: data) {
                    DispatchQueue.main.async {
                        for item in menuList.menu {
                            let dish = Dish(context: context)
                            dish.title = item.title
                            dish.image = item.image
                            dish.price = item.price
                        }
                        do {
                            try context.save()
                        } catch {
                            print("Error saving data: \(error)")
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Little Lemon")
                .font(.title)
            Text("Chicago")
                .font(.title)
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
            TextField("Search menu", text: $searchText)
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: Menu.buildSortDescriptors()
            ) { (dishes: [Dish]) in
                List {
                    ForEach(dishes, id: \.self) { dish in
                        HStack {
                            Text("\(dish.title ?? "") - \(dish.price ?? "")$")
                                .font(.headline)
                            Spacer()
                            if let imageUrl = dish.image, let url = URL(string: imageUrl) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                }
            }
        }
            .onAppear {
                getMenuData()
            }
    }
}


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
