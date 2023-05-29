library IEEE;
use IEEE.std_logic_1164.all;

entity PARQUEADERO_2 is
	port(
			front_sensor : in std_logic;
			back_sensor	 : in std_logic;
			
			Contrasena: in std_logic_vector(3 downto 0);
			
			Led_rojo, Led_verde: out std_logic;
			
			salida: in std_logic_vector(3 downto 0);
			
			NO_Cars : 	out std_logic_vector(3 downto 0);
			Ocupado1:	out std_logic_vector(3 downto 0);
			Ocupado2:	out std_logic_vector(3 downto 0);
			Ocupado3:	out std_logic_vector(3 downto 0);
			Ocupado4:	out std_logic_vector(3 downto 0);
			Ocupado5:	out std_logic_vector(3 downto 0);
			Ocupado6:	out std_logic_vector(3 downto 0);
			Ocupado7:	out std_logic_vector(3 downto 0);
			Ocupado8:	out std_logic_vector(3 downto 0)
	);
end PARQUEADERO_2;

architecture PARQ_Arch of PARQUEADERO_2 is

	type State_Type is (Pq1,Pq2,Pq3,Pq4,Pq5,Pq6,Pq7,Pq8, NC);
	Signal current_state, next_state	:	State_Type;
	signal bandera: std_logic;
	
begin
Process(front_sensor, back_sensor, current_state, bandera)
	begin
		if (front_sensor = '1' and back_sensor = '0') then
			bandera <= '1';
			current_state <= NC;
		end if;
		if(back_sensor = '1')then
			bandera<= '0';
			current_state<= next_state;
		end if;
end process;

Process(bandera,contrasena, current_state, next_state)
		begin
			if(bandera='1' and contrasena="0001")then
				next_state <= Pq1;
				led_verde <='1';
			end if;
			if(bandera='1' and contrasena="0010")then
				next_state <= Pq2;
				led_verde <='1';
			end if;
			if(bandera='1' and contrasena="0011")then
				next_state <= Pq3;
				led_verde <='1';
			end if;
			if(bandera='1' and contrasena="0100")then
				next_state <= Pq4;
				led_verde <='1';
			end if;
			if(bandera='1' and contrasena="0101")then
				next_state <= Pq5;
				led_verde <='1';
			end if;
			if(bandera='1' and contrasena="0110")then
				next_state <= Pq6;
				led_verde <='1';
			end if;
			if(bandera='1' and contrasena="0111")then
				next_state <= Pq7;
				led_verde <='1';
			end if;
			if(bandera='1' and contrasena="1000")then
				next_state <= Pq8;
				led_verde <='1';
			end if;
			if (bandera ='1' and contrasena = "1001") then
				next_state <= NC;
				led_rojo <='1';
			end if;
			if (bandera ='1' and contrasena = "1010") then
				next_state <= NC;
				led_rojo <='1';
			end if;
			if (bandera ='1' and contrasena = "1011") then
				next_state <= NC;
				led_rojo <='1';
			end if;
			if (bandera ='1' and contrasena = "1100") then
				next_state <= NC;
				led_rojo <='1';
			end if;
			if (bandera ='1' and contrasena = "1101") then
				next_state <= NC;
				led_rojo <='1';
			end if;
			if (bandera ='1' and contrasena = "1110") then
				next_state <= NC;
				led_rojo <='1';
			end if;
			if (bandera ='1' and contrasena = "1111") then
				next_state <= NC;
				led_rojo <='1';
			end if;
			if (bandera ='1' and contrasena = "1001") then
				next_state <= NC;
				led_rojo <='1';
			end if;
end process;

Process(bandera, current_state,contrasena)
	begin
	case (current_state) is
		when NC	=>	NO_Cars <= "0000";
		when Pq1 => if(contrasena="0001") then
							Ocupado1 <="0001";
						end if;
		when Pq2 => if(contrasena="0001") then
							Ocupado2 <="0010";
						end if;
		when Pq3 => if(contrasena="0001") then
							Ocupado3 <="0011";
						end if;
		when Pq4 => if(contrasena="0001") then
							Ocupado4 <="0100";
						end if;
		when Pq5 => if(contrasena="0001") then
							Ocupado5 <="0101";
						end if;
		when Pq6 => if(contrasena="0001") then
							Ocupado6 <="0110";
						end if;
		when Pq7 => if(contrasena="0001") then
							Ocupado7 <="0111";
						end if;
		when Pq8 => if(contrasena="0001") then
							Ocupado8 <="1000";
						end if;
		end case;
end process;

Process(bandera)
			if(bandera='0')then
				Pq1 <= NC;
			end if;
			if(bandera='0')then
				Pq2 <= NC;
			end if;
			if(bandera='0')then
				Pq3 <= NC;
			end if;
			if(bandera='0')then
				Pq4 <= NC;
			end if;
			if(bandera='0')then
				Pq5 <= NC;
			end if;
			if(bandera='0')then
				Pq6 <= NC;
			end if;
			if(bandera='0')then
				Pq7 <= NC;
			end if;
			if(bandera='0')then
				Pq8 <= NC;
			end if;
end process

end PARQ_Arch;