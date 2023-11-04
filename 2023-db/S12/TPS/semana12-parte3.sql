-- Active: 1697837619431@@127.0.0.1@3306@pizzeria
/*

Consigna - Parte 1:
La Pizzería “Los Amigos” está incrementando día a día sus ventas ya que los clientes difunden boca a boca la calidad de los productos utilizados en la elaboración. Venden pizzas para cocinar en los hogares, tienen un stock ya elaborado y además cuentan con los ingredientes necesarios para elaborar en el momento lo solicitado por el cliente.
Los pedidos se reciben en el mostrador y telefónicamente. El problema se presenta en los pedidos telefónicos que dada la cantidad no se puede determinar en el momento si ya está elaborado lo que solicita o deberá esperar la elaboración. Por esta razón se los registra y luego son confirmados.

A realizar: 
Procesar el pedido telefónico. Tener en cuenta que:
Cuando un cliente llama y pide productos se genera un registro por cada producto solicitado en la tabla “Telefono”. Quiere decir que si Marcos pidió 1 grande de muzzarella y una individual de faina el registro es:

Consigna - Parte 2:
Los datos a tener en cuenta para el proceso se encuentran en teléfono y que una vez procesados se genera un pedido y este pedido tiene un detalle dado que los productos pueden ser varios.
El pedido siempre es a productos ya elaborados, pero por la demanda es posible que sucedan alguno de los siguientes episodios: existe stock suficiente elaborado o no existe stock elaborado.

A realizar:
Al procesar “Telefono” se debe crear el pedido realizando el insert en “Pedido” y “Detalle”.
Si existe stock suficiente elaborado =>  El insert de la estructura “Detalle” debe DESENCADENAR  el proceso de actualización de stock. Además, se debe crear la “Orden de retiro ” => Hay una sola tupla por PEDIDO, por lo tanto el precio total es por TODO el pedido
No existe stock elaborado => El insert de la estructura “Detalle” debe DESENCADENAR  la creación de la “Orden de elaboración”. 
Si todos los productos del pedido tienen stock colocar el pedido como “Completo”.
*/
use pizzeria;

drop procedure if EXISTS telProcess;
create procedure telProcess()
BEGIN

    declare telephoneId varchar(100);
    declare clientName varchar(100);
    declare clientTel varchar(15);
    declare orderDate date;
    declare orderTime time;
    declare orderVarId int;
    declare orderQuantity int;
    declare orderState varchar(30);
    declare orderId int;
    declare detailId int;
    
    declare clientNameGroup varchar(100);
    declare clientTelGroup varchar(15);

    declare _eof boolean default false;
    declare cur cursor for select idtel, nomCliente, tel, fecha, hora, codvar, cantidad from telefono;
    declare continue handler for not found set _eof = true;

    open cur;

    fetch cur into telephoneId, clientName, clientTel, orderDate, orderTime, orderVarId, orderQuantity;

    while not _eof do

        set orderId = (select max(codpedido)+1 from pedido);
        if orderId is null THEN
            set orderId = 1;
        end if ;

        insert into pedido (codpedido, nomcliente, telefono, fecha, hora) values 
            (orderId, clientName, clientTel, curdate(), curtime());

        set orderState = 'Completo';

        set clientNameGroup = clientName;
        set clientTelGroup = clientTel;
        while not _eof and clientNameGroup = clientName and clientTelGroup = clientTel do

            set clientNameGroup = clientName;
            set clientTelGroup = clientTel;

            set detailId = (select max(iddetalle)+1 from detalle);
            if detailId is null THEN
                set detailId = 1;
            end if ;

            insert into detalle (iddetalle, codpedido, codvar, cantidad) values (detailId, orderId, orderVarId, orderQuantity);
            if not @hayStock THEN
                set orderState = 'En proceso';
            end if;
            --delete from telefono where idtel = telephoneId;
            fetch cur into telephoneId, clientName, clientTel, orderDate, orderTime, orderVarId, orderQuantity;
        end while;
        
        update pedido set estado=orderState where codpedido=orderId;

    end while;

    close cur;
END

drop trigger if exists orderDetailInsert;
create trigger orderDetailInsert after insert on detalle for each row
BEGIN
    declare orderWithdrawalId int;
    declare orderPreparationId int;
    declare orderWithdrawalExist int;
    declare varStock int;
    declare varAmount float;

    select stock, precio into varStock, varAmount from variedad where codVar = new.codVar;

    set orderWithdrawalExist = (select count(*) from ordenRetiro where codpedido=new.codpedido);
    if orderWithdrawalExist>0 then
        update ordenRetiro set pretotal=pretotal+varAmount where codOr = new.codpedido;
    ELSE
        set orderWithdrawalId = (select max(codOr)+1 from ordenRetiro);
        if orderWithdrawalId is null THEN
            set orderWithdrawalId = 1;
        end if;
        insert into ordenRetiro (codOr, codPedido, pretotal) values (orderWithdrawalId, new.codpedido, varAmount);
    end if;
    set @hayStock = true;
    if varStock<new.cantidad then
        set orderPreparationId = (select max(codOe)+1 from ordenela);
        if orderPreparationId is null then
            set orderPreparationId = 1;
        end if;
        insert into ordenEla (codOE, codPedido, codVar, cantidad) values (orderPreparationId, new.codpedido, new.codVar, new.cantidad);
        set @hayStock = false;
    ELSE
        update variedad set stock = stock - new.cantidad where codVar = new.codVar;
    end if;
END

call telProcess();
