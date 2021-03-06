Vector2 = require 'Vector2' -- include 2d vector lib 

function onFinishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 1000
    local trueCoords = current + range
	
	-- "EzrealMysticShotMissile" is not the name, if someone knows it please write it
    addProjectile("EzrealEssenceFluxMissile", trueCoords.x, trueCoords.y);
	printChat("You used W");
end

function applyEffects()

    local abilityPower = getOwner():GetStats().AbilityPower
    local damage = getEffectValue(0) + 0.8 * abilityPower.Total
    dealPhysicalDamage(damage)
	
    -- TODO this can be fetched from projectile inibin "HitEffectName"
	
	-- This is not the name of the particle, if someone knows it please write it
	addParticleTarget("Ezreal_essenceflux_tar.troy", getTarget())

    destroyProjectile()
end
