#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <set>

using namespace std;

const set<pair<char, char>> pairs{
    {'A', 'U'},
    {'U', 'A'},
    {'C', 'G'},
    {'G', 'C'},
};

bool E(const vector<vector<int>> & edges, int a, int b){
    for (int i : edges[a]){
        if (i == b){
            return true;
        }
    }
    return false;
}

vector<vector<int>> subgraph(const vector<vector<int>> & edges, int a, int b){
    vector<vector<int>> result;
    int num_vertices = b - a + 1;
    result.resize(num_vertices);
    for (int i = 0; i < num_vertices; i++){
        int vertex_a = i + a;
        for (int v: edges[vertex_a]){
            if (v-a >= 0 && v-a < num_vertices){
                result[i].push_back(v-a);
            }
        }
    }
    return result;
}

int recursive_n(const vector<vector<int>> & edges){
    if (edges.size() == 0){
        return 1;
    }
    int graph_size = edges.size();
    int x = graph_size / 2;
    int result = 0;
    for (int k = 1; k < graph_size; k += 2){
        if (E(edges, 0, k)){
            result += recursive_n(subgraph(edges, 1, k - 1)) * recursive_n(subgraph(edges, k + 1, graph_size - 1));
        }
    }
    return result;
}

int main(){
    
    string s;
    cin >> s;
    int n = s.size();
    vector<vector<int>> edges;
    edges.resize(n);
    for (int i = 0; i < n; i++){
        char codon = s[i];
        for (int j = 0; j < n; j++){
            char anticodon = s[j];
            if (pairs.contains(make_pair(codon, anticodon))){
                edges[i].push_back(j);
            }
        }
    }
    
    cout << recursive_n(edges);

    return 0;
}