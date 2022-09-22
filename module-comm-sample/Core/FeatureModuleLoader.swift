//
//  FeatureModuleLoader.swift
//  ModuleA
//
//  Created by VI_Business on 28.08.22.
//

import Foundation
@_implementationOnly import ModuleB
@_implementationOnly import ModuleA

class FeatureModuleLoader {
    enum FeatureFrameworks: String, CaseIterable {
        case moduleA = "ModuleA.framework"
        case moduleB = "ModuleB.framework"
    }
    
    func loadModules() {
        let searchPath = Bundle.main.privateFrameworksURL
        
        FeatureFrameworks.allCases.forEach { fw in
            let path = searchPath?.appendingPathComponent(fw.rawValue)
            if (FileManager.default.fileExists(atPath: path!.path)) {
                loadModule(fw)
            }
        }
    }
    
    func loadModule(_ fw: FeatureFrameworks) {
        switch fw {
        case .moduleA:
            ModuleAInitialiser.initModule()
        case .moduleB:
            ModuleBInitialiser.initModule()
        }
    }
}
