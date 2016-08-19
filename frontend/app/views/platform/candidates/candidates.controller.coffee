
@TheCreem.controller 'CandidatesController', ($scope, $location, $http , Restangular) ->
  
  vm = this
  vm.resource = Restangular.all 'creem/jpi/v1/candidate#index'
  vm.resource.getList().then((data) ->
    vm.respond = data
  )

  return this
 
 
  # Add the following lines
