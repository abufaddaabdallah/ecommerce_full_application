import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import UserPayment from 'App/Models/UserPayment';
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class UserPaymentsController {

    public async getById(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var result = await UserPayment.query().preload("Payment").preload("User").where('id', id);
        return result;
    }

    public async getAll(ctx: HttpContextContract){
        var userId = ctx.request.input('user_id');
        var paymentId = ctx.request.input('payment_id');
        var query = UserPayment.query().preload("Payment").preload("User");
        if(paymentId){
            query.where('payment_id',paymentId);
        }
        if(userId){
            query.where('user_id',userId);
        }
        var result = await UserPayment.query().preload("Payment").preload("User");
        return result;
    }
    public async create(ctx: HttpContextContract) {
        const newSchema = schema.create({
            provider: schema.string(),
            payment_type: schema.string(),
            payment_id: schema.number(),
            user_id: schema.number(),
            account_no: schema.number(),
            expiry: schema.date(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var userPayment= new UserPayment();
        userPayment.userId = fields.user_id;
        userPayment.provider = fields.provider;
        userPayment.paymentType = fields.payment_type;
        userPayment.paymentId = fields.payment_id;
        userPayment.accountNo = fields.account_no;
        userPayment.expiry = fields.expiry;
        var result = await userPayment.save();
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            provider: schema.string(),
            payment_type: schema.string(),
            payment_id: schema.number(),
            user_id: schema.number(),
            account_no: schema.number(),
            expiry: schema.date(),
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var userPayment = await UserPayment.findOrFail(id);
        userPayment.userId = fields.user_id;
        userPayment.provider = fields.provider;
        userPayment.paymentType = fields.payment_type;
        userPayment.paymentId = fields.payment_id;
        userPayment.accountNo = fields.account_no;
        userPayment.expiry = fields.expiry;
        var result = await userPayment.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var userPayment = await UserPayment.findOrFail(id);
            await userPayment.delete();
            return { message: "The userPayment has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
