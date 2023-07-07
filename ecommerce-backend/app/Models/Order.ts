import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column } from '@ioc:Adonis/Lucid/Orm'
import User from './User';
import Payment from './Payment';
import Address from './Address';

export default class Order extends BaseModel {
  public static table = 'orders';

  @column({ isPrimary: true })
  public id: number

  @column({serializeAs:'user_id'})
  public userId: number

  @column({serializeAs:'total'})
  public total: number

  @column({serializeAs:'payment_id'})
  public paymentId: number

  @column({serializeAs:'address_id'})
  public addressId: number

  @column({ serializeAs: "sub_total" })
  public subTotal: number

  @column({ serializeAs: "tax_amount" })
  public taxAmount: number

  @column({ serializeAs: "payment_method_id" })
  public paymentMethodId: number

  @column({ serializeAs: "status_id" })
  public statusId: number

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  @belongsTo(()=>User,{
    foreignKey: 'userId'
  })
  public User: BelongsTo<typeof User>
  
  @belongsTo(()=>Payment,{
    foreignKey: 'paymentId'
  })
  public Payment: BelongsTo<typeof Payment>
  
  @belongsTo(()=>Address,{
    foreignKey: 'addressId'
  })
  public Address: BelongsTo<typeof Address>
  
    order_id: any;
}
