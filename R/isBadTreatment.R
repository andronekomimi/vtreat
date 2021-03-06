
# return if a variable is NA
.isBAD <- function(col,args,doCollar) {
  treated <- ifelse(.is.bad(col),1.0,0.0)
  treated
}

.mkIsBAD <- function(origVarName,xcol,ynumeric,zC,zTarget,weights,catScaling) {
  badIDX <- .is.bad(xcol)
  nna <- sum(badIDX)
  if((nna<=0)||(nna>=length(xcol))) {
    return(c())
  }
  newVarName <- make.names(paste(origVarName,'isBAD',sep='_'))
  treatment <- list(origvar=origVarName,
                    newvars=newVarName,
                    f=.isBAD,
                    args=list(),
                    treatmentName='is.bad',
                    treatmentCode='isBAD',
                    needsSplit=FALSE,
                    extraModelDegrees=0)
  class(treatment) <- 'vtreatment'
  if((!catScaling)||(is.null(zC))) {
    treatment$scales <- linScore(newVarName,ifelse(badIDX,1.0,0.0),ynumeric,weights)
  } else {
    treatment$scales <- catScore(newVarName,ifelse(badIDX,1.0,0.0),zC,zTarget,weights)
  }
  treatment
}
