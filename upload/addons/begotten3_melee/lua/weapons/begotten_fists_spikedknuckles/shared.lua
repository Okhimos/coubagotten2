SWEP.Base = "sword_swepbase"
-- WEAPON TYPE: Fisted

SWEP.PrintName = "Spiked Knuckles"
SWEP.Category = "(Begotten) Fisted"
SWEP.Author = ""
SWEP.Instructions = "";

SWEP.AdminSpawnable = true
SWEP.Spawnable = true
SWEP.AutoSwitchTo = false
SWEP.Slot = 0
SWEP.Weight = 2
SWEP.UseHands = true

SWEP.HoldType = "wos-begotten_fists"

SWEP.ViewModel = "models/weapons/c_arms.mdl"
SWEP.ViewModelFOV = 50
SWEP.ViewModelFlip = false

--Anims
SWEP.BlockAnim = "a_fists_block"
SWEP.CriticalAnim = "a_fists_attack1"
SWEP.ParryAnim = "a_dual_swords_parry"

SWEP.IronSightsPos = Vector(0, -5, -2)
SWEP.IronSightsAng = Vector(20, 0, 0)

SWEP.LoweredAngles = Angle(-50, 0, 0)

--Sounds
SWEP.AttackSoundTable = "MetalSpikeFistedAttackSoundTable"
SWEP.BlockSoundTable = "FistBlockSoundTable"
SWEP.SoundMaterial = "MetalPierce" -- Metal, Wooden, MetalPierce, Punch, Default

/*---------------------------------------------------------
	PrimaryAttack
---------------------------------------------------------*/
SWEP.AttackTable = "SpikedKnucklesAttackTable"
SWEP.BlockTable = "SpikedKnucklesBlockTable"

function SWEP:CriticalAnimation()

	local attacksoundtable = GetSoundTable(self.AttackSoundTable)
	local attacktable = GetTable(self.AttackTable)
	local owner = self.Owner;

	-- Viewmodel attack animation!
	local vm = owner:GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_uppercut" ) )
	owner:GetViewModel():SetPlaybackRate(0.4)
	
	if (SERVER) then
	timer.Simple( 0.05, function() if self:IsValid() then
	self.Weapon:EmitSound(attacksoundtable["criticalswing"][math.random(1, #attacksoundtable["criticalswing"])])
	end end)	
	owner:ViewPunch(Angle(1,4,1))
	end
	
end

function SWEP:ParryAnimation()
	local vm = self.Owner:GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_uppercut" ))
end

function SWEP:AttackAnimination()
	self:PlayPunchAnimation()
end

function SWEP:HandlePrimaryAttack()

	local attacksoundtable = GetSoundTable(self.AttackSoundTable)
	local attacktable = GetTable(self.AttackTable)

	--Attack animation
	self:TriggerAnim(self.Owner, "a_fists_attack"..math.random(1, 2));

	-- Viewmodel attack animation!
	if (SERVER) then
		self:PlayPunchAnimation();
	end

	timer.Simple( 0.09, function() if self:IsValid() then
	self:EmitSound(attacksoundtable["primarysound"][math.random(1, #attacksoundtable["primarysound"])]) end end)

	self.Owner:ViewPunch(attacktable["punchstrength"])

end

function SWEP:OnDeploy()
	local vm = self.Owner:GetViewModel();
	vm:SendViewModelMatchingSequence(vm:LookupSequence("fists_draw"));
end

function SWEP:PlayPunchAnimation()
	--[[if (SERVER) then
		self.Weapon:CallOnClient("PlayPunchAnimation", "");
	end;]]--

 	if (self.left == nil) then self.left = true; else self.left = !self.left; end;

	local anim = "fists_right";
 
 	if (self.left) then
		anim = "fists_left";
	end;
 
 	local vm = self.Owner:GetViewModel();

 	vm:SendViewModelMatchingSequence(vm:LookupSequence(anim));	self.Owner:GetViewModel():SetPlaybackRate(0.55)

end;

/*---------------------------------------------------------
	Bone Mods
---------------------------------------------------------*/
SWEP.VElements = {
	["v_ironknuckle_left"] = { type = "Model", model = "models/mosi/fallout4/props/weapons/melee/knuckles.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(2, 0.389, 0), angle = Angle(0, -106.364, -92.338), size = Vector(1, 1, 1), material = "", skin = 0, bodygroup = {[0] = 1} },
	["v_ironknuckle_right"] = { type = "Model", model = "models/mosi/fallout4/props/weapons/melee/knuckles.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2, 0.5, -0.201), angle = Angle(0, -106.364, -92.338), size = Vector(1, 1, 1), material = "", skin = 0, bodygroup = {[0] = 1} }
}

SWEP.WElements = {
	["w_ironknuckles_right"] = { type = "Model", model = "models/mosi/fallout4/props/weapons/melee/knuckles.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.099, 0.85, 0.15), angle = Angle(-15.195, 97.013, 85.324), size = Vector(1, 1, 1), material = "", skin = 0, bodygroup = {[0] = 1} },
	["w_ironknuckles_left"] = { type = "Model", model = "models/mosi/fallout4/props/weapons/melee/knuckles.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(2, 0.649, 0.6), angle = Angle(1.169, 90, 111.039), size = Vector(1, 1, 1), material = "", skin = 0, bodygroup = {[0] = 1} }
}