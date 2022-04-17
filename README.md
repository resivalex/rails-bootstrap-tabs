# Rails Bootstrap Tabs

[![Build Status](https://travis-ci.com/resivalex/rails-bootstrap-tabs.svg?branch=master)](https://travis-ci.com/resivalex/rails-bootstrap-tabs)

## Installation

Add it to your Gemfile:

```ruby
gem 'rails-bootstrap-tabs', '~> 0.3.2'
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
    <a data-toggle="tab" href="#tab-0-mpvaddhj">Tab 1</a>
  </li>
  <li>
    <a data-toggle="tab" href="#tab-1-flmijlfp">Tab 2</a>
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
  - c.tab 'Profile', anchor: 'profile', link_class: 'my-custom-class'
    span Hello, user!
  - c.tab 'New feature', anchor: 'new', active: true
    button Click!
```
expands to
```html
<ul class="nav nav-tabs">
  <li class="my-custom-class active">
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
  - c.tab 'Profile', anchor: 'profile', link_class: 'my-custom-class'
    span Hello, user!
  - c.tab 'New feature', anchor: 'new', active: true
    button Click!
```
expands to
```html
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a data-toggle="tab" class="nav-link my-custom-class" href="#profile">Profile</a>
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

Also, `nav` markup can be used instead of `ul` & `li`

```slim
= tabs content_class: 'my-padding', nav_markup: true do |c|
  - c.tab 'Profile', anchor: 'profile', link_class: 'my-custom-class'
  - c.tab 'New feature', anchor: 'new', active: true
```
expands to
```html
<nav class="nav nav-tabs">
  <a data-toggle="tab" href="#profile" class="nav-link my-custom-class">Profile</a>
  <a data-toggle="tab" href="#new" class="nav-link active">New feature</a>
</nav>
<div class="tab-content my-padding">
    ...
</div>
```

## Bootstrap 5

```ruby
# config/initializers/rails_bootstrap_tabs.rb

RailsBootstrapTabs.bootstrap_version = 5
```

```slim
= tabs content_class: 'my-padding', fade_effect: true do |c|
  - c.tab 'Profile', anchor: 'profile', link_class: 'my-custom-class'
    span Hello, user!
  - c.tab 'New feature', anchor: 'new', active: true
    button Click!
```
expands to
```html
<ul class="nav nav-tabs" role="tablist">
  <li class="nav-item" role="presentation">
    <button name="button" type="submit" data-bs-toggle="tab" data-bs-target="#profile" class="nav-link my-custom-class" role="tab">Profile</button></li>
  <li class="nav-item" role="presentation">
    <button name="button" type="submit" data-bs-toggle="tab" data-bs-target="#new" class="nav-link active" role="tab">New feature</button>
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

Also, `nav` markup can be used instead of `ul` & `li`

```slim
= tabs content_class: 'my-padding', nav_markup: true do |c|
  - c.tab 'Profile', anchor: 'profile', link_class: 'my-custom-class'
  - c.tab 'New feature', anchor: 'new', active: true
```
expands to
```html
<nav>
  <div class="nav nav-tabs" role="tablist">
    <button name="button" type="submit" data-bs-toggle="tab" data-bs-target="#profile" class="nav-link my-custom-class" role="tab">Profile</button>
    <button name="button" type="submit" data-bs-toggle="tab" data-bs-target="#new" class="nav-link active" role="tab">New feature</button>
  </div>
</nav>
<div class="tab-content my-padding">
    ...
</div>
```

## Configuration

`fade_effect` and `nav_markup` are set to `false` by default

You can change default values in a configuration file
```ruby
# config/initializers/rails_bootstrap_tabs.rb

RailsBootstrapTabs.bootstrap_version = 5
RailsBootstrapTabs.fade_effect = true
RailsBootstrapTabs.nav_markup = true
```

## Usage

See examples

## Inspiration

[Rails Bootstrap Helpers](https://github.com/Tretti/rails-bootstrap-helpers)
