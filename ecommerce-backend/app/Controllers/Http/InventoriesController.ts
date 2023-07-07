import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Inventory from 'App/Models/Inventory';
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class InventoriesController {
    
    public async getById (ctx : HttpContextContract){
        var id = ctx.params.id;
        var result = Inventory.query().where('id',id);
    }
    public async getAll(ctx:HttpContextContract){
        var query = Inventory.all();
        var result = await query;
        return result;
    }
    public async create (ctx : HttpContextContract){
        const newSchema = schema.create({
            quantity: schema.string(),            
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var inventory = new Inventory();
        inventory.quantity = fields.quantity;
        var result = await inventory.save();
    }   
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            quantity: schema.string(),            
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var inventory = await Inventory.findOrFail(id);
        inventory.quantity = fields.quantity;
        var result = await inventory.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var inventory = await Inventory.findOrFail(id);
            await inventory.delete();
            return { message: "The inventory has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
