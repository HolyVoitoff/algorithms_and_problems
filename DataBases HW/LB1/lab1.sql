#use lab1_final;

use lab1_final;

select c.cl_name, c.cl_surname, c.passport,
 d.dep_sum, d.dep_startdate,d.dep_enddate,
 oper.op_type,oper.op_sum,oper.op_date,
 i.opr_name,i.opr_surname
 from client as c 
 inner join deposit as d on (c.cl_id = d.client_id) 
 inner join operations as oper on (dep_id = op_id)
 inner join opr_inf as i on (op_id = opr_id)
 order by c.cl_name;



