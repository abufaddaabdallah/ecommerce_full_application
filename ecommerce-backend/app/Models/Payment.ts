import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column } from '@ioc:Adonis/Lucid/Orm'
import Order from './Order';

export default class Payment extends BaseModel {
  public static table = 'payments';

  @column({ isPrimary: true })
  public id: number

  @column({serializeAs:'order_id'})
  public orderId:number

  @column({serializeAs:'amount'})
  public amount:number

  @column({serializeAs:'provider'})
  public provider:string

  @column({serializeAs:'status'})
  public status:string

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  @belongsTo(()=>Order,{
    foreignKey: 'orderId'
  })
  public Order: BelongsTo<typeof Order>
}
