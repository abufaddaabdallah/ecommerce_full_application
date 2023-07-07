/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| This file is dedicated for defining HTTP routes. A single file is enough
| for majority of projects, however you can define routes in different
| files and just make sure to import them inside this file. For example
|
| Define routes in following two files
| ├── start/routes/cart.ts
| ├── start/routes/customer.ts
|
| and then import them inside `start/routes.ts` as follows
|
| import './routes/cart'
| import './routes/customer'
|
*/

import Route from '@ioc:Adonis/Core/Route'

Route.group(() => {
  Route.group(() => { 
    Route.get('/:id','AddressesController.getById');
    Route.get('/', 'AddressesController.getAll');
    Route.post('/','AddressesController.create');
    Route.put('/','AddressesController.update');
    Route.delete('/','AddressesController.destroy');
  }).prefix('/addresses');

  Route.group(() => { 
    Route.get('/:id','CategoriesController.getById');
    Route.get('/', 'CategoriesController.getAll');
    Route.post('/','CategoriesController.create');
    Route.put('/','CategoriesController.update');
    Route.delete('/','CategoriesController.destroy');
  }).prefix('/categories');

  Route.group(() => { 
    Route.get('/:id','CitiesController.getById');
    Route.get('/', 'CitiesController.getAll');
    Route.post('/','CitiesController.create');
    Route.put('/','CitiesController.update');
    Route.delete('/','CitiesController.destroy');
  }).prefix('/cities');

  Route.group(() => { 
    Route.get('/:id','CountriesController.getById');
    Route.get('/', 'CountriesController.getAll');
    Route.post('/','CountriesController.create');
    Route.put('/','CountriesController.update');
    Route.delete('/','CountriesController.destroy');
  }).prefix('/countries');

  Route.group(() => { 
    Route.get('/:id','DiscountsController.getById');
    Route.get('/', 'DiscountsController.getAll');
    Route.post('/','DiscountsController.create');
    Route.put('/','DiscountsController.update');
    Route.delete('/','DiscountsController.destroy');
  }).prefix('/discounts');

  Route.group(() => { 
    Route.get('/:id','InventoriesController.getById');
    Route.get('/', 'InventoriesController.getAll');
    Route.post('/','InventoriesController.create');
    Route.put('/','InventoriesController.update');
    Route.delete('/','InventoriesController.destroy');
  }).prefix('/inventories');

  Route.group(() => { 
    Route.get('/:id','OrdersController.getById');
    Route.get('/', 'OrdersController.getAll');
    Route.post('/','OrdersController.create');
    Route.put('/','OrdersController.update');
    Route.delete('/','OrdersController.destroy');
  }).prefix('/orders');

  Route.group(() => { 
    Route.get('/:id','OrderStatusesController.getById');
    Route.get('/', 'OrderStatusesController.getAll');
    Route.post('/','OrderStatusesController.create');
    Route.put('/','OrderStatusesController.update');
    Route.delete('/','OrderStatusesController.destroy');
  }).prefix('/orderStatuses');
  
  Route.group(() => { 
    Route.get('/g','OrderProductsController.getById');
    Route.get('/', 'OrderProductsController.getAll');
    Route.post('/','OrderProductsController.create');
    Route.put('/','OrderProductsController.update');
    Route.delete('/','OrderProductsController.destroy');
  }).prefix('/orderProducts');

  Route.group(() => { 
    Route.get('/:id','PaymentsController.getById');
    Route.get('/', 'PaymentsController.getAll');
    Route.post('/','PaymentsController.create');
    Route.put('/','PaymentsController.update');
    Route.delete('/','PaymentsController.destroy');
  }).prefix('/payments');
  
  Route.group(() => { 
    Route.get('/$categoryId','ProductsController.getByCategory');
    Route.get('/:id','ProductsController.getById');
    Route.get('/', 'ProductsController.getAll');
    Route.post('/','ProductsController.create');
    Route.put('/','ProductsController.update');
    Route.delete('/','ProductsController.destroy');
  }).prefix('/products');
  
  Route.group(() => { 
    Route.get('/:id','UserPaymentsController.getById');
    Route.get('/', 'UserPaymentsController.getAll');
    Route.post('/','UserPaymentsController.create');
    Route.put('/','UserPaymentsController.update');
    Route.delete('/','UserPaymentsController.destroy');
  }).prefix('/userPayments');
  
  Route.group(() => { 
    Route.get('/:id','UserStatusesController.getById');
    Route.get('/', 'UserStatusesController.getAll');
    Route.post('/','UserStatusesController.create');
    Route.put('/','UserStatusesController.update');
    Route.delete('/','UserStatusesController.destroy');
  }).prefix('/userStatuses');

  Route.group(() => { 
    Route.get('/getMe','UsersController.getById');
    Route.get('/:id','UsersController.getById');
    Route.get('/', 'UsersController.getAll');
    Route.post('/login','UsersController.login');
    Route.post('/logout','UsersController.logout');
    Route.post('/','UsersController.create');
    Route.put('/','UsersController.update');
    Route.delete('/','UsersController.destroy');
  }).prefix('/users');
  
  // Route.group(() => { 
  //   Route.get('/:id','AuthorsController.getById');
  //   Route.get('/', 'AuthorsController.getAll');
  //   Route.post('/login','AuthorsController.login');
  //   Route.post('/logout','AuthorsController.logout');
  //   Route.post('/','AuthorsController.create');
  //   Route.put('/','AuthorsController.update');
  //   Route.delete('/','AuthorsController.destroy');
  // }).prefix('/authors');
}).prefix('api')