import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Order from 'App/Models/Order';
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import Address from 'App/Models/Address';
import OrderProduct from 'App/Models/OrderProduct';
import User from 'App/Models/User';

export default class OrdersController {

    public async getById(ctx: HttpContextContract) {
        var id = ctx.params.id;
        // var result = await Order.query().preload("Address").preload("User").preload("Payment").where('id', id);
        var result = await Order.query().preload("Address").preload("User").preload("Payment").where('id', id);
        return result;
    }

    public async getAll(ctx: HttpContextContract) {
        var addressId = ctx.request.input('address_id');
        var userId = ctx.request.input('user_id');
        var paymentId = ctx.request.input('payment_id');
        var query = Order.query().preload("User");
        if (addressId) {
            query.where('address_id', addressId);
        }
         if (ctx.request.input("userId")) { 
            query.where("userId",ctx.request.input("userId"));
        return query;
        }
        if (paymentId) {
            query.where('payment_id', paymentId);
        }
        var result = await query;
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
            order.statusId=1;
            var newOrder = await order.save();

            var address = new Address();
            address.country = data.address.country;
            address.city = data.address.city;
            address.area = data.address.area;
            address.street = data.address.street;
            address.buildingNo = data.address.building_no;
            address.longitude = data.address.longitude;
            address.latitude = data.address.latitude;
            address.orderId = newOrder.id;
            await address.save();

        

            var orderProducts: OrderProduct[] = data.products.map((product) => {
                var orderProduct = new OrderProduct();
                orderProduct.orderId = newOrder.id;
                orderProduct.userId = product.user_id;
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

    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            payment_id: schema.number(),
            user_id: schema.number(),
            address_id: schema.number(),
            total: schema.number(),
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var order = await Order.findOrFail(id);
        order.paymentId = fields.payment_id;
        order.userId = fields.user_id;
        order.addressId = fields.address_id;
        order.total = fields.total;
        var result = await order.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var order = await Order.findOrFail(id);
            await order.delete();
            return { message: "The order has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
