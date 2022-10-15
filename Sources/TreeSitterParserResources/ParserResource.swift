import Foundation
import TreeSitterParsers

public enum ParserResource: CaseIterable, Hashable, Sendable, Codable {
	case bash
	case c
	case cpp
	case cSharp
	case css
	case elixir
	case go
	case goMod
	case goWork
	case haskell
	case html
	case java
	case javaScript
	case json
	case julia
	case lua
	case markdown
	case markdownInline
	case perl
	case php
	case python
	case ruby
	case rust
	case sql
	case swift
	case treeSitterQuery
	case yaml
	case zig

	public var name: String {
		switch self {
		case .bash:
			return "Bash"
		case .c:
			return "C"
		case .cpp:
			return "C++"
		case .cSharp:
			return "C#"
		case .css:
			return "CSS"
		case .elixir:
			return "Elixir"
		case .go:
			return "Go"
		case .goMod:
			return "GoMod"
		case .goWork:
			return "GoWork"
		case .haskell:
			return "Haskell"
		case .html:
			return "HTML"
		case .java:
			return "Java"
		case .javaScript:
			return "JavaScript"
		case .json:
			return "JSON"
		case .julia:
			return "Julia"
		case .lua:
			return "Lua"
		case .markdown:
			return "Markdown"
		case .markdownInline:
			return "MarkdownInline"
		case .perl:
			return "Perl"
		case .php:
			return "PHP"
		case .python:
			return "Python"
		case .ruby:
			return "Ruby"
		case .rust:
			return "Rust"
		case .sql:
			return "SQL"
		case .swift:
			return "Swift"
		case .treeSitterQuery:
			return "Query"
		case .yaml:
			return "YAML"
		case .zig:
			return "Zig"
		}
	}
}

extension ParserResource {
    var queryDirectoryName: String {
		switch self {
		case .cpp:
			return "cpp"
		default:
			return name.lowercased()
		}
    }

    public var parser: OpaquePointer {
        switch self {
		case .bash:
			return OpaquePointer(tree_sitter_bash())
		case .c:
			return OpaquePointer(tree_sitter_c())
		case .cpp:
			return OpaquePointer(tree_sitter_cpp())
		case .cSharp:
			return OpaquePointer(tree_sitter_c_sharp())
		case .css:
			return OpaquePointer(tree_sitter_css())
		case .elixir:
			return OpaquePointer(tree_sitter_elixir())
		case .go:
			return OpaquePointer(tree_sitter_go())
		case .goMod:
			return OpaquePointer(tree_sitter_gomod())
		case .goWork:
			return OpaquePointer(tree_sitter_gowork())
		case .haskell:
			return OpaquePointer(tree_sitter_haskell())
		case .html:
			return OpaquePointer(tree_sitter_html())
		case .java:
			return OpaquePointer(tree_sitter_java())
		case .javaScript:
			return OpaquePointer(tree_sitter_javascript())
		case .json:
			return OpaquePointer(tree_sitter_json())
		case .julia:
			return OpaquePointer(tree_sitter_julia())
		case .lua:
			return OpaquePointer(tree_sitter_lua())
		case .markdown:
			return OpaquePointer(tree_sitter_markdown())
		case .markdownInline:
			return OpaquePointer(tree_sitter_markdown_inline())
		case .perl:
			return OpaquePointer(tree_sitter_perl())
		case .php:
			return OpaquePointer(tree_sitter_php())
		case .python:
			return OpaquePointer(tree_sitter_python())
		case .ruby:
			return OpaquePointer(tree_sitter_ruby())
		case .rust:
			return OpaquePointer(tree_sitter_rust())
		case .sql:
			return OpaquePointer(tree_sitter_sql())
		case .swift:
			return OpaquePointer(tree_sitter_swift())
		case .treeSitterQuery:
			return OpaquePointer(tree_sitter_query())
		case .yaml:
			return OpaquePointer(tree_sitter_yaml())
		case .zig:
			return OpaquePointer(tree_sitter_zig())
		}
    }

    public func scmFileURL(named name: String) -> URL? {
        return Bundle.module.url(forResource: name,
                                 withExtension: "scm",
                                 subdirectory: "ParserResources/\(queryDirectoryName)")
    }

    public var highlightsQueryURL: URL? {
        return scmFileURL(named: "highlights")
    }

	public var injectionsQueryURL: URL? {
		return scmFileURL(named: "injections")
	}

    public var localsQueryURL: URL? {
        return scmFileURL(named: "locals")
    }
}
