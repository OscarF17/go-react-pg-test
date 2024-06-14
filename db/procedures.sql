CREATE PROCEDURE create_client(
  iname TEXT,
  iphone TEXT,
  iemail TEXT
)
LANGUAGE plpgsl
AS $$
BEGIN
  INSERT INTO clients(name, phone, email) VALUES (iname, iphone, iemail);
END;
$$;
