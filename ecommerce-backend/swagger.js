const swaggerUi = require('swagger-ui-express');
const swaggerJsdoc = require('swagger-jsdoc');
const Swagger = require('adonis-swagger/src/Swagger');

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'My API',
      version: '1.0.0',
      description: 'My API description'
    },
    servers: [
      {
        url: 'http://localhost:3333'
      }
    ],
    basePath: '/'
  },
  apis: ['./app/**/*.js', './start/routes.js']
};

const specs = swaggerJsdoc(options);

class SwaggerController {
  async specs ({ response }) {
    response.send(specs);
  }

  async ui ({ request, response }) {
    const swaggerPath = '/swagger.json';
    const path = request.originalUrl().replace('/swagger', swaggerPath);
    const ui = await Swagger.buildUI(path);
    response.send(ui);
  }
}

module.exports = SwaggerController;
