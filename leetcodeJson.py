import json
from DBHelp import *
db = DBHelp(host="localhost",port=3306,user='root',password='123456',database='leetcode',charset='utf8')

def resolveJson(path,path_en):
    file = open(path, "rb")
    question_list_zh = json.load(file)
    file_en = open(path_en,'rb')
    question_en = json.load(file_en)
    questionData_en = question_en['stat_status_pairs'] #英文数据
    questionData  =   question_list_zh['data']  #中文名
    for question_temp in questionData_en: #遍历
        leetcodeq = {}
        question_id = question_temp['stat']['question_id']
        question_slug = question_temp['stat']['question__title_slug']
        question_status = question_temp['status']
        question_difficulty  = "None"
        level = question_temp['difficulty']['level']
        if level == 1:
            question_difficulty = "Easy"
        elif level == 2:
            question_difficulty = "Medium"
        elif level == 3:
            question_difficulty = "Hard"

        leetcodeq.setdefault('question_id',question_temp['stat']['question_id'])
        leetcodeq.setdefault('question_slug',question_temp['stat']['question__title_slug'])
        leetcodeq.setdefault('question_title',question_temp['stat']['question__title_slug'])
        leetcodeq.setdefault('question_l',question_difficulty)

        for question_zh in questionData['translations']:
            strq = question_id
            if question_zh['questionId'] == str(question_id):
               leetcodeq.setdefault('question_title_zh',question_zh['title'])
               sql = "INSERT INTO question (question_id,question_title_slug,question_title,question_level,question_title_zh) VALUES (%s,%s,%s,%s,%s)"
               db.cud(sql,tuple(leetcodeq.values()))
               continue


            

resolveJson('/Users/apple/Documents/leetcode_cn.json','/Users/apple/Documents/leetcode.json')