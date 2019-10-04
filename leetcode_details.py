import json
import requests
import time
from DBHelp import *
db = DBHelp(host="localhost",port=3306,user='root',password='123456',database='leetcode',charset='utf8')

print("查询全表:", db.find_all("select * from question"))


# url="https://leetcode-cn.com/graphql"
# headers = {'sec-fetch-mode': 'cors', 
#             'origin': 'https://leetcode-cn.com',
#             'accept-encoding': 'gzip, deflate, br',
#             'accept-language': 'zh-CN,zh;q=0.9,en;q=0.8',
#             'cookie': '_uab_collina=153762494348105193915074; gr_user_id=a8c74b69-b504-477d-ae67-f50f21a2fea2; grwng_uid=d663fa92-94ff-43af-a3d8-67a9e1d9f1fa; _ga=GA1.2.401918001.1569595697; __auc=bb8268cf16d7331a7399f45809f; csrftoken=wvurzQRd6RdgAXuFwFlhnRxawA9wDFaG9VYwwJrGMr963q6DDJIxquCAgHtueKoM; LEETCODE_SESSION=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJfYXV0aF91c2VyX2lkIjoiMzgyOTA1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXV0aGVudGljYXRpb24uYXV0aF9iYWNrZW5kcy5QaG9uZUF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJlYTI5NDdjYjZmYjkxNjY1MDVhMWE5ZTM3ZTkxYTNlYThkMTgxNDAiLCJpZCI6MzgyOTA1LCJlbWFpbCI6IiIsInVzZXJuYW1lIjoibWF0Y2hhMDAiLCJ1c2VyX3NsdWciOiJtYXRjaGEwMCIsImF2YXRhciI6Imh0dHBzOi8vYXNzZXRzLmxlZXRjb2RlLWNuLmNvbS9hbGl5dW4tbGMtdXBsb2FkL2RlZmF1bHRfYXZhdGFyLnBuZyIsInBob25lX3ZlcmlmaWVkIjp0cnVlLCJ0aW1lc3RhbXAiOiIyMDE5LTA5LTI5IDEwOjAxOjQ0LjgzMjUwOSswMDowMCIsIlJFTU9URV9BRERSIjoiMTcyLjIxLjcuMTQxIiwiSURFTlRJVFkiOiIwOWVhNTkyZTI3NDdhMDczOWU0ODFiYTEwYWRiOWExNCIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwOTYwMH0.iXxewliMadeB4pPhSKURAJIKXkrR2WbQxd-oDBOC0T4; a2873925c34ecbd2_gr_last_sent_cs1=matcha00; Hm_lvt_fa218a3ff7179639febdb15e372f411c=1569595696,1569751196,1570002995; _gid=GA1.2.127855415.1570002996; Hm_lpvt_fa218a3ff7179639febdb15e372f411c=1570003192; a2873925c34ecbd2_gr_cs1=matcha00;',
#             'x-csrftoken' : 'wvurzQRd6RdgAXuFwFlhnRxawA9wDFaG9VYwwJrGMr963q6DDJIxquCAgHtueKoM',
#             'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36',
#             'content-type': 'application/json',
#             'accept': '*/*',
#             'referer': 'https://leetcode-cn.com/problems/add-two-numbers/',
#             'authority': 'leetcode-cn.com',
#             'sec-fetch-site': 'same-origin'}

# payloadData = {"operationName":"questionData","variables":{"titleSlug":"add-two-numbers"},"query":"query questionData($titleSlug: String\u0021) { question(titleSlug: $titleSlug) { content    translatedTitle    translatedContent }}"}

# for question in db.find_all("select * from question"):
#     leetcodeq = {}
#     payloadData["variables"]["titleSlug"] = question['question_title_slug']
#     headers['referer'] = 'https://leetcode-cn.com/problems/' +  question['question_title_slug'] + '/'
#     question_data = requests.post(url,json=payloadData,headers=headers)
#     questions_json = json.loads(question_data.text)
#     leetcodeq.setdefault('question_id',question['question_id'])
#     leetcodeq.setdefault('content',questions_json['data']['question']['content'])
#     leetcodeq.setdefault('content_zh',questions_json['data']['question']['translatedContent'])
#     sql = "INSERT INTO question_details (question_id,content,content_zh) VALUES (%s,%s,%s)"
#     db.cud(sql,tuple(leetcodeq.values()))
#     time.sleep(10)

