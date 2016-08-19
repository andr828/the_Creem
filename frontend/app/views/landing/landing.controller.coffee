@TheCreem.controller 'LandingController', ($log, $anchorScroll, $http, $location, $window, Auth, CreemSession, Restangular, $state) ->
  vm = this
  
  # TODO: get geolocation of user.
  vm.map = { zoom: 12, center: { longitude: 151.2094, latitude: -33.8650 } }
  vm.mapOptions = { scrollwheel: false }

  vm.showRegisterForm = ->
    vm.showLoginForm = 'register'

  vm.afterLoginCb = (user)->
    CreemSession.create(user)

  vm.afterRegisterCb = (user)->
    CreemSession.create(user)

  vm.afterResetCb = ()->

  vm.toggleMobileMenu = ->
    el = angular.element(document.getElementById('mobile-nav-bar'))
    el.toggleClass('open')

  vm.goToAnchor = (id, mobileMenu)->
    $location.hash(id)
    $anchorScroll()
    vm.toggleMobileMenu() if mobileMenu

  vm.goToRegister = (mobileMenu)->
    window.location.hash = ''
    vm.showRegisterForm()
    $window.scrollTo(0, 0)
    vm.toggleMobileMenu() if mobileMenu


  return this
