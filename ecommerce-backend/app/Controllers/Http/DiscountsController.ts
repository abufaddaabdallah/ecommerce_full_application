import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Discount from 'App/Models/Discount';
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class DiscountsController {
    public async getById(ctx : HttpContextContract){
        var id = ctx.params.id;
        var result =  await Discount.query().where('id',id);
        return result;
    }

    public async getAll(ctx:HttpContextContract){
        var query = Discount.all();
        var result = await query;
        return result;
    }
    public async create (ctx : HttpContextContract){
        const newSchema = schema.create({
            name: schema.string(),
            description: schema.string(),
            percent: schema.number(),
            active: schema.boolean(),
            
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var discount = new Discount();
        discount.name = fields.name;
        discount.description = fields.description;
        discount.percent = fields.percent;
        discount.active = fields.active;
        var result = await discount.save();
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            name: schema.string(),
            description: schema.string(),
            percent: schema.number(),
            active: schema.boolean(),      
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var discount = await Discount.findOrFail(id);
        discount.name = fields.name;
        discount.description = fields.description;
        discount.percent = fields.percent;
        discount.active = fields.active;
        var result = await discount.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var discount = await Discount.findOrFail(id);
            await discount.delete();
            return { message: "The discount has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
