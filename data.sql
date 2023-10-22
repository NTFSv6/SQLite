CREATE TABLE tablename(languages TEXT,problem TEXT) -- لانشاء قايمه

-- DROP TABLE tablename حذف كامل للقائمه
DROP TABLE tablename; -- لحذف القائمه كلها

.open filenames.db -- لفتح الملف الذي تريده

.schema -- لاظهار نوع البيانات الذي تم عملها
.mode csv -- لتغير نوع المود المستخدم الي نوع البيانات csv
.import name_file.csv new_name_file -- لسحب البيانات الذي تريدها من الملف الي ملف جديد
SELECT * FROM tablename; -- لاظهار محتوي الجدول كله
SELECT languages FROM tablename; -- لعرض محتوي العمود الذي باسم languages
SELECT languages, problem FROM tablename; -- لعرض اكثر من عمود مع بعض العمود الاول ثم الثاني يمكن العكس ايضا
SELECT UPPER(problem) FROM tablename; -- لتحويل محتوي العمود problem الي حروف كبيره
SELECT LOWER(problem) FROM tablename; -- لتحويل محتوي العمود problem الي حروف صغيره
SELECT COUNT(problem) FROM tablename; -- لمعرف عدد عناصر العمود problem
SELECT COUNT(DISTINCT problem) FROM tablename; -- لمعرفه عدد البيانات الذي لم تتكرر
SELECT Count(*) FROM (SELECT DISTINCT problem FROM tablename); -- لمعرفه عدد البيانات الذي لم تتكرر
SELECT DISTINCT problem FROM tablename; -- لعدم تكرار نفس البيانا   ت المكرره في عمود ال problem
SELECT DISTINCT languages,problem FROM tablename; -- لعدم تكرار نفس البيانات المكرره في عمود ال problem , languages

--@@                                                                                   ( AS ) ALias Keyword
SELECT problem AS namesmall FROM tablename; -- لاختصار الكود كله نستخدم كلمه AS ثم الاسم المختصر 
SELECT CustomerName, (Address || ', ' || PostalCode || ' ' || City || ', ' || Country) AS Address FROM Customers; -- لجمع كذا بيانات مع بعض ونجعل اسمها اي شي نريد
SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customers AS c, Orders AS o WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;
SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName FROM Customers, Orders WHERE Customers.CustomerName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;
SELECT * FROM tablename WHERE languages='SQL'; -- نستخدم WHERE لتطبيق شرط معين

-- ?                                                                          نستخدم NOT دائما لعكس اي فكره 
--! =	Equal	
SELECT * FROM tablename WHERE problem = 5; -- يساوي 5
SELECT * FROM tablename WHERE NOT problem = 5; -- لاتساوي ال 5

--! >	Greater than	
SELECT * FROM tablename WHERE problem < 5; -- اصغر من 5
SELECT * FROM tablename WHERE NOT problem < 5; -- ليست اصغر من ال 5

-- <	Less than	
SELECT * FROM tablename WHERE problem > 5; -- اكبر من 5
SELECT * FROM tablename WHERE NOT problem > 5; -- عكس الفكره الطبيعيه

--! >=	Greater than or equal	
SELECT * FROM tablename WHERE problem >= 5; -- اكبر او يساوي 5
SELECT * FROM tablename WHERE NOT problem >= 5; -- عكس الفكره الطبيعيه

--! <=	Less than or equal	
SELECT * FROM tablename WHERE problem <= 5; -- اصغر او يساوي 5
SELECT * FROM tablename WHERE NOT problem <= 5; -- عكس الفكره الطبيعيه

--! <>	Not equal. Note: In some versions of SQL this operator may be written as !=	
SELECT * FROM tablename WHERE problem <> 5; -- لا تساوي 5
SELECT * FROM tablename WHERE NOT problem <> 5; -- عكس الفكره الطبيعيه

SELECT * FROM tablename WHERE problem != 5; -- لا تساوي 5
SELECT * FROM tablename WHERE NOT problem != 5; -- عكس الفكره الطبيعيه

--! BETWEEN  Between a certain range
SELECT * FROM tablename WHERE problem BETWEEN 10 AND 15; -- لعرض range معين ما بين 10 الي 15
SELECT * FROM tablename WHERE problem NOT BETWEEN 10 AND 15; -- لاستثناء عرض ما بين ال 10 و ال 15 نستخدم NOT
SELECT * FROM tablename WHERE problem BETWEEN 1 AND 20 AND CategoryID IN (1,2,3); -- نستخدم ال IN مع ال BETWEEN بشكل عادي
SELECT * FROM tablename WHERE problem BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni' ORDER BY ProductName;
SELECT * FROM Orders WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31'
SELECT * FROM Products WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni' ORDER BY ProductName;

--! LIKE	Search for a pattern	
SELECT * FROM tablename WHERE problem LIKE 's%'; -- اذا لم تتذكر ما بعد الحرف او نسيت الكلمه LIKE ثم الحرف الذي تتذكره ثم % سوف يبحث علي باقي الحروف الي بعده
SELECT * FROM tablename WHERE problem LIKE '%s'; -- اذا لم تتذكر الحروف الذي في الاول كلمه LIKE وعلامه ال % واخر حرف فقط
SELECT * FROM tablename WHERE problem LIKE '5%'; -- اذا لم تتذكر باقي الارقام الذي تكون بعد ال5 نستخدم ال % 
SELECT * FROM tablename WHERE problem LIKE '%5'; -- اذا لم تتذكر باقي الارقام الذي تكون قبل ال5 نستخدم ال % 
SELECT * FROM tablename WHERE problem NOT LIKE '%5'; -- اذا لم تتذكر باقي الارقام الذي تكون قبل ال5 نستخدم ال % مع استخدام ال NOT نعكس الفكره اي شي لانتهي برقم ال 5 تنطبق علي اي شي عادي

--! IN  To specify multiple possible values for a column
SELECT * FROM tablename WHERE problem IN (4,15,18,19) ; -- استخدم ال IN للبحث عن كلمه او رقم معينونعطي الرقم او الكلمه بداخل ال (Number,String)
SELECT * FROM tablename WHERE languages IN ('SQL','Python') ;
SELECT * FROM tablename WHERE languages NOT IN ('SQL','Python') ; -- للبحث عن اي شي باستثناء SQL , Python

-- AND & OR & NOT ( OR .. تحقيق الشرط الاول او الثاني ) ( AND تحقيق الشرط الاول و الثاني ) ( NOT )
SELECT * FROM tablename WHERE problem = 5 OR problem = 6; -- هنا عند تحقيق اي شرط فيهم باسخدام ال OR
SELECT * FROM tablename WHERE problem = 5 AND problem = 6; -- هنا لتحقيق الشرطين مع بعض باستخدام ال AND
SELECT * FROM tablename WHERE NOT problem = 5 ; -- هنا نستخدم NOT بمعني لو ال problem تساوي ال 5 لا تعرضها
SELECT * FROM tablename WHERE problem != 5 ; -- نستخدم ال != بمعني ان ال problem لو لا تساوي ال 5 اظهرها
SELECT * FROM tablename WHERE NOT problem = 5 OR NOT problem = 6; -- هنا عند تحقيق اي شرط فيهم باسخدام ال OR مع استخدام ال NOT عكس العمليه
SELECT * FROM tablename WHERE NOT problem = 5 AND NOT problem = 6; -- هنا عند تحقيق اي شرط فيهم باسخدام ال AND مع استخدام ال NOT عكس العمليه

SELECT * FROM tablename WHERE languages = 'SQL' AND (problem LIKE 'g%' OR problem LIKE 'R%'); -- لتطبيق كذا شرط مع بعض
SELECT * FROM tablename WHERE languages = 'SQL' AND problem LIKE 'g%' OR problem LIKE 'R%'; -- لتطبيق ولكن سوف يتم اظهار كل البيانات بشكل عادي كذا شرط مع بعض لان تم مسح القوس

SELECT * FROM tablename ORDER BY problem ; -- لترتيب العناصر من الصغير الي الكبير
SELECT languages , problem FROM tablename ORDER BY problem ; -- لترتيب العناصر من الصغير الي الكبير

SELECT * FROM tablename ORDER BY problem ASC; -- لترتيب العناصر من الصغير الي الكبير نستخدم ASC الشكل الطبيعي بتاعها

SELECT * FROM tablename ORDER BY problem DESC; -- لترتيب العناصر من الكبير الي الصغير نستخدم DESC
SELECT languages , problem FROM tablename ORDER BY problem DESC; -- لترتيب العناصر من الكبير الي الصغير نستخدم DESC

-- INSERT INTO .. VALUES 
-- نستخدم ال insert into لوضع قيمه جديده في اخر العمود وعلي حسب القيم يتم اضافتها
INSERT INTO tablename VALUES ('10','Bafflo','Sweet Chees Man');
INSERT INTO tablename(column1,column2,column3) VALUES ('11','Bafflos','Sweet Chees Man'); -- لتحديد العواميد الذي تريد وضع بها ال قيم بتاعتها

INSERT INTO tablename(column1,column2,column3) -- لاضافه اكثر من صف فس نفس الوقت مع تغير بعد البيانات
VALUES ('11','Bafflos','Sweet Chees Man')
VALUES ('12','Bafflos2','Sweet Chees Man2')
VALUES ('13','Bafflos3','Sweet Chees Man3');

-- NULL VALUE 
SELECT * FROM tablename WHERE problem IS NULL; -- لمعرفه هل يوجد عمود او قيمه فارغه ام لا 
SELECT * FROM tablename WHERE problem IS NOT NULL; -- لمعرفه هل لايوجد اي قيمه فارغه ام لا

-- UPDATE column in Tablename
UPDATE tablename SET languages = 'DataBase'; -- لتحديث كل العناصر العمود language بدون تحديد
UPDATE tablename SET languages = 'DataBase' , problem =15 ; -- لتحديث كل العناصر العمود language و عمود ال problem بدون تحديد
UPDATE tablename SET languages = 'DataBase' , problem =15 WHERE problem = 12 ; -- لتحديث عنصر واحد معين عند استخدام ال WHERE 

-- DELETE column in Tablename
DELETE FROM tablename WHERE languages = 'SQL'; -- لحذف شي معين مثل صف الذي به كلمه SQL
DELETE FROM tablename ; -- لحذف جميع الصفوف بشكل كامل

-- LIMIT Number
SELECT * FROM tablename WHERE languages ='Python' LIMIT 4; -- لعرض اول 4 عناصر فقط ويمكننا التحديد كما نريد

-- !                                                                        FUNCTIONS IN SQL
-- MIN(Column) MAX(Column)
SELECT MIN (problem) FROM tablename ; -- لعرض اصغر رقم او اصغر حرف
SELECT MAX (problem) FROM tablename ; -- لعرض اكبر رقم او اكبر حرف

-- SUM(total numeric) Numbers إرجاع المجموع الإجمالي لعمود رقمي جمع العناصر
SELECT SUM(problem) FROM tablename; 
SELECT SUM(problem) FROM tablename WHERE problem=15;

-- AVG(total average Numbers) ارجاع متوسط الحساب
SELECT AVG(problem) FROM tablename;
SELECT AVG(problem) FROM tablename WHERE problem=15;

--  The percent sign ( % ) represents zero, one, or multiple characters & The underscore sign ( _ ) represents one, single character
--? Keyword %
SELECT * FROM tablename WHERE languages LIKE 'a%'; -- للبحث عن ما بعد حرف ال a
SELECT * FROM tablename WHERE languages LIKE '%a'; -- للبحث عن ما قبل حرف ال a
SELECT * FROM tablename WHERE languages LIKE '%a%'; -- للبحث عن ما بعد وقبل حرف ال a
SELECT * FROM tablename WHERE languages LIKE 'a%b'; -- للبحث عن ما بين حرف ال a وحرف ال b
SELECT * FROM tablename WHERE languages NOT LIKE 'a%'; -- للبحث عن شي لايبداء بحرف ال a
--? Keyword _ كل واحده من ال underscore  تساوي حرف انت مش فاكره
SELECT * FROM tablename WHERE languages LIKE 'a_'; -- للبحث عن كلمه من حرفين وتبدا بحرف ال a
SELECT * FROM tablename WHERE languages LIKE '_a'; -- للبحث عن كلمه من حرفين وتنتهي بحرف ال a
SELECT * FROM tablename WHERE languages LIKE '_a_'; -- للبحث عن كلمه من ثلاث حروف قبل وبعد حرف ال a
SELECT * FROM tablename WHERE languages LIKE '_hme_d'; -- هنا نبحث عن كلمه احمد ولكن لا نتذكر بعض الحروف
SELECT * FROM tablename WHERE languages NOT LIKE 'a____'; -- للبحث عن شي لايبداء بحرف ال a من 5 حروف
SELECT * FROM tablename WHERE languages LIKE '_r%'; -- هنا لا اتذكر اول حرف واتذكر الثاني والباقي مجهول

-- INNER JOIN 
SELECT ProductID, ProductName, CategoryName FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;
