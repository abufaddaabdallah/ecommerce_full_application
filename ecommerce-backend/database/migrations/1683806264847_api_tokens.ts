import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class extends BaseSchema {
  protected tableName = 'api_tokens'

  public async up () {
    this.schema.alterTable(this.tableName,(t)=>{t.foreign('user_id').references('id').inTable('users')});
  
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
