create or replace procedure addApplication(p_sessionId  In varchar2,
                                           p_title      In varchar2,
                                           p_annotation In varchar2) is
  l_author_id number;
begin

  select s.user_id
    into l_author_id
    from sessions s
   where s.session_id = p_sessionId;

  insert into applications
  values
    (application_seq.nextval, l_author_id, p_title, p_annotation, 'НОВА');
  commit;
end addApplication;




create or replace procedure addBook(p_appId in number) is

  l_book_title varchar2(255);
  l_author_id  number;
  l_annotation varchar2(2000);
begin

  select ap.book_title, ap.author_id, ap.book_annotation
    into l_book_title, l_author_id, l_annotation
    from Applications ap
   where ap.id = p_appId;

  insert into BOOKS
    (id, TITLE, AUTHOR_ID, ANNOTATION)
  values
    (book_sequence.nextval, l_book_title, l_author_id, l_annotation);

  UPDATE Applications a
     SET a.status = 'ОПУБЛІКОВАНА'
   WHERE a.id = p_appId;
   
  commit;
  

end;





create or replace procedure addToOrder(p_sessionId In varchar2,
                                       p_bookId    In number) is
  l_user_id number;
begin

  select s.user_id
    into l_user_id
    from sessions s
   where s.session_id = p_sessionId;

  insert into orders
  values
    (l_user_id, p_bookId);
  commit;

end addToOrder;





create or replace procedure deleteBook(p_bookId In number) is
begin
  delete from BOOKS b
   where b.id = p_bookId;
 

  delete from Orders o
   where o.book_id = p_bookId;
   
    commit;

end deleteBook;






create or replace procedure getAllAuthorInf(p_sessionId   in varchar2,
                                            c_author      out sys_refcursor,
                                            c_application out sys_refcursor,
                                            p_error       out varchar2) is

  l_author_id number(10);
begin
  select s.user_id
    into l_author_id
    from sessions s
   where s.session_id = p_sessionId;

  open c_author for
    select a.id, a.name, a.lastname, a.email, a.phone
      from Authors a
     where a.id = l_author_id;

  open c_application for
    select ap.id, ap.book_title, ap.status
      from Applications ap
     where ap.author_id = l_author_id;

exception
  when no_data_found then
    p_error := 'nosession';
    dummy_cursor(c_author);
    dummy_cursor(c_application);
end;





create or replace procedure getAllUserInf(p_sessionId in varchar2,
                                          c_user      out sys_refcursor,
                                          c_order     out sys_refcursor,
                                          p_error     out varchar2) is

  l_user_id number(10);
begin
  select s.user_id
    into l_user_id
    from sessions s
   where s.session_id = p_sessionId;

  open c_user for
    select u.id, u.name, u.lastname, u.email, u.phone
      from users u
     where u.id = l_user_id;

  open c_order for
    select b.id,
           b.title,
           b.language,
           b.page_amount,
           b.annotation,
           b.price,
           a.name,
           a.lastname
      from orders o
      left join books b
        on (b.id = o.book_id)
      left join authors a
        on (a.id = b.author_id)
     where o.user_id = l_user_id;

exception
  when no_data_found then
    p_error := 'nosession';
    dummy_cursor(c_user);
    dummy_cursor(c_order);
end;




create or replace procedure getApplications(p_sessionId    in varchar2,
                                            c_applications out sys_refcursor) is
  l_user_type varchar2(1);
begin

  select s.user_type
    into l_user_type
    from sessions s
   where s.session_id = p_sessionId;

  if l_user_type = 'a' then
    open c_applications for
      select ap.id, ap.book_title, ap.status, a.name, a.lastname
        from Applications ap
        left join authors a
          on (a.id = ap.author_id)
       order by ap.status DESC;
  else
    dummy_cursor(c_applications);
  end if;

exception
  when no_data_found then
    dummy_cursor(c_applications);
end;



create or replace procedure getAuthors(p_sessionId In varchar2,
                                       c_authors   out sys_refcursor) is
  l_user_type varchar2(1);
begin

  select s.user_type
    into l_user_type
    from sessions s
   where s.session_id = p_sessionId;

  if l_user_type = 'a' then
    open c_authors for
      select a.id, a.name, a.lastname, a.email, a.phone
        from Authors a
       order by a.id;
  else
    dummy_cursor(c_authors);
  end if;

exception
  when no_data_found then
    dummy_cursor(c_authors);
end;
create or replace procedure getOrders(p_sessionId In varchar2,
                                       c_orders   out sys_refcursor) is
  l_user_type varchar2(1);
begin

  select s.user_type
    into l_user_type
    from sessions s
   where s.session_id = p_sessionId;

  if l_user_type = 'a' then
    open c_orders for
      select o.user_id, b.title
        from Orders o
        left join  books b
        on (b.id = o.book_id)
       order by o.user_id;
  else
    dummy_cursor(c_orders);
  end if;

exception
  when no_data_found then
    dummy_cursor(c_orders);
end;



create or replace procedure dummy_cursor(c_cursor out sys_refcursor) is
begin
  open c_cursor for
    select null
      from dual
     where 0 = 1;

end;



create or replace procedure getUsers(p_sessionId In varchar2,
                                     c_users     out sys_refcursor) is
  l_user_type varchar2(1);
begin

  select s.user_type
    into l_user_type
    from sessions s
   where s.session_id = p_sessionId;

  if l_user_type = 'a' then
    open c_users for
      select u.id, u.name, u.lastname, u.email, u.phone
        from Users u
       order by u.id;
  else
    dummy_cursor(c_users);
  end if;

exception
  when no_data_found then
    dummy_cursor(c_users);
end;


create or replace procedure get_Books(c_books out sys_refcursor) is
begin

  open c_books for
    select b.id,
           b.title,
           b.language,
           b.page_amount,
           b.annotation,
           b.price,
           a.name,
           a.lastname
      from books b
      left join authors a
        on (a.id = b.author_id)
     order by b.title;
end;




create or replace procedure isAdmin(p_sessionId in varchar2,
                                    p_isAdmin   out varchar2) is
  l_user_type varchar2(1);
begin

  select s.user_type
    into l_user_type
    from sessions s
   where s.session_id = p_sessionId;

  if l_user_type = 'a' then
    p_isAdmin := 'true';
  else
    p_isAdmin := 'false';
  end if;

end isAdmin;





create or replace procedure loginAdmin(p_sessionId IN varchar2,
                                       p_email     IN varchar2,
                                       p_password  IN varchar2,
                                       p_error     out varchar2) is

  l_admin_id       number;
  l_admin_password varchar2(255);

begin

  select a.id, a.password
    into l_admin_id, l_admin_password
    from ADMINS a
   where a.email = p_email;

  if p_password = l_admin_password then
    begin
      insert into sessions
        (session_id, user_type, user_id)
      values
        (p_sessionId, 'a', l_admin_id);
    exception
      when dup_val_on_index then
        update sessions
           set user_id = l_admin_id, user_type = 'a'
         where session_id = p_sessionId;
    end;
    commit;
    return;
  else
    p_error := 'invalidpassword';
  end if;

exception
  when no_data_found then
    p_error := 'nouser';
  
end;



create or replace procedure loginAuthor(p_sessionId IN varchar2,
                                        p_email     IN varchar2,
                                        p_password  IN varchar2,
                                        p_error     out varchar2) is

  l_author_id       number;
  l_author_password varchar2(255);

begin

  select a.id, a.password
    into l_author_id, l_author_password
    from Authors a
   where a.email = p_email;

  if p_password = l_author_password then
    begin
      insert into sessions
        (session_id, user_type, user_id)
      values
        (p_sessionId, 'w', l_author_id);
    exception
      when dup_val_on_index then
        update sessions
           set user_id = l_author_id, user_type = 'w'
         where session_id = p_sessionId;
    end;
    commit;
    return;
  else
    p_error := 'invalidpassword';
  end if;

exception
  when no_data_found then
    p_error := 'nouser';
  
end;




create or replace procedure loginUser(p_sessionId IN varchar2,
                                      p_email     IN varchar2,
                                      p_password  IN varchar2,
                                      p_error     out varchar2) is

  l_user_id       number;
  l_user_password varchar2(255);

begin

  select u.id, u.password
    into l_user_id, l_user_password
    from USERS u
   where u.email = p_email;

  if p_password = l_user_password then
    begin
      insert into sessions
        (session_id, user_type, user_id)
      values
        (p_sessionId, 'u', l_user_id);
    exception
      when dup_val_on_index then
        update sessions
           set user_id = l_user_id, user_type = 'u'
         where session_id = p_sessionId;
    end;
    commit;
    return;
  else
    p_error := 'invalidpassword';
  end if;

exception
  when no_data_found then
    p_error := 'nouser';
  
end;




create or replace procedure logout(p_sessionid in varchar2) is
begin

  delete from sessions s
   where s.session_id = p_sessionid;
  commit;
end logout;





create or replace procedure registrationAuthor(p_sessionId IN varchar2,
                                               p_name      in varchar2,
                                               p_lastName  in varchar2,
                                               P_email     In varchar2,
                                               p_password  In varchar2,
                                               p_phone     in varchar2,
                                               p_error     out varchar2) is

  l_author_id number;
begin

  select a.id
    into l_author_id
    from Authors a
   where a.email = p_email;

  p_error := 'hasalredysuchemail';

exception
  when no_data_found then
    l_author_id := author_sequence.NEXTVAL;
  
    insert into Authors
    values
      (l_author_id, p_name, p_lastName, P_email, p_password, p_phone);
  
    begin
      insert into sessions
        (session_id, user_type, user_id)
      values
        (p_sessionId, 'w', l_author_id);
    exception
      when dup_val_on_index then
        update sessions
           set user_id = l_author_id
         where session_id = p_sessionId;
    end;
    commit;
  
end registrationAuthor;





create or replace procedure registrationuser(p_sessionId IN varchar2,
                                             p_name      in varchar2,
                                             p_lastName  in varchar2,
                                             P_email     In varchar2,
                                             p_password  In varchar2,
                                             p_phone     in varchar2,
                                             p_error     out varchar2) is
  l_user_id number;
begin

  select u.id
    into l_user_id
    from USERS u
   where u.email = p_email;
   
    p_error := 'hasalredysuchemail';

exception
  when no_data_found then
    l_user_id := user_sequences.NEXTVAL;
    insert into USERS
    values
      (l_user_id,
       p_name,
       p_lastName,
       P_email,
       p_password,
       p_phone);
    begin
      insert into sessions
        (session_id, user_type, user_id)
      values
        (p_sessionId, 'u', l_user_id);
    exception
      when dup_val_on_index then
        update sessions
           set user_id = l_user_id
         where session_id = p_sessionId;
    end;
    commit;
  
end registrationuser;



create or replace procedure saveBook(p_bId         In number,
                                     p_bTitle      In varchar2,
                                     p_bLanguage   In varchar2,
                                     p_bPageAmount In number,
                                     p_bPrice      in float) is

begin

  UPDATE Books b
     SET b.title       = p_bTitle,
         b.language    = p_bLanguage,
         b.page_amount = p_bPageAmount,
         b.price       = p_bPrice
   WHERE b.id = p_bId;
  commit;
end;



create or replace procedure saveStatus(p_satus In varchar2, p_id in number) is
begin

  UPDATE Applications a
     SET a.status = p_satus
   WHERE a.id = p_id;
  commit;

end;
