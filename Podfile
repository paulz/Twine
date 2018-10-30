platform :ios, '12.0'

def bdd_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'SwiftEmail' do
    use_frameworks!

    target 'UnitSpecs' do
        inherit! :search_paths
        bdd_pods
    end
end

target 'EmailClient' do
  use_frameworks!

  target 'AppSpecs' do
    inherit! :search_paths
    bdd_pods
  end

  target 'UITests' do
    inherit! :search_paths
    bdd_pods
  end
end

# Fix Xcode 10 unable to start tests:
# Library not loaded: @rpath/libswiftSwiftOnoneSupport.dylib
#
# The bundle <test bundle name> couldn't be loaded because it is damaged or missing necessary resources. Try reinstalling the bundle.
# (dlopen_preflight(.../Debug-iphonesimulator/UnitSpecs.xctest/UnitSpecs): Library not loaded: @rpath/libswiftSwiftOnoneSupport.dylib
#   Referenced from: .../Debug-iphonesimulator/UnitSpecs.xctest/Frameworks/Nimble.framework/Nimble
#   Reason: image not found)
# Error Domain=IDETestOperationsObserverErrorDomain Code=5 "Test session exited(82) without checking in. Executable cannot be loaded for some other reason, such as a problem with a library it depends on or a code signature/entitlements mismatch. Retry after a Clean build." UserInfo={NSLocalizedDescription=Test session exited(82) without checking in. Executable cannot be loaded for some other reason, such as a problem with a library it depends on or a code signature/entitlements mismatch. Retry after a Clean build.

def reset_optimization(target)
    target.build_configurations.each do |config|
        if config.name == 'Debug'
            config.build_settings.delete('SWIFT_OPTIMIZATION_LEVEL')
        end
    end
end

post_install do |installer|
    reset_optimization(installer.pods_project)
    installer.pods_project.targets.each do |target|
        reset_optimization(target)
    end
end
