@TheCreem.run ($log, $rootScope, $state, Auth, $http, $timeout) ->
  # Check if a user is authorized to access a page
  # ui-router state change event
  $rootScope.$on '$stateChangeStart', (event, next) ->
    Auth.currentUser().then(
      (user)->
        $log.debug('Authorized user session')
      (error)->
        $log.debug('Unauthorized, sign in or sign up to continue')
    )
