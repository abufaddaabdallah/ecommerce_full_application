import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Address from 'App/Models/Address';
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class AddressesController {

    public async getById(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var result = await Address.query().preload("City").where(id, 'id');
        return result;
    }
    public async getAll(ctx: HttpContextContract) {
        var cityId = ctx.request.input('city_id');
        var query = Address.query().preload("City");

        if(cityId){
            query.where("city_id",cityId);
        }
        var result = await query;
        return result;
    }
    public async create(ctx: HttpContextContract){

        const newSchema = schema.create({
            city_id: schema.number(),
            addresses: schema.string(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var address = new Address();
        address.cityId = fields.city_id;
        address.addresses = fields.addresses;
        var result = await address.save();
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            city_id: schema.number(),
            addresses: schema.string(),
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var address = await Address.findOrFail(id);
        address.cityId = fields.city_id;
        address.addresses = fields.addresses;
        var result = await address.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var address = await Address.findOrFail(id);
            await address.delete();
            return { message: "The address has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
