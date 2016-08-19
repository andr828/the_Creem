@TheCreem.directive 'creemTopnav', ()->
  directive =
    restrict: 'E'
    templateUrl: 'app/components/creem-topnav/creem-topnav.html'
    scope: {}
    controllerAs: 'vm'
    bindToController: true
    controller: () ->
      vm = this

      return
