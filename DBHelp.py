import pymysql


class DBHelp():

    def __init__(self,host,port,user,password,database,charset):
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.database = database
        self.charset = charset
        self.db = None
        self.cursor = None
    def openDB(self):

        self.db = pymysql.connect(host=self.host,port = self.port,user=self.user,password=self.password,database=self.database,charset=self.charset,cursorclass=pymysql.cursors.DictCursor)
        self.cursor = self.db.cursor()
    def close(self):
        self.cursor.close()
        self.db.close()



        # 数据增删改



    def cud(self, sql, params):
        self.openDB()

        try:
            self.cursor.execute(sql, params)
            self.db.commit()
            print("ok")
        except Exception as e:

            print(e)

            self.db.rollback()

            self.close()
    #查一个数据
    def find_one(self, sql, params=None):
        self.openDB()
        row = None
        try:
            self.cursor.execute(sql, params)
            row = self.cursor.fetchone()
            if not row:
                return None
            if len(row.keys()) == 1:
                key = list(row.keys())[0]
                return row[key]    
            self.close()
            return row
        except Exception as e:
            self.db.rollback()
            self.close()
            print('find_one出现错误' + e)

    def find_all(self,sql,params = None):
        self.openDB()
        rows = None
        try:
            self.cursor.execute(sql,params)
            rows = self.cursor.fetchall()
            if not rows:
                return None
            if len(rows[0].keys()) == 1:
                simple_list = []
                key = list(rows[0].keys())[0]
                for row in rows:
                    simple_list.append(row[key])
                    return simple_list
            self.close()        
            return rows
        except Exception as e:
            self.db.rollback()
            self.close()
            print('查找全部错误' + e)

    def cud_sql(self,sql):
        self.openDB()
        try:
            self.cursor.execute(sql)
            self.db.commit()
            self.db.close()
            print('ok')
            print(self.db)
            print(self.cursor)
        except Exception as e:
            self.db.rollback()
            self.close()
            print(e)

    def insertone(self,sql,params = None):
        self.openDB()
        lastrowid = 0
        try:
            self.cursor.execute(sql,params)
            self.db.commit()
            lastrowid = self.cursor.lastrowid
            self.close()
            return lastrowid
        except Exception as e:
            self.db.rollback()
            self.close()
            print(e)
        



    def insertmany(self,sql,params = None,batch_size=1000):
        self.openDB()
        cnt = 0
        try:
            batch_cnt = int(len(params) / batch_size) + 1
            for i in range(batch_cnt):
                sub_array = params[i * batch_size:(i + 1) * batch_size]
                if sub_array:
                    cnt += self.cursor.executemany(sql, sub_array)
                    self.db.commit()
            return cnt        
        except Exception as e:
            self.db.rollback()
            self.close()
            print(e)


#     def execute(sql, param=None):
#     """
#     执行sql语句:修改或删除
#     :param sql: sql语句
#     :param param: string|list
#     :return: 影响数量
#     """
#     con = connect_mysql()
#     cur = con.cursor()
#     cnt = execute_process(con, cur, sql, param)
#     cur.close()
#     con.close()
#     return cnt


# def execute_process(con, cur, sql, param=None):
#     """ execute:内部调用 """
#     cnt = 0
#     try:
#         cnt = cur.execute(sql, param)
#         con.commit()
#     except Exception as e:
#         con.rollback()
#         logger.error(traceback.format_exc())
#         logger.error("[sql]:{} [param]:{}".format(sql, param))
#     return cnt 
#        
    def updateOrdelete(self,sql,params = None):
        self.openDB()
        cnt = 0    
        try:
            cnt = self.cursor.execute(sql,params)
            self.db.commit()
            return cnt
        except Exception as e:
            self.db.rollback()
            self.close()
            print(e)

