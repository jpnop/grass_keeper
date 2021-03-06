typedef struct list_node {
      Member *stack;
      struct list_node *link;
    }node;
     

  class Linked_stack{
    private:
    node *top;
    int size;
    

    public:
      Linked_stack(){
      top=NULL;
      size=0;
      }
      
      
      void push(Member *m){
        node *new_node;
        new_node= new node;

        if(new_node==NULL) return;
        
        // new_node->stack->name=m->name;
        // new_node->stack->id=m->id;
        // new_node->stack->email=m->email;
        new_node->stack = m;
        new_node->link=top;
        top=new_node;
        
        size++;
      }
      
      Member* pop(){
        Member *m;
        node *del;

        m=top->stack;
        del=top;
        top=top->link;
        delete del;
        return m;
      }
      
  };
