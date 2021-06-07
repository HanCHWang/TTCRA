% clear all
% clc

%%
%use random matrix
% for i=1:10
% %     W=diag(10*rand(100,1));
%     W=rand(100,100);
% %     W=diag(rand(169,1));
%     [TValue(i),Ttime(i)]=TTCRA(W);
%     [FValue(i),Ftime(i)]=fmincon_QAP(W);
% end

%     W=rand(400,400);
%     W=W-min(real(eig(W)))*diag(ones(400,1));
%     [TValue,Ttime]=TTCRA(W);
%%
%use qaplib
% fileFolder=fullfile('qapdata');
%  
% dirOutput=dir(fullfile(fileFolder,'*.dat'));
%  
% fileNames={dirOutput.name};
% 
% % for i=1:size(fileNames,2)
% %     dataName=fileNames{i};
% %     nameIndex=find('.'==dataName);
% %     tmpName=dataName(1:nameIndex);
% %     tmpData=readtable(['qapdata/',dataName]);
% %     tmpData=tmpData{:,:};
% %     A=tmpData(1:size(tmpData,2),:);
% %     B=tmpData(size(tmpData,2)+1:2*size(tmpData,2),:);
% %     W=kron(A,B);
% %     [TValue(i),Ttime(i)]=TTCRA(W);
% %     [FValue(i),Ftime(i)]=fmincon_QAP(W);
% %     
% % end
% 
opts = detectImportOptions(['qapdata/','Esc32e.dat'],  'ConsecutiveDelimitersRule', 'join');
tmpData = readmatrix(['qapdata/','Esc32e.dat'], opts);
    A=tmpData(1:size(tmpData,2),:);
    B=tmpData(size(tmpData,2)+1:2*size(tmpData,2),:);
    W=kron(B,A);
%     W=rand(400,400);
%     W=W-min(real(eig(W)))*diag(ones(size(tmpData,2)^2,1));
    [TValue,Ttime]=TTCRA(W);
%     figure
%     plot(Bur26aeig);
%     hold on
%     plot(Bur26heig);
%     hold on
%     plot(Esc16aeig);
%     hold on
%     plot(Kra32eig);
%     hold on
%     plot(Rand20eig);
%     hold on
%     plot(Nug27eig);
%     hold on
%     plot(Wil100eig);
%     hold off
%     
%     legend('Bur26a','Bur26h','Esc16a','Kra32','Rand20','Nug27','Wil100');
%     [FValue,Ftime]=fmincon_QAP(W);

%% figure
% plot(TValue);
% hold on
% plot(FValue);
% hold off
% xlabel('iteration');
% ylabel('value');
% legend('TTCRA','fmincon')
% 
% figure
% plot(Ttime);
% hold on
% plot(Ftime);
% hold off
% xlabel('iteration');
% ylabel('time');
% legend('TTCRA','fmincon')