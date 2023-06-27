require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platforms    = { :ios => "9.0", :osx => "10.13" }

  s.source       = { :git => "https://github.com/clowenhg/react-native-ios-smartconfig.git", :tag => "v#{s.version}" }

  s.source_files    = "ios/**/*.{h,m,mm,swift}"

  s.dependency "React-Core"

  if ENV['RCT_NEW_ARCH_ENABLED'] == '1' then
    s.compiler_flags = folly_compiler_flags + " -DRCT_NEW_ARCH_ENABLED=1"
    s.pod_target_xcconfig    = {
    }

    # s.dependency "React-RCTFabric"
    # s.dependency "React-Codegen"
    # s.dependency "RCT-Folly"
    # s.dependency "RCTRequired"
    # s.dependency "RCTTypeSafety"
    # s.dependency "ReactCommon/turbomodule/core"
  end
end
