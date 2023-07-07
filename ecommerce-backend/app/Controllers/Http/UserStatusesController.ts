import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import UserStatus from 'App/Models/UserStatus';
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class UserStatusesController {
    
    public async getById(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var result = await UserStatus.query().where('id', id);
        return result;
    }

    public async getAll(ctx: HttpContextContract){
        var query = UserStatus.query();
        var result = await UserStatus.query();
        return result;
    }
    public async create(ctx: HttpContextContract) {
        const newSchema = schema.create({
            status: schema.string(),
        });
        const fields = await ctx.request.validate({ schema: newSchema });
        var userStatus= new UserStatus();
        userStatus.status = fields.status;
        var result = await userStatus.save();
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            status: schema.string(),
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema });
        var id = fields.id;
        var userStatus = await UserStatus.findOrFail(id);
        userStatus.status = fields.status;
        var result = await userStatus.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var userStatus = await UserStatus.findOrFail(id);
            await userStatus.delete();
            return { message: "The userStatus has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
