platform :ios, '9.0'
use_frameworks!

def shared_pods
  pod 'Firebase'
  pod 'Firebase/Database'
  pod 'Firebase/Auth'
  pod 'Firebase/Storage'
  pod 'Kingfisher', :git => 'https://github.com/onevcat/Kingfisher.git', :tag => '3.1.1'
  pod 'DateTools'
end

target 'Umalahokan' do
  shared_pods
end

target 'UmalahokanTests' do
  inherit! :search_paths
end

target 'UmalahokanUITests' do
  inherit! :search_paths
end
