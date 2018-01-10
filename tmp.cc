// (set-default-font "Consolas-11")
// (setq c-basic-offset 4)
// (setq c-basic-style "linux")
#include <cstdio>
#include <climits>
#include <cstring>
#include <algorithm>
#include <iostream>

struct Node *root = NULL;

struct Node
{
    Node *ch[2], *fa;
    int val, cnt, size;

    Node(int x): val(x), cnt(1), size(1)
    {
        ch[0] = ch[1] = fa = NULL;
    }

    Node(): val(0), cnt(0), size(0)
    {
        ch[0] = ch[1] = fa = NULL;
    }

    int scale()
    {
        return 1 + (ch[0]? ch[0]->size : 0);
    }

    bool dir()
    {
        return (fa? fa->ch[1] == this : 0);
    }

    void update()
    {
        size = cnt +
            ((ch[0]? ch[0]->size : 0) +
             (ch[1]? ch[1]->size : 0));
    }
};

void rotate(Node *x)
{
    Node *y = x->fa;
    bool d = x->dir();
    if(y->fa) {
        y->fa->ch[y->dir()] = x;
        x->fa = y->fa;
    } else {
        x->fa = NULL;
    }
    if(x->ch[d ^ 1]) {
        x->ch[d ^ 1]->fa = y;
        y->ch[d] = x->ch[d ^ 1];
    } else {
        y->ch[d] = NULL;
    }
    x->ch[d ^ 1] = y;
    y->fa        = x;
    x->update();
    y->update();
}

void splay(Node *x)
{
    for(Node *y = x->fa, *z;
        y and (z = y->fa); y = x->fa) {
        rotate(x->dir() == y->dir()? y : x);
        rotate(x);
    }
    if(x->fa) rotate(x);
    root = x;
}

Node* find_by_value(Node *x, int key)
{
    return (x->val == key?
            x :
            (x->val < key?
             find_by_value(x->ch[1], key) :
             find_by_value(x->ch[0], key)));
}

Node* find_by_rank(Node *x, int key)
{
    return (x->scale() <= key and x->scale() + x->cnt > key?
            x :
            (x->scale() > key?
             find_by_rank(x->ch[0], key) :
             find_by_rank(x->ch[1], key - x->scale() - x->cnt + 1)));
}

Node* predecessor(Node *x, int key, Node *res = NULL)
{
    return (x->val < key?
            (x->ch[1]?
             predecessor(x->ch[1], key, x) :
             x) :
            (x->ch[0]?
             predecessor(x->ch[0], key, res) :
             res));
}

Node* successor(Node *x, int key, Node *res = NULL)
{
    return (x->val <= key?
            (x->ch[1]?
             successor(x->ch[1], key, res) :
             res) :
            (x->ch[0]?
             successor(x->ch[0], key, x) :
             x));
}

void insert(Node *x, int key)
{
    if(root == NULL) {
        root = new Node(key);
    } else {
        while(true) {
            bool d = x->val < key;
            if(x->ch[d]) x = x->ch[d];
            else break;
        }

        bool d = x->val < key;
        x->ch[d] = new Node(key);
        x->ch[d]->fa = x;
        splay(x);
    }
}

void remove(Node *x)
{
    splay(x);
    if(x->ch[0] == NULL) {
        root = x->ch[1];
        if(root) root->fa = NULL;
    } else {
        x->ch[0]->fa = NULL;
        splay(predecessor(x->ch[0], INT_MAX));
        root->ch[1] = x->ch[1];
        if(x->ch[1]) x->ch[1]->fa = root;
    }
    delete x;
}

void traversal(Node *x) {
    std::cerr << "(" << x->val << ")" << std::endl;
    if(x->ch[0]) traversal(x->ch[0]);
    if(x->ch[1]) traversal(x->ch[1]);
}

int main(void)
{
    int cmd, key;

    while(std::scanf("%d%d", &cmd, &key) != EOF)
        switch(cmd) {
        case 1:
            insert(root, key);
            break;
        case 2:
            remove(find_by_value(root, key));
            break;
        case 3:
            splay(find_by_value(root, key));
            std::printf("%d\n", root->scale());
            break;
        case 4:
            splay(find_by_rank(root, key));
            std::printf("%d\n", root->val);
            break;
        case 5:
            std::printf("%d\n", predecessor(root, key)->val);
            break;
        case 6:
            std::printf("%d\n", successor(root, key)->val);
            break;
        default:
            traversal(root);
        }

    return 0;
}
