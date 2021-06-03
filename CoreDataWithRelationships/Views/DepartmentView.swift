//
//  DepartmentView.swift
//  CoreDataWithRelationships
//
//  Created by Fred Javalera on 6/3/21.
//

import SwiftUI

struct DepartmentView: View {
  
  // MARK: Properties
  let entity: DepartmentEntity
  
  // MARK: Body
  var body: some View {
    
    VStack(alignment: .leading, spacing: 20, content: {
      
      Text("Name: \(entity.name ?? "")")
        .bold()
      
      if let businesses = entity.businesses?.allObjects as? [BusinessEntity] {
        
        Text("Businesses:")
          .bold()
        
        ForEach(businesses) {business in
          
          Text(business.name ?? "")
          
        }
        
      }
      
      if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
        
        Text("Employees:")
          .bold()
        
        ForEach(employees) {employee in
          
          Text(employee.name ?? "")
          
        }
        
      }
      
    })
    .padding()
    .frame(maxWidth: 300, alignment: .leading)
    .background(Color.green.opacity(0.5))
    .cornerRadius(10)
    .shadow(radius: 10)
    
  }
  
}

// MARK: Preview
struct DepartmentView_Previews: PreviewProvider {
  static var entity: DepartmentEntity = DepartmentEntity()
    static var previews: some View {
        DepartmentView(entity: entity)
    }
}
