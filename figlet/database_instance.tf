resource "aws_db_subnet_group" "default" {
  name       = "stackx2019-db"
  subnet_ids = ["${aws_subnet.database_tier_ap-southeast-1a.id}", "${aws_subnet.database_tier_ap-southeast-1b.id}"]

  tags = {
    Name = "My DB subnet group"
  }
}


resource "aws_db_instance" "default" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "postgres"
  engine_version = "11.2"
  instance_class = "db.t2.medium"
  name = "${var.owner_name}_db"
  identifier = "${var.owner_name}-db"
  username = "${var.owner_name}_figlet"
  password = "${var.owner_name}_figlet"
  skip_final_snapshot = true
  multi_az = true
  vpc_security_group_ids = ["${aws_security_group.database_tier.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.default.name}"
  storage_encrypted = true
}



