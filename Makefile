BRANCH=feat_aws_infra_core
MAIN_BRANCH=latest

git-prod:
	@read -p "Enter commit message: " msg; \
	git add . && \
	git commit -m "$$msg" && \
	git push origin $(BRANCH)

merge-prod:
	git checkout $(MAIN_BRANCH) && \
	git pull origin $(MAIN_BRANCH) && \
	git merge $(BRANCH) && \
	git push origin $(MAIN_BRANCH) && \
	git checkout $(BRANCH)

push-and-merge-prod: git-prod merge-prod
