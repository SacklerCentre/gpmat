function gp_gridwrite(name,dat,precstr)

if nargin < 3 || isempty(precstr)
	precstr = '\t%8d\t%8d\t%24.12f\n';
end

if iscell(dat)
	assert(isvector(dat),'data must be a cell vector');
end

fd = fopen([name '.dat'],'w');
assert(fd>0,'failed to open file ''%s.dat'' for writing',name);

if iscell(dat)
	c = length(dat);
	for s=1:c
		gp_gridwrite1(fd,dat{s},precstr)
		if s ~= c
			fprintf(fd,'\n\n');
		end
	end
else
	gp_gridwrite1(fd,dat,precstr)
end

fclose(fd);

function gp_gridwrite1(fd,dat,precstr)

dat = flipdim(dat',2);

[r,c] = size(dat);
for i=1:r
	for j=1:c
		fprintf(fd,precstr,i,j,dat(i,j));
		fprintf(fd,precstr,i,j+1,dat(i,j));
	end
	fprintf(fd,'\n');
	for j=1:c
		fprintf(fd,precstr,i+1,j,dat(i,j));
		fprintf(fd,precstr,i+1,j+1,dat(i,j));
	end
	fprintf(fd,'\n');
end