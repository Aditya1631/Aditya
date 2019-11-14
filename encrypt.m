candidate_Image=imread('pic.jpeg');
M='secret.txt';
secret=fopen(M,'rb');
[M,L]=fread(secret,'ubit1');

[n,m]=size(candidate_Image);
m=m/3;
if(m*n*3<L)
    msg=msgbox('your image is too small','size error','error','model');
    pause(1);
	if(ishandle(msg))
        close(msg);
	end
end
latest_data=candidate_Image;
count=1;
for i=1:m
	for j=1:n
		for k=1:3
			latest_data(i,j,k)=candidate_Image(i,j,k)-mod(candidate_Image(i,j,k),2)+M(count,1);
			if count==L
				break
			end
			count=count+1;
		end
		if count==L
			break;
		end
	end
	if count==L
		break;
	end
end

imwrite(latest_data,'encrypt_Image.jpg','bmp');

CC=M;
count1=1;
for i=1:m
	for j=1:n
		for k=1:3
			CC(count1)=latest_data(i,j,k)-candidate_Image(i,j,k);
			if count1==L
				break
			end
			count1=count1+1;
		end
		if count1==L
			break;
		end
	end
	if count1==L
		break;
	end
end


