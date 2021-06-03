//
//  BusinessView.swift
//  CoreDataWithRelationships
//
//  Created by Fred Javalera on 6/3/21.
//

import SwiftUI

struct BusinessView: View {
  
  let entity: BusinessEntity
  
  var body: some View {
    
    VStack(alignment: .leading, spacing: 20, content: {
      
      Text("Name: \(entity.name ?? "")")
        .bold()
      
      if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
        
        Text("Departments:")
          .bold()
        
        ForEach(departments) {department in
          
          Text(department.name ?? "")
          
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
    .background(Color.gray.opacity(0.5))
    .cornerRadius(10)
    .shadow(radius: 10)
    
  }
  
}

struct BusinessView_Previews: PreviewProvider {
  static var entity: BusinessEntity = BusinessEntity()
  static var previews: some View {
    BusinessView(entity: entity)
  }
}
