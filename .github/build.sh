curl -Ls https://install.tuist.io | bash
tuist install 3.21.1
tuist fetch
tuist generate
xcodebuild clean -quiet
xcodebuild build-for-testing\
    -workspace 'Sandbox.xcworkspace' \
    -scheme 'Sandbox' \
    -destination 'platform=iOS Simulator,name=iPhone 14 Pro'
