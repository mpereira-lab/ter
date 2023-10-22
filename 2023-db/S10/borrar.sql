-- Active: 1697997550092@@127.0.0.1@3306@taller
select p.NPresup, p.Monto as total, p.monto - if(monto_repuesto is null, 0, monto_repuesto), monto_repuesto as  monto_mano_obra
    from presup p left outer join (
        select pr.NPresup, sum((pr.cant * r.precio)) as monto_repuesto
            from presurep pr inner join repuesto r on pr.codRep=r.codRep
            group by pr.NPresup
    ) t on p.NPresup=t.NPresup