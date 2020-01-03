# Hime Restaurant Point Of Sales API

Point of Sales System API build with Node JS Express and MySQL with Sequelize ORM

Deployed on Heroku [Link](https://intense-inlet-23820.herokuapp.com/)

Related project : [Hime Restaurant Point Of Sales Frontend](https://github.com/iyansr/hime-restaurant)

<div align='center'>
  <img src='https://res.cloudinary.com/iyansrcloud/image/upload/v1578034806/screenshot/Home_si6d6r.png' width='800'  />

</div>
<div align='center'>
 <a href='https://intense-inlet-23820.herokuapp.com/'>
  <img src='http://heroku-badge.herokuapp.com/?app=angularjs-crypto&style=flat&svg=1' />
  </a>
  <a href="http://opensource.org/licenses/MIT">
    <img title="MIT license" src="http://img.shields.io/badge/license-MIT-brightgreen.svg">
  </a>
  <a href="#">
    <img title="Open Source Love" src="https://badges.frapsoft.com/os/v1/open-source.svg?v=102">
  </a>
   <a href="https://github.com/prettier/prettier"><img src="https://img.shields.io/badge/styled_with-prettier-ff69b4.svg"></a>

</div>

---

## Features

- List Foods
- CRUD
- Pagination
- Search & Sort
- Upload Image
- Validation

## Build Setup



- Clone Repository `git clone https://github.com/iyansr/hime-restaurant-api.git`

- Make the `.env` file or you can copy from `.env.sample`

  ```env
  CLOUDINARY_CLOUD_NAME = 
  CLOUDINARY_API_KEY = 
  CLOUDINARY_API_SECRET = 
  JWT_SECRET = 

  DB_NAME = 
  DB_USER = 
  DB_PASSWORD = 
  DB_HOST = 
  DB_PORT = 
  ```

- Import database `hime_food.sql` to phpMyAdmin 

- Install Dependencies 

  ```bash
  # with yarn
  $ yarn install

  # or with npm
  $ npm install
  ```

- Run the development Server 

  ```bash
  # with yarn
  $ yarn run dev-server
  
  # or with npm
  $ npm run dev-server
  ```

- Server will running on port `9300`

## Stacks

- Node JS
- Express
- Sequelize
- Cloudinary
- JWT

## Dependencies

- bcryptjs
- express-fileupload
- uuid
- validator
- jsonwebtoken
- cors

## Endpoint

- `api/food`
  - Get list of foods
  - Method : GET
  - Query : 
    - limit : Number
    - page : Number
    - category : String
    - price : Number (Min) ; Number (Max)
    - order : String (ASC or DESC)
    - name : String
  - Example : `api/food?limit=6&page=1&category=49267808-a055-480f-a82b-aa1036899c42&price=10000;30000&order=ASC&name=tako`


- `api/food`
  - Add new food
  - Method : POST
  - Header : `Content-Type : multipart/form-data`
  - Body : 
    - name : String | Required
    - category : String | Required
    - price : Number | Required
    - image : String or Blob | Required
  

- `api/food/:id`
  - Edit food
  - Method : PATCH
  - Header : `Content-Type : multipart/form-data`
  - Body : 
    - name : String | Required
    - category : String | Required
    - price : Number | Required
    - image : String or Blob | Required
  - Params : 
    - id : String | Required
  - Example : `api/food/35d7e3d4-e313-4527-8818-34c8de5b2b0a`

- `api/food/:id`
  - Delete food by id
  - Method : DELETE
  - Params : 
    - id : String | Required
  - Example : `api/food/35d7e3d4-e313-4527-8818-34c8de5b2b0a`

- `api/checkout`
  - Get list of recent checkout
  - Method : GET

- `api/checkout/chart`
  - Get data for chart
  - Method : GET

- `api/user/login`
  - Login User
  - Method : POST
  - Header : `Content-Type : multipart/form-data`
  - Body : 
    - email : String | Required
    - password : String | Required

 

---

Copyright © 2020 by I Putu Saputrayana (Iyan Saputra)
