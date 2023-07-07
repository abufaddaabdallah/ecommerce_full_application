import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import OrderProduct from 'App/Models/OrderProduct';
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import Address from 'App/Models/Address';
import Order from 'App/Models/Order';
import User from 'App/Models/User';
import Database from '@ioc:Adonis/Lucid/Database';

export default class OrderProductsController {

    public async getById(ctx: HttpContextContract) {
        // var id = ctx.params.id;
        // // var result = await OrderProduct.query().preload("Order").preload("OrderStatus").preload('Product').where('id',id).paginate(25);
        // var result = await OrderProduct.query().where('id',id).paginate(25);
        // return result;

       try {
         var orderId = ctx.params.orderId;
 
         var result = await OrderProduct.query().preload("Order").preload('Product').where('order_id', orderId);
         return result;
       } catch (error) {
        return error;
       }
    }

    public async getAll(ctx: HttpContextContract) {

        var query = OrderProduct.query().preload("Order").preload('Product').preload('User');
        var orderId = ctx.request.input('order_id');
        var productId = ctx.request.input('product_id');
        var userId = ctx.request.input('user_id');
    
        if (ctx.request.input("orderId")) { 
            query.where("orderId",ctx.request.input("orderId"));
        return query;
        }
        if (productId) {
          return  query.where('product_id', productId);
        }
       
        
       
        var result = await query;
        // var orderProducts: OrderProduct[] = [];
        // result.map((orderProduct) => {
        //     if (orderProduct.User) {
        //         orderProducts.push(orderProduct);
        //     }
        // });
        return result;


    }

    async create({ request, response, auth }: HttpContextContract) {
        try {

            var authObject = await auth.authenticate();
            var data = request.all();

            var order = new Order();
            order.userId = authObject.id;
            order.taxAmount = data.tax_amount;
            order.subTotal = data.sub_total;
            order.total = data.total;
            order.paymentMethodId = data.payment_method_id;
            order.statusId = 1;
            var newOrder = await order.save();

            var address = new Address();
            address.country = data.address.country;
            address.city = data.address.city;
            address.area = data.address.area;
            address.street = data.address.street;
            // address.buildingNo = data.address.building_no;
            address.longitude = data.address.longitude;
            address.latitude = data.address.latitude;
            address.orderId = newOrder.id;
            await address.save();

            // var user = new User();
            // // user.username=data.user.username;
            // user.id=data.user.id;
            // await user.save();

            var orderProducts: OrderProduct[] = data.products.map((product) => {
                var orderProduct = new OrderProduct();
                orderProduct.orderId = newOrder.id;
                // orderProduct.userId = user.id;
                orderProduct.productId = product.product_id;
                orderProduct.qty = product.qty;
                orderProduct.price = product.price;
                return orderProduct;
            });

            await OrderProduct.createMany(orderProducts);
            return newOrder.toJSON();
        } catch (ex) {
            console.log(ex);
            return response.badRequest({ message: ex });
        }
    }

    // public async create (ctx : HttpContextContract){
    //     const newSchema = schema.create({
    //         order_id: schema.number(),            
    //         product_id: schema.number(),            
    //         order_status_id: schema.number(),            
    //     });
    //     const fields = await ctx.request.validate({ schema: newSchema })
    //     var orderProduct = new OrderProduct();
    //     orderProduct.orderId = fields.order_id;
    //     orderProduct.productId = fields.product_id;
    //     orderProduct.orderStatusId = fields.order_status_id;
    //     var result = await orderProduct.save();
    // }   
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            order_id: schema.number(),
            product_id: schema.number(),
            order_status_id: schema.number(),
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var orderProduct = await OrderProduct.findOrFail(id);
        orderProduct.orderId = fields.order_id;
        orderProduct.productId = fields.product_id;
        orderProduct.orderStatusId = fields.order_status_id;
        var result = await orderProduct.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var orderProduct = await OrderProduct.findOrFail(id);
            await orderProduct.delete();
            return { message: "The orderProduct has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
