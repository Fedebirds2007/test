function onEvent(name, value1, value2)
	if name == 'invert controls' then
            noteTweenAngle("note angle L", 4, 180, 0.5, linear)
            noteTweenAngle("note angle R", 7, 180, 0.5, linear)
            noteTweenAngle("note angle U", 6, 180, 0.5, linear)
            noteTweenAngle("note angle D", 5, 180, 0.5, linear)
            noteTweenX("note movement L", 4, 1068, 0.5, linear) 
            noteTweenX("note movement R", 7, 732, 0.5, linear) 
            noteTweenX("note movement U", 6, 844, 0.5, linear) 
            noteTweenX("note movement D", 5, 956, 0.5, linear)     
        end
end
