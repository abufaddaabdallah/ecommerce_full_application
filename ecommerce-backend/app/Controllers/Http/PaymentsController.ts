import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Payment from 'App/Models/Payment';
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class PaymentsController {
    public async getById(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var result = await Payment.query().preload("Order").where('id', id);
        return result;
    }
    public async getAll(ctx: HttpContextContract){
        var orderId = ctx.request.input('order_id');
        var query = Payment.query().preload("Order");
        if(orderId){
            query.where('order_id',orderId);
        }
    }
    public async create(ctx: HttpContextContract) {
        const newSchema = schema.create({
            amount: schema.number(),
            order_id: schema.number(),
            provider: schema.string(),
            status: schema.string(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var payment = new Payment();
        payment.status = fields.status;
        payment.orderId = fields.order_id;
        payment.provider = fields.provider;
        payment.amount = fields.amount;
        var result = await payment.save();
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            amount: schema.number(),
            order_id: schema.number(),
            provider: schema.string(),
            status: schema.string(),
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var payment = await Payment.findOrFail(id);
        payment.status = fields.status;
        payment.orderId = fields.order_id;
        payment.provider = fields.provider;
        payment.amount = fields.amount;
        var result = await payment.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var payment = await Payment.findOrFail(id);
            await payment.delete();
            return { message: "The payment has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
