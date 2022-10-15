#!/usr/bin/env sh

set -euxo pipefail

# xargs trims whitespace
BUILD_DIR=`xcodebuild -project TreeSitterParsers.xcodeproj -showBuildSettings 2>/dev/null | grep "    BUILD_DIR =" | cut -d "=" -f 2 | xargs`

CHECKOUTS_PATH="$BUILD_DIR/../../SourcePackages/checkouts"
RESOURCES_PATH="Sources/TreeSitterParserResources/ParserResources"

chmod -R +w $RESOURCES_PATH

cp -r "$CHECKOUTS_PATH/tree-sitter-bash/queries/" "$RESOURCES_PATH/Bash/"
cp -r "$CHECKOUTS_PATH/tree-sitter-c/queries/" "$RESOURCES_PATH/C/"
cp -r "$CHECKOUTS_PATH/tree-sitter-cpp/queries/" "$RESOURCES_PATH/CPP/"
cp -r "$CHECKOUTS_PATH/tree-sitter-c-sharp/queries/" "$RESOURCES_PATH/C-Sharp/"
cp -r "$CHECKOUTS_PATH/tree-sitter-css/queries/" "$RESOURCES_PATH/CSS/"
cp -r "$CHECKOUTS_PATH/tree-sitter-elixir/queries/" "$RESOURCES_PATH/Elixir/"
cp -r "$CHECKOUTS_PATH/tree-sitter-go/queries/" "$RESOURCES_PATH/Go/"
cp -r "$CHECKOUTS_PATH/tree-sitter-go-mod/queries/" "$RESOURCES_PATH/GoMod/"
cp -r "$CHECKOUTS_PATH/tree-sitter-go-work/queries/" "$RESOURCES_PATH/GoWork/"
cp -r "$CHECKOUTS_PATH/tree-sitter-haskell/queries/"*.scm "$RESOURCES_PATH/Haskell/"
cp -r "$CHECKOUTS_PATH/tree-sitter-html/queries/" "$RESOURCES_PATH/HTML/"
cp -r "$CHECKOUTS_PATH/tree-sitter-java/queries/" "$RESOURCES_PATH/Java/"
cp -r "$CHECKOUTS_PATH/tree-sitter-javascript/queries/" "$RESOURCES_PATH/JavaScript/"
cp -r "$CHECKOUTS_PATH/tree-sitter-json/queries/" "$RESOURCES_PATH/JSON/"
#cp -r "$CHECKOUTS_PATH/tree-sitter-julia/queries/" "$RESOURCES_PATH/Julia/"
#cp -r "$CHECKOUTS_PATH/tree-sitter-lua/queries/" "$RESOURCES_PATH/Lua/"
cp -r "$CHECKOUTS_PATH/tree-sitter-markdown/tree-sitter-markdown/queries/" "$RESOURCES_PATH/Markdown/"
cp -r "$CHECKOUTS_PATH/tree-sitter-markdown/tree-sitter-markdown-inline/queries/" "$RESOURCES_PATH/MarkdownInline/"
#cp -r "$CHECKOUTS_PATH/tree-sitter-perl/queries/"* "$RESOURCES_PATH/Perl/"
cp -r "$CHECKOUTS_PATH/tree-sitter-php/queries/" "$RESOURCES_PATH/PHP/"
cp -r "$CHECKOUTS_PATH/tree-sitter-python/queries/" "$RESOURCES_PATH/Python/"
#cp -r "$CHECKOUTS_PATH/tree-sitter-query/queries/" "$RESOURCES_PATH/Query/"
cp -r "$CHECKOUTS_PATH/tree-sitter-ruby/queries/" "$RESOURCES_PATH/Ruby/"
cp -r "$CHECKOUTS_PATH/tree-sitter-rust/queries/" "$RESOURCES_PATH/Rust/"
#cp -r "$CHECKOUTS_PATH/tree-sitter-sql/queries/" "$RESOURCES_PATH/SQL/"
cp -r "$CHECKOUTS_PATH/tree-sitter-swift/queries/" "$RESOURCES_PATH/Swift/"
#cp -r "$CHECKOUTS_PATH/tree-sitter-yaml/queries/" "$RESOURCES_PATH/YAML/"
cp -r "$CHECKOUTS_PATH/tree-sitter-zig/queries/" "$RESOURCES_PATH/Zig/"

xcodebuild -scheme TreeSitterParsers -destination "platform=macOS" -configuration Release build

FRAMEWORK_PATH="$BUILD_DIR/Release/TreeSitterParsers.framework"

rm -rf TreeSitterParsers.xcframework
rm -rf TreeSitterParsers.xcframework.zip
xcodebuild -create-xcframework -framework "$FRAMEWORK_PATH" -output TreeSitterParsers.xcframework

zip -r TreeSitterParsers.xcframework.zip TreeSitterParsers.xcframework

rm -rf TreeSitterParsers.xcframework
