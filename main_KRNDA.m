clear;
load 'D:\knlda\Datasets\coil_5_5_minmax.mat';
result = 0;
number_length = length(Gallery.y);
for  count = 1:10
    k = 10;
    for i = 1 :number_length
      MATRIX.X{i,1} = [Gallery.X{i,1},Probe.X{i,1}];
      MATRIX.y(i,1) = i;
    end
    for  i =1 : length(MATRIX.y)
        num = size( MATRIX.X{i,1},2);
        rd = randperm(num);
        mid =ceil( num / 2);
        Gallery.X{i,1} = MATRIX.X{i,1}(:,rd(1 : mid));
        Probe.X{i,1} = MATRIX.X{i,1}(:,rd( mid : num));
    end

    TR_U = construct_datas(Gallery);
    TE_U = construct_datas(Probe); 

    theta =6;

    k_matrix  = construct_Gassian_kernel(TR_U.X,TR_U.X,theta);
    options = rnn2(k_matrix',TR_U.y',k);
    model = rnnLDA2(k_matrix',TR_U.y',1,options,flag);
    te  = construct_Gassian_kernel(TR_U.X,TE_U.X,theta);
    te_P =te' * model.proj;
    tr_P = model.target_mu;
    TE_U.y = TE_U.y';

    te_length = size(te_P,1);
    tr_length = size(tr_P,1);

    correct = 0;
    for i=1:te_length
        dists=[];
        for j=1:tr_length
            dists(j) =norm(te_P(i,:) -tr_P(j,:));
        end
        [mindist,index]=sort(dists);
        if TE_U.y(i)==model.classes(index(1))
            correct=correct+1;
        end
    end
    acc=(correct/te_length)*100;
    result = result + acc;
end
fprintf('reslut = %f\n',result/count);
