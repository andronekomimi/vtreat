library('vtreat')

context("No Y Examples")

test_that("Can transform without Y", {
  dTrainN <- data.frame(x=c('a','a','a','a','b','b','b'),
                        z=c(1,2,3,4,5,NA,7),y=0)
  dTestN <- data.frame(x=c('a','b','c',NA),
                       z=c(10,20,30,NA))
  treatmentsN = designTreatmentsN(dTrainN,colnames(dTrainN),'y',
                                  rareCount=0,rareSig=1)
  dTrainNTreated <- prepare(treatmentsN,dTrainN,pruneSig=1)
  dTestNTreated <- prepare(treatmentsN,dTestN,pruneSig=1)
  
  
  dTrainC <- data.frame(x=c('a','a','a','b','b','b'),
                        z=c(1,2,3,4,5,NA),
                        y=FALSE)
  dTestC <- data.frame(x=c('a','b','c',NA),
                       z=c(10,20,30,NA))
  treatmentsC <- designTreatmentsC(dTrainC,colnames(dTrainC),'y',TRUE,
                                   rareCount=0,rareSig=1)
  dTrainCTreated <- prepare(treatmentsC,dTrainC,
                            pruneSig=1,doCollar=FALSE)
  dTestCTreated <- prepare(treatmentsC,dTestC,
                           pruneSig=1,doCollar=FALSE)
})