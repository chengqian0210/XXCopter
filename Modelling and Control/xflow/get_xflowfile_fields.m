% Creaci�n de campos de informaci�n de archivo desde formato DBX v1

function fields = get_xflowfile_fields(filename)

% % % %     filename    = 'dbx_v1_s50_r16_am3_bm4_da20_dem5_drm50.txt'
    size_str = size(filename,2);
    dim_counter = 1;
    for i = 1:size_str

        if filename(1,i) == '_'

            counter(dim_counter,1) = i;
            dim_counter = dim_counter + 1;

        end
    end

    if dim_counter ~= 9
        error ('Archivo mal formateado')
    end

    fields.speed      = str2double(filename(1,counter(2,1)+2:counter(3,1)-1));
    fields.resolution = str2double(filename(1,counter(3,1)+2:counter(4,1)-1));

    if strcmp(filename(1,counter(4,1)+2),'m') < 0.5
        fields.alfa = str2double(filename(1,counter(4,1)+2:counter(5,1)-1));
    else
        fields.alfa = -str2double(filename(1,counter(4,1)+3:counter(5,1)-1));
    end

    if strcmp(filename(1,counter(5,1)+2),'m') < 0.5
        fields.beta = str2double(filename(1,counter(5,1)+2:counter(6,1)-1));
    else
        fields.beta = -str2double(filename(1,counter(5,1)+3:counter(6,1)-1));
    end

    if strcmp(filename(1,counter(6,1)+3),'m') < 0.5
        fields.delta_a = str2double(filename(1,counter(6,1)+3:counter(7,1)-1));
    else
        fields.delta_a = -str2double(filename(1,counter(6,1)+4:counter(7,1)-1));
    end

    if strcmp(filename(1,counter(7,1)+3),'m') < 0.5
        fields.delta_e = str2double(filename(1,counter(7,1)+3:counter(8,1)-1));
    else
        fields.delta_e = -str2double(filename(1,counter(7,1)+4:counter(8,1)-1));
    end

    if strcmp(filename(1,counter(8,1)+3),'m') < 0.5
        fields.delta_r = str2double(filename(1,counter(8,1)+3:size_str-4));
    else
        fields.delta_r = -str2double(filename(1,counter(8,1)+4:size_str-4));
    end

end