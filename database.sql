use lang_app;
show tables;
describe lesson;
alter table languages add constraint foreign key (u_id) references users (u_id); 
