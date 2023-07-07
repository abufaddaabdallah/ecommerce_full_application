import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import OrderStatus from 'App/Models/OrderStatus';
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class OrderStatusesController {

    public async getById(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var result = await OrderStatus.query().preload("Order").where('id', id);
        return result;
    }
    public async getAll(ctx: HttpContextContract){
        var orderId = ctx.request.input('order_id');
        var query = OrderStatus.query().preload("Order");
        if(orderId){
            query.where('order_id',orderId);
        }
    }
    public async create(ctx: HttpContextContract) {
        const newSchema = schema.create({
            status: schema.number(),
            order_id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var orderStatus = new OrderStatus();
        orderStatus.status = fields.status;
        orderStatus.orderId = fields.order_id;
        var result = await orderStatus.save();
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            status: schema.number(),
            order_id: schema.number(),
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var orderStatus = await OrderStatus.findOrFail(id);
        orderStatus.status = fields.status;
        orderStatus.orderId = fields.order_id;
        var result = await orderStatus.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var orderStatus = await OrderStatus.findOrFail(id);
            await orderStatus.delete();
            return { message: "The orderStatus has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
