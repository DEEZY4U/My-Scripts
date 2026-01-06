if ! tmux has-session -t devel@1
then
	tmux new-session -s devel@1 -n editor -d
	tmux send-keys -t devel@1 'cd ~/Desktop/DevBase' C-m
	tmux send-keys -t devel@1 'nvim' C-m
	tmux split-window -v -p 20 -t devel@1
	tmux send-keys -t devel@1:1.2 'cd ~/Desktop/DevBase' C-m
	tmux new-window -n console -t devel@1
	tmux send-keys -t devel@1:2 'cd ~/Desktop/DevBase' C-m
	tmux select-window -t development:1
fi
tmux attach -t devel@1
