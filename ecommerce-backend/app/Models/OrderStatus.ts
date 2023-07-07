import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column } from '@ioc:Adonis/Lucid/Orm'
import Order from './Order';

export default class OrderStatus extends BaseModel {
  public static table = 'order_statuses';

  @column({ isPrimary: true })
  public id: number

  @column({serializeAs:'status'})
  public status: number

  @column({serializeAs:'order_id'})
  public orderId: number

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  @belongsTo(()=>Order,{
    foreignKey: 'orderId'
  })
  public Order: BelongsTo<typeof Order>

}

