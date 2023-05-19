base_dir=Projects/Neural

urlCapture=git@github.com:NeuralStar/NeuralCapture.git
urlAI=git@github.com:NeuralStar/Prod_NeuralStart.git
urlServer=git@github.com:NeuralStar/PyCapture.git

mkdir -p $base_dir
cd $base_dir

git clone $urlCapture Capture
git clone $urlAI AI
git clone $urlServer Server

python3 -m venv .env
source .env/bin/activate
pip3 install -r AI/requirements.txt

make -C Capture
