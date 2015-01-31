(function (){
  angular.module('lmp', []).controller('TaskController', function($scope, $http){

    var loaddata = function(){
      $http.get('/tasks.json').success(function(data){
        $scope.tasks = data;
      });
    };
    loaddata();

    $scope.addTask = function(description, id){
      $http.post('/tasks.json', {task: {description: description, user_id: id}}).success(function(data){
        $scope.tasks = loaddata();
        $scope.newTaskdescription = '';
      });
    };
  });
})();