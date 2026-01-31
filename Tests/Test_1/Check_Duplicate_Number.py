""" 
Check duplicate items from list A and list B and append to a new list. Using your preferred programming language.
    List A : [1,2,3,5,6,8,9]
    List B : [3,2,1,5,6,0]
"""

List_A = [1, 2, 3, 5, 6, 8, 9]
List_B = [3, 2, 1, 5, 6, 0]
New_List = []
for item in List_B:
    if item in List_A:
        New_List.append(item)

print(f"New list = {New_List}")