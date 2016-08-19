@TheCreem.controller 'TopbarController', ($log, $anchorScroll, $location, $window, Auth, CreemSession, Restangular, $state) ->
  vm = this
  # TODO: get geolocation of user.

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

  vm.Logout = ()->
    alert "Logout"

  return this
