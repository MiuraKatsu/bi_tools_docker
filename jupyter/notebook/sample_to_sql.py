import sqlalchemy

mysql_user     = 'root'
mysql_passwd   = 'password'
mysql_database = 'dwh'
mysql_address  = 'mysql:3306'

engine = sqlalchemy.create_engine(
    'mysql://{}:{}@{}/{}?charset=utf8'.format(
        mysql_user     ,
        mysql_passwd   ,
        mysql_address  ,
        mysql_database ,
    ),
    encoding      = "utf-8",
    echo          = True,
    pool_pre_ping = True
)



df = pd.DataFrame([
  ["0001", "John", "Engineer"],
  ["0002", "Lily", "Sales"]],
  columns=['id', 'name', 'job'])

print(df)

df.to_csv('sample.csv')
df.to_excel('sample.xlsx')
df.to_sql('sample', con=engine, if_exists='fail', index=False)

