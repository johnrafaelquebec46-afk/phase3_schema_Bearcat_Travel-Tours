USE bearcat_travels;

ALTER TABLE booking
ADD CONSTRAINT fk_booking_customer
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE booking
ADD CONSTRAINT fk_booking_staff
FOREIGN KEY (handled_by) REFERENCES staff(staff_id)
ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE traveler
ADD CONSTRAINT fk_traveler_booking
FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE booking_item
ADD CONSTRAINT fk_item_booking
FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE booking_item
ADD CONSTRAINT fk_item_service
FOREIGN KEY (service_id) REFERENCES service(service_id)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE payment
ADD CONSTRAINT fk_payment_booking
FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE payment
ADD CONSTRAINT fk_payment_staff
FOREIGN KEY (verified_by) REFERENCES staff(staff_id)
ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE booking_change
ADD CONSTRAINT fk_change_booking
FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE booking_change
ADD CONSTRAINT fk_change_staff
FOREIGN KEY (decided_by) REFERENCES staff(staff_id)
ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE customer
ADD CONSTRAINT uq_customer_email UNIQUE (email);

ALTER TABLE service
ADD CONSTRAINT chk_service_base_rate CHECK (base_rate >= 0);

ALTER TABLE service
ADD CONSTRAINT chk_service_deposit_percent CHECK (deposit_percent BETWEEN 0 AND 100);

ALTER TABLE booking
ADD CONSTRAINT chk_booking_total CHECK (total_amount >= 0);

ALTER TABLE booking
ADD CONSTRAINT chk_booking_deposit CHECK (deposit_amount >= 0);

ALTER TABLE booking_item
ADD CONSTRAINT chk_item_pax_qty CHECK (pax_qty > 0);

ALTER TABLE payment
ADD CONSTRAINT chk_payment_amount CHECK (amount > 0);