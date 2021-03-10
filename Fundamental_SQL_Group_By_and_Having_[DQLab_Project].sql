-- Mendapatkan jumlah nilai pinalty
-- Pada pelayanan terdapat customer yang mendapatkan pinalty yang diakibatkan telat membayar.
-- Carilah customer-customer id dan jumlah pinalty dari yang dibayarkan oleh customer yang mendapatkan pinalty.

SELECT 
	customer_id,
	sum(pinalty) 
FROM invoice
GROUP BY customer_id
HAVING sum(pinalty) > 20000;

-- Mencari customer yang mengganti layanan
-- Dalam pelayanan jaringan internet akan terjadi perubahan paket yang dilakukan oleh konsumen tersebut. Sekarang kita akan mencari konsumen-konsumen yang melakukan perubahan layanannya.
-- Ada 3 table yang dibutuhkan dalam mencari data tersebut: customer, subscription, product
-- Lakukanlah query dengan petunjuk sebagai berikut:
-- Filtrasi dahulu customer_id yang memiliki subscription lebih dari 1 pada table subscription.
-- Kemudian query tersebut digunakan untuk mendapatkan nama customer pada table customer dan lakukan join antara subscription dan product untuk mendapatkan product_name, gunakan function group_concat untuk product_name

SELECT
	Name as name,
	GROUP_CONCAT(t3.product_name) 
FROM customer t1 
JOIN subscription t2 
ON t1.id = customer_id 
JOIN product t3 
ON product_id=t3.ID 
WHERE t1.id IN (select 
                   customer_id 
                FROM subscription 
                GROUP BY customer_id 
                HAVING COUNT(customer_id)>1)
GROUP BY name;