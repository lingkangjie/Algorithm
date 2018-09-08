# Algorithm
Learning and implementating some well-known algorithms
### Finding a matching num in a partial ordered array
7 is in such a matrix, and return True.<br/>
1 2 8 9<br/>
2 4 9 12<br/>
4 7 10  13<br/>
6 8 11  15<br/>
```cpp
class Solution {
public:
    bool Find(int target, vector<vector<int> > array) {
        bool found=false;
        if(!array.empty() && array.size()>0 && array[0].size()>0){
            int row=0;
            int column=array[0].size()-1;
            while(row<array.size() && column>-1){
                if(array[row][column] == target){
                    found=true;break;
                }
                else
                {
                    if(array[row][column]>target)
                        --column;
                    else
                        ++row;
                }
            }
        }
	return found;
    }
};
int a1[] = { 1, 2, 8, 9, };
int a2[] = { 2, 4, 9, 12, };
int a3[] = { 4, 7, 10, 13, };
int a4[] = { 6, 8, 11, 15, };
vector<vector<int>> array;
array.push_back(vector<int>(a1, a1 + 4));
array.push_back(vector<int>(a2, a2 + 4));
array.push_back(vector<int>(a3, a3 + 4));
array.push_back(vector<int>(a4, a4 + 4));
Solution solu;
bool a = solu.Find(1,array);
cout << "result:" << a << endl;
```
### Print list from tail to head
Return a vector, such as 2->4->7->15, return [15,7,4,2]
```cpp
class Solution {
public: 
    vector<int> res;
    vector<int> printListFromTailToHead(ListNode* head) {
        if(head!=NULL){
            if(head->next !=NULL){
            //when head point reaches to the tail, head->next == NULL,and begains to return
                printListFromTailToHead(head->next);}
                // The point begains to return, when head->next=NULL, res[0]=head->val
                res.push_back(head->val); 
                //printf("%d\t",head->val);
            //}  
        }
        return res;
    }
};
```
### Check the number of 1 in a binary data
```cpp
class Solution {
public:
     int  NumberOf1(int n) {
         int num=0;
         while(n){
             n &= (n-1);
             num++;
         }
         return num;
     }
};
```
