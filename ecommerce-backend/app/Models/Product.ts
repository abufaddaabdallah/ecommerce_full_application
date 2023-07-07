import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column } from '@ioc:Adonis/Lucid/Orm'
import Category from './Category';
import Inventory from './Inventory';
import Discount from './Discount';

export default class Product extends BaseModel {
  public static table = 'products';

  @column({ isPrimary: true })
  public id: number

  @column({serializeAs:'name'})
  public name: string
  
  @column({serializeAs:'image'})
  public image: string

  @column({serializeAs:'color'})
  public color: string

  @column({serializeAs:'size'})
  public size: string

  @column({serializeAs:'description'})
  public description: string
  
  @column({serializeAs:'category_id'})
  public categoryId: number
  
  @column({serializeAs:'inventory_id'})
  public inventoryId: number
  
  @column({serializeAs:'price'})
  public price: number
  
  @column({serializeAs:'discount_id'})
  public discountId: number

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  @belongsTo(()=>Category,{foreignKey:'categoryId'})
  public Category: BelongsTo<typeof Category>

  @belongsTo(()=>Inventory,{foreignKey:'inventoryId'})
  public Inventory: BelongsTo<typeof Inventory>

  @belongsTo(()=>Discount,{foreignKey:'discountId'})
  public Discount: BelongsTo<typeof Discount>
}
