function Update-Nuget {
    param([string]$nugetPackage, [string]$bowerPackage)
        
    rm $nugetPackage/content/Scripts/Polymer/$bowerPackage -Recurse -Force
    cp bower_components/$bowerPackage $nugetPackage/content/Scripts/Polymer/ -Recurse -Force
}

function Update-Platform() {
    Update-Nuget "polymer-platform" "platform"
}

function Update-Polymer-Cyclic() {
    Update-Nuget "polymer-cyclic" "polymer"
}

function Update-Polymer() {
    # Do nothing since this everything in polymer-ciclic
}

function Update-Polymer-Core-Component-Page() {
    Update-Nuget "polymer-core-component-page" "core-component-page"
}

function Update-Polymer-Core-Elements() {
    Update-Nuget "polymer-core-elements" "context-free-parser"
    Update-Nuget "polymer-core-elements" "core-ajax"
    Update-Nuget "polymer-core-elements" "core-animated-pages"
    Update-Nuget "polymer-core-elements" "core-animation"
    Update-Nuget "polymer-core-elements" "core-collapse"
    Update-Nuget "polymer-core-elements" "core-doc-viewer"
    Update-Nuget "polymer-core-elements" "core-docs"
    Update-Nuget "polymer-core-elements" "core-drag-drop"
    Update-Nuget "polymer-core-elements" "core-drawer-panel"
    Update-Nuget "polymer-core-elements" "core-dropdown"
    Update-Nuget "polymer-core-elements" "core-dropdown-menu"
    Update-Nuget "polymer-core-elements" "core-elements"
    Update-Nuget "polymer-core-elements" "core-field"
    Update-Nuget "polymer-core-elements" "core-header-panel"
    Update-Nuget "polymer-core-elements" "core-icon"
    Update-Nuget "polymer-core-elements" "core-icon-button"
    Update-Nuget "polymer-core-elements" "core-icons"
    Update-Nuget "polymer-core-elements" "core-iconset"
    Update-Nuget "polymer-core-elements" "core-iconset-svg"
    Update-Nuget "polymer-core-elements" "core-input"
    Update-Nuget "polymer-core-elements" "core-item"
    Update-Nuget "polymer-core-elements" "core-layout-grid"
    Update-Nuget "polymer-core-elements" "core-layout-trbl"
    Update-Nuget "polymer-core-elements" "core-list"
    Update-Nuget "polymer-core-elements" "core-localstorage"
    Update-Nuget "polymer-core-elements" "core-media-query"
    Update-Nuget "polymer-core-elements" "core-menu"
    Update-Nuget "polymer-core-elements" "core-menu-button"
    Update-Nuget "polymer-core-elements" "core-meta"
    Update-Nuget "polymer-core-elements" "core-overlay"
    Update-Nuget "polymer-core-elements" "core-pages"
    Update-Nuget "polymer-core-elements" "core-range"
    Update-Nuget "polymer-core-elements" "core-scaffold"
    Update-Nuget "polymer-core-elements" "core-scroll-header-panel"
    Update-Nuget "polymer-core-elements" "core-selection"
    Update-Nuget "polymer-core-elements" "core-selector"
    Update-Nuget "polymer-core-elements" "core-shared-lib"
    Update-Nuget "polymer-core-elements" "core-signals"
    Update-Nuget "polymer-core-elements" "core-splitter"
    Update-Nuget "polymer-core-elements" "core-tests"               # Probably have to remove that.
    Update-Nuget "polymer-core-elements" "core-toolbar"
    Update-Nuget "polymer-core-elements" "core-tooltip"
    Update-Nuget "polymer-core-elements" "core-transition"
    Update-Nuget "polymer-core-elements" "font-roboto"
    Update-Nuget "polymer-core-elements" "google-code-prettify"
    Update-Nuget "polymer-core-elements" "marked"
    Update-Nuget "polymer-core-elements" "marked-element"
    Update-Nuget "polymer-core-elements" "paper-button"
    Update-Nuget "polymer-core-elements" "paper-fab"
    Update-Nuget "polymer-core-elements" "paper-focusable"
    Update-Nuget "polymer-core-elements" "paper-icon-button"
    Update-Nuget "polymer-core-elements" "paper-ripple"
    Update-Nuget "polymer-core-elements" "paper-shadow"
    Update-Nuget "polymer-core-elements" "polymer-test-tools"       # Probably have to remove that.
    Update-Nuget "polymer-core-elements" "prettify-element"
    Update-Nuget "polymer-core-elements" "sampler-scaffold"
    Update-Nuget "polymer-core-elements" "web-animations-js"
    rm polymer-core-elements/content/Scripts/Polymer/web-animations-js/node_modules -Recurse -Force
}

function Update-Paper-Elements() {
    $package = "paper-elements"
    Update-Nuget $package "core-a11y-keys"
    Update-Nuget $package "paper-checkbox"
    Update-Nuget $package "paper-dialog"
    Update-Nuget $package "paper-dropdown-menu"
    Update-Nuget $package "paper-elements"
    Update-Nuget $package "paper-input"
    Update-Nuget $package "paper-item"
    Update-Nuget $package "paper-menu-button"
    Update-Nuget $package "paper-progress"
    Update-Nuget $package "paper-radio-button"
    Update-Nuget $package "paper-radio-group"
    Update-Nuget $package "paper-slider"
    Update-Nuget $package "paper-tabs"
    Update-Nuget $package "paper-toast"
    Update-Nuget $package "paper-toggle-button"
}

Update-Platform
Update-Polymer-Cyclic
Update-Polymer
Update-Polymer-Core-Component-Page
Update-Polymer-Core-Elements
Update-Paper-Elements