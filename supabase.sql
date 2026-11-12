create table disponibilidad (
  id bigint generated always as identity primary key,
  nombre text unique not null,
  disponible boolean not null default true
);

alter table disponibilidad enable row level security;

create policy "todos leen" on disponibilidad for select to anon, authenticated using (true);
create policy "admin cambia disponible" on disponibilidad for update to authenticated using (true) with check (true);

revoke insert, update, delete on disponibilidad from anon, authenticated;
grant update (disponible) on disponibilidad to authenticated;

insert into disponibilidad (nombre) values
('Alitas BBQ'),('Alitas Buffalo'),('Alitas Acevichada'),('Alitas Teriyaki'),('Alitas Maracuya'),('Alitas Spicy'),('Alitas Chimichurri'),('Alitas Aguaymanto'),('Alitas Cheese'),('Alitas Mango Habanero'),('Alitas Salsa Ostión'),('Alitas Anticuchera'),('Alitas Monster'),
('Pack alitas'),
('Maki Charro'),('Maki Spicy'),('Maki Cheese'),('Maki Lomo'),('Maki Ostión'),('Maki Acevichado'),('Maki Chimichurri'),('Maki Teriyaki'),('Maki Furay'),('Maki California'),('Maki Summer'),('Maki Huanca'),
('20 makis'),('30 makis'),('40 makis'),('50 makis'),
('Poke oriental'),('Poke lomo saltado'),('Poke tropical'),('Poke de pollo naranja'),('Poke de chown mei'),
('Ramen de cerdo'),('Ramen de pollo empanizado'),
('Salchipapa huanuqueña'),('Salchipapa Argentina'),('Salchipapa Crispy'),
('Porción de arroz oriental'),('Porción de papas fritas'),
('Coca-Cola 600 ml'),('Inka Cola 600 ml'),('Coca-Cola 1.5 L'),('Inka Cola 1.5 L'),('Bebida frutada'),('Soju');
