class BST
{
   
    node* root;

    node* makeEmpty(node* t)
    {
        if(t == NULL)
            return NULL;
        {
            makeEmpty(t->left);
            makeEmpty(t->right);
            delete t;
        }
        return NULL;
    }

    node* insert(string source, string target, node* t)
    {   
        
        
        if(t == NULL)
        {
            t = new node;
            t->key =source;
            t->value=target;
            t->left = t->right = NULL;
        }
        
        else{
          int x; //string priority
          x=source.compare(t->key);
        
        if(x < 0)
            t->left = insert(source,target, t->left);
        else if(x > 0)
            t->right = insert(source,target, t->right);
            
        }
        return t;
    }

    node* findMin(node* t)
    {
        if(t == NULL)
            return NULL;
        else if(t->left == NULL)
            return t;
        else
            return findMin(t->left);
    }

    node* findMax(node* t)
    {
        if(t == NULL)
            return NULL;
        else if(t->right == NULL)
            return t;
        else
            return findMax(t->right);
    }
/*
    node* remove(int x, node* t)
    {
        node* temp;
        if(t == NULL)
            return NULL;
        else if(x < t->key)
            t->left = remove(x, t->left);
        else if(x > t->key)
            t->right = remove(x, t->right);
        else if(t->left && t->right)
        {
            temp = findMin(t->right);
            t->key = temp->key;
            t->right = remove(t->key, t->right);
        }
        else
        {
            temp = t;
            if(t->left == NULL)
                t = t->right;
            else if(t->right == NULL)
                t = t->left;
            delete temp;
        }

        return t;
    } */

    void inorder(node* t)
    {
        if(t == NULL)
            return;
        inorder(t->left);
        cout << t->key << " ";
        inorder(t->right);
    }

    node* find(node* t, string source)
    {   
        
        
        if(t == NULL)
            return NULL;
        else{
        int x; //string priority
        x= source.compare(t->key);
         if(x < 0)
            return find(t->left, source);
        else if(x > 0)
            return find(t->right, source);
        else
            return t;
        }
    }

public:
    BST()
    {
        root = NULL;
    }

  /*  ~BST()
    {
        root = makeEmpty(root);
    }
*/
    void insert(string source, string target)
    {
        root = insert(source, target, root);
    }
/*
    void remove(int x)
    {
        root = remove(x, root);
    }
*/
    void display()
    {
        inorder(root);
        cout << endl;
    }

    node* search(string source)
    {
      
        return find(root, source);
        
    }
};
