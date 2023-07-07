import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column,} from '@ioc:Adonis/Lucid/Orm'
import Order from './Order'
import Product from './Product'
import OrderStatus from './OrderStatus'
import User from './User'

export default class OrderProduct extends BaseModel {

  public static table = 'order_products';

  @column({ isPrimary: true })
  public id: number

  @column({serializeAs:"order_id"})
  public orderId:number
  
  @column({serializeAs:"product_id"})
  public productId:number
  
  @column({serializeAs:"user_id"})
  public userId:number
  
  @column({serializeAs:"order_status_id"})
  public orderStatusId:number
  
  @column({serializeAs:"total"})
  public total:number

  @column({serializeAs:"qty"})
  public qty:number

  @column({serializeAs:"price"})
  public price:number
  
  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  @belongsTo(()=>User,{foreignKey:"userId",})
  public User: BelongsTo<typeof User>

  @belongsTo(()=>Order,{
    foreignKey:"orderId",
  })
  public Order: BelongsTo<typeof Order>

  @belongsTo(()=>Product,{
    foreignKey: "productId"
  })
  public Product: BelongsTo<typeof Product>

  @belongsTo(()=>OrderStatus,{
    foreignKey:"orderStatusId"
  })
  public OrderStatus: BelongsTo<typeof OrderStatus>
}