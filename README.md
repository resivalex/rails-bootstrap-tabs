# Rails Bootstrap Tabs

## Installation

Add it to your Gemfile:

```ruby
gem 'rails-bootstrap-tabs'
```

Take care about existing Bootstrap styles and JavaScript. It's **only** convient **HTML helper**

## Examples

*.slim
```slim
= tabs do |c|
  - c.tab 'Tab 1'
    span Tab content 1
  - c.tab 'Tab 2'
    span Tab content 2
```
or *.erb
```erb
<%= tabs do |c| %>
  <% c.tab 'Tab 1' do %>
    <span>Tab content 1</span>
  <% end %>
  <% c.tab 'Tab 2' do %>
    <span>Tab content 2</span>
  <% end %>
<% end %>
```
expands to
```html
<ul class="nav nav-tabs">
  <li class="active">
    <a data-toggle="tab" href="#tab-0-wtytpktm">Tab 1</a>
  </li>
  <li>
    <a data-toggle="tab" href="#tab-1-eesnydho">Tab 2</a>
  </li>
</ul>
<div class="tab-content">
  <div id="tab-0-wtytpktm" class="tab-pane active">
    <span>Tab content 1</span>
  </div>
  <div id="tab-1-eesnydho" class="tab-pane">
    <span>Tab content 2</span>
  </div>
</div>
```
This
```slim
= tabs content_class: 'my-padding' do |c|
  - c.tab 'Profile', anchor: 'profile'
    span Hello, user!
  - c.tab 'New feature', anchor: 'new', active: true
    button Click!
```
expands to
```html
<ul class="nav nav-tabs">
  <li class="active">
    <a data-toggle="tab" href="#profile">Profile</a>
  </li>
  <li class="">
    <a data-toggle="tab" href="#new">New feature</a>
  </li>
</ul>
<div class="tab-content my-padding">
  <div id="profile" class="tab-pane active">
    <span>Hello, user!</span>
  </div>
  <div id="new" class="tab-pane">
    <button>Click!</button>
  </div>
</div>
```

## Bootstrap 4

Default bootstrap version is 3. To use bootstrap 4 tabs add file to initializers

```ruby
# config/initializers/rails_bootstrap_tabs.rb

RailsBootstrapTabs.bootstrap_version = 4
```

```slim
= tabs content_class: 'my-padding', fade_effect: true do |c|
  - c.tab 'Profile', anchor: 'profile'
    span Hello, user!
  - c.tab 'New feature', anchor: 'new', active: true
    button Click!
```
expands to
```html
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a data-toggle="tab" class="nav-link" href="#profile">Profile</a>
  </li>
  <li class="nav-item">
    <a data-toggle="tab" class="nav-link active" href="#new">New feature</a>
  </li>
</ul>
<div class="tab-content my-padding">
  <div id="profile" class="tab-pane fade in" role="tabpanel">
    <span>Hello, user!</span>
  </div>
  <div id="new" class="tab-pane active fade show" role="tabpanel">
    <button>Click!</button>
  </div>
</div>
```

To set `fade_effect` option to `true` by default
```ruby
# config/initializers/rails_bootstrap_tabs.rb

RailsBootstrapTabs.bootstrap_version = 4
RailsBootstrapTabs.fade_effect = true
```
## Usage

See examples

## Inspiration

[Rails Bootstrap Helpers](https://github.com/Tretti/rails-bootstrap-helpers)
