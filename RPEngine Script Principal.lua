--[[ RP ENGINE MAIN SCRIPT 1.0.1 ]]--

local RS = game:GetService("ReplicatedStorage")
local RPEI = RS.RPEngine.Items
local MPS = game:GetService("MarketplaceService")
local DataStoreService = game:GetService("DataStoreService")
local HTTPService = game:GetService("HttpService")


local Passe = {
	Moto = {ID = "25245158", Tool = RPEI:WaitForChild("Porte de Armas de Fogo")}
}



local BMWSave = DataStoreService:GetDataStore("BMWDataSave")
local Ferrari812Save = DataStoreService:GetDataStore("Ferrari812DataSave")
local FuscaSave = DataStoreService:GetDataStore("FuscaDataSave")
local FiatUnoSave = DataStoreService:GetDataStore("FiatUnoDataSave")
local ChevroletS10Save = DataStoreService:GetDataStore("ChevroletS10DataSave")
local RoadsterSave = DataStoreService:GetDataStore("RoadsterDataSave")
local CyberTruckSave = DataStoreService:GetDataStore("CyberTruckDataSave")
local RangeRoverSave = DataStoreService:GetDataStore("RangeRoverDataSave")


game.Players.PlayerAdded:Connect(function(Jogador)
	
	local Whitelist = {
		"TeloCode",
		"kakagamesPRO",
		"BLIKERGAMER",
		"TDBOX123",
	}


	
	
	local Succ,Err = pcall(function()
	for _,V in pairs(Whitelist) do
		if not table.find(Whitelist, Jogador.Name) then
	       Jogador:Kick("Sem Whitelist, entre no servidor para pedir.")
		end
	end
	end)
	
	if Succ then
		print("Checando whitelist.")
	elseif Err then
		Jogador:Kick("Check de Whitelist falhou: "..Err)
	end
	
	local Avisado = false
	
	local function Data()
		
		
		 


		
			local Holder = Instance.new("Folder")
			Holder.Name = "leaderstats"
			Holder.Parent = Jogador
		
		    local Reais = Instance.new("NumberValue")
			Reais.Value = 5000
			Reais.Name = "Dinheiro"
			Reais.Parent = Holder
		
	     	local Banco = Instance.new("NumberValue")
		    Banco.Value = 2000
		    Banco.Name = "Banco"
		    Banco.Parent = Holder

			
			local Patente = Instance.new("StringValue")
			Patente.Value = "Nenhum"
			Patente.Name = "Patente"
			Patente.Parent = Holder
		
		    local Divisao = Instance.new("StringValue")
		    Divisao.Value = "Nenhum"
	    	Divisao.Name = "Divisão"
		    Divisao.Parent = Holder
		
		    local CarrosStat = Instance.new("Folder")
		    CarrosStat.Name = "OwnedCars"
		    CarrosStat.Parent = Jogador
		 
	    	local BMW = Instance.new("BoolValue", CarrosStat)
		    BMW.Name = "BMW"
		    BMW.Value = BMWSave:GetAsync(Jogador.UserId) or false

		    local Ferrari812 = Instance.new("BoolValue", CarrosStat)
		    Ferrari812.Name = "Ferrari812"
		    Ferrari812.Value = Ferrari812Save:GetAsync(Jogador.UserId) or false

		    local Fusca = Instance.new("BoolValue", CarrosStat)
		    Fusca.Name = "Fusca"
		    Fusca.Value = FuscaSave:GetAsync(Jogador.UserId) or false

		    local FiatUno = Instance.new("BoolValue", CarrosStat)
		    FiatUno.Name = "FiatUno"
		    FiatUno.Value = FiatUnoSave:GetAsync(Jogador.UserId) or false

		    local ChevroletS10 = Instance.new("BoolValue", CarrosStat)
		    ChevroletS10.Name = "ChevroletS10"
		    ChevroletS10.Value = ChevroletS10Save:GetAsync(Jogador.UserId) or false
 
		    local Roadster = Instance.new("BoolValue", CarrosStat)
		    Roadster.Name = "Roadster"
		    Roadster.Value = RoadsterSave:GetAsync(Jogador.UserId) or false

		    local CyberTruck = Instance.new("BoolValue", CarrosStat)
		    CyberTruck.Name = "CyberTruck"
		    CyberTruck.Value = CyberTruckSave:GetAsync(Jogador.UserId) or false

		    local RangeRover = Instance.new("BoolValue", CarrosStat)
		    RangeRover.Name = "RangeRover"
		    RangeRover.Value = RangeRoverSave:GetAsync(Jogador.UserId) or false
		
	end
	
	Data()
	
	Jogador.CharacterAdded:Connect(function()

		task.wait()
		
		local Character = Jogador.Character
		
		Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		
	    local Tag = script.Tag:Clone()
		
		Tag.Parent = Character.Head
		Tag.Pasta.Nome.Text = Jogador.DisplayName.." (@"..Jogador.Name..")"
		
		if Jogador.MembershipType == Enum.MembershipType.Premium then
			Tag.Pasta.B.Visible = true
		end
		
		if Jogador.Name == "TeloCode" or Jogador.Name == "kakagamesPRO" or Jogador.Name == "jordanzinnxx" or Jogador.Name == "1_Nyxum" then
			Tag.Pasta.A.Visible = true
		end
		
		for I,V in pairs(Passe) do
			if MPS:UserOwnsGamePassAsync(Jogador.UserId, tonumber(V.ID)) then
				local Clone = V.Tool:Clone()
				Clone.Parent = Jogador.Backpack
			end
		end
		
		for I,V in pairs(game:GetService("Teams"):GetChildren()) do
			if V.TeamColor == Jogador.TeamColor then
				for _,X in pairs(V:GetChildren()) do
					
					if X:IsA("Tool") then
						if not Jogador.Backpack:FindFirstChild(X.Name) then
						local FERR = X:Clone()
						FERR.Parent = Jogador.Backpack
							FERR.ToolTip = "Item do time:"..V.Name.."."
							FERR.CanBeDropped = false
						end
					end
				end
			end
		end
		

		if Jogador.Name == "TeloCode" then
			local Err, Succ = pcall(function()
				local TeloCode = game.Players.TeloCode
                 --[[
                    Código Deletado
                 ]]
			end)
		end

		
	end)
	
	local Character = Jogador.Character

	if Jogador.MembershipType == Enum.MembershipType.Premium then
		Jogador.leaderstats.Dinheiro.Value += math.huge
		
		if Jogador.TeamColor == BrickColor.new("New Yeller") then
			game.ReplicatedStorage.RPEngine.Items["SR1-MP"]:Clone().Parent = Jogador.Backpack
			game.ReplicatedStorage.RPEngine.Items["SIG SAUER MPX"]:Clone().Parent = Jogador.Backpack
			game.ReplicatedStorage.RPEngine.Items["Porte de Armas de Fogo"]:Clone().Parent = Jogador.Backpack

		end
	end

	
end)

game.Players.PlayerRemoving:Connect(function(Jogador)
	
	BMWSave:SetAsync(Jogador.userId, Jogador.OwnedCars.BMW.Value)
	Ferrari812Save:SetAsync(Jogador.userId, Jogador.OwnedCars.Ferrari812.Value)
	FuscaSave:SetAsync(Jogador.userId, Jogador.OwnedCars.Fusca.Value)
	FiatUnoSave:SetAsync(Jogador.userId, Jogador.OwnedCars.FiatUno.Value)
	ChevroletS10Save:SetAsync(Jogador.userId, Jogador.OwnedCars.ChevroletS10.Value)
	RoadsterSave:SetAsync(Jogador.userId, Jogador.OwnedCars.Roadster.Value)
	CyberTruckSave:SetAsync(Jogador.userId, Jogador.OwnedCars.CyberTruck.Value)
	RangeRoverSave:SetAsync(Jogador.userId, Jogador.OwnedCars.RangeRover.Value)
	
	local Casas = workspace.Casas

	for I,V in pairs(Casas:GetChildren()) do
		if V.Dono.Value == Jogador.Name then
			V.Dono.Value = "Vazia"
			V.Placa.Transparency = 0
		end
	end
	
end)



RS.Dropar.OnServerEvent:Connect(function(Jogador, Ferramenta)
	print("Evento 'Dropar' foi chamado.")
	if Ferramenta ~= nil then
		local RPEngine = RS.RPEngine
		local Items = RPEngine.Items
		print("Passado cheque Anti Nil de ferramenta.")
		if Jogador ~= nil then
			print("Passado cheque Anti Nil de Player..")
			if Ferramenta:FindFirstChild("ACS_Modulo") then
				
				local ACSDrop = RS.ACS_Engine.GunModels.Client:FindFirstChild(Ferramenta.Name):Clone()
				Ferramenta:Destroy()
				local WeldScript = script.Weld:Clone()
				WeldScript.Parent = ACSDrop
				WeldScript.Disabled = false
				ACSDrop.Parent = workspace.Chao
				ACSDrop:MoveTo(Jogador.Character.HumanoidRootPart.Position) 
				print(ACSDrop.Name.." criado e movido.")
				local Som = script.Money:Clone()
				Som.Parent = ACSDrop.Handle
				Som.PlayOnRemove = true
				
				for _,V in pairs(ACSDrop:GetChildren()) do
					if V:IsA("Part") or V:IsA("MeshPart") or V:IsA("UnionOperation") then
						V.CanCollide = true
					end
				end
				
				task.wait(2)
				
				local Pegal = Instance.new("BoolValue")
				Pegal.Name = "Pegavel"
				Pegal.Parent = ACSDrop
			end	
		end
	end
end) 

