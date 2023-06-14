function onEvent(name, value1, value2)
	if name == 'uninvert' then
            noteTweenAngle("note angle L", 4, 0, 0.5, linear)
            noteTweenAngle("note angle R", 7, 0, 0.5, linear)
            noteTweenAngle("note angle U", 6, 0, 0.5, linear)
            noteTweenAngle("note angle D", 5, 0, 0.5, linear)
            noteTweenX("note movement L", 4, 732, 0.5, linear) 
            noteTweenX("note movement R", 7, 1068, 0.5, linear) 
            noteTweenX("note movement U", 6, 956, 0.5, linear) 
            noteTweenX("note movement D", 5, 844, 0.5, linear)     
        end
end