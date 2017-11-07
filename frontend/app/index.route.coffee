@TheCreem.config ($stateProvider, $urlRouterProvider) ->

  # For any unmatched URL, redirect to:
  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'landing',
      url: '/'
      templateUrl: 'app/views/landing/landing.layout.html'
      controller: 'LandingController'
      controllerAs: 'vm'

    .state 'platform',
      abstract: true
      templateUrl: 'app/views/platform/platform.layout.html'
      controller: 'PlatformController'
      controllerAs: 'main'
      # data:
        # authorizedRoles: [USER_ROLES.admin, USER_ROLES.employer, USER_ROLES.employee]
    .state 'platform.candidates',{
      url: '/candidates'
      views:{
      '':
        templateUrl: 'app/views/platform/candidates/candidates.layout.html'
        controller: 'CandidatesController'
        controllerAs: 'vm'
      'topbar-view@platform.candidates':
        templateUrl: 'app/views/platform/topbar/topbar.layout.html'
        controller: 'TopbarController'
        controllerAs: 'vm'
      }
    }
    .state 'platform.topbar',
      url: '/topbar'
      templateUrl: 'app/views/platform/topbar/topbar.layout.html'
      controller: 'TopbarController'
      controllerAs: 'vm'
          .state 'platform.candidates',{
      url: '/candidates'
      views:{
      '':
        templateUrl: 'app/views/platform/candidates/candidates.layout.html'
        controller: 'CandidatesController'
        controllerAs: 'vm'
      'topbar-view@platform.candidates':
        templateUrl: 'app/views/platform/topbar/topbar.layout.html'
        controller: 'TopbarController'
        controllerAs: 'vm'
      }
      url: '/topbar'
      templateUrl: 'app/views/platform/topbar/topbar.layout.html'
      controller: 'TopbarController'
      controllerAs: 'vm'
          .state 'platform.candidates',{
      url: '/candidates'
      views:{
      '':
        templateUrl: 'app/views/platform/candidates/candidates.layout.html'
        controller: 'CandidatesController'
        controllerAs: 'vm'
      'topbar-view@platform.candidates':
        templateUrl: 'app/views/platform/topbar/topbar.layout.html'
        controller: 'TopbarController'
        controllerAs: 'vm'
      }
    }
    .state 'platform.topbar',
      url: '/topbar'
      templateUrl: 'app/views/platform/topbar/topbar.layout.html'
      controller: 'TopbarController'
      controllerAs: 'vm'

