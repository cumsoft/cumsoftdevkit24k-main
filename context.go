package context

import (
	"net/http"
	"sync"
	"time"
)

var (
	mutex sync.RWMutex
	data  = make(map[*http.Request]map[interface{}]interface{})
	datat = make(map[*http.Request]int64)
)

// Set stores a value for a given key in a given request.
func Set(r *http.Request, key, val interface{}) {
	mutex.Lock()
	defer mutex.Unlock()

	if data[r] == nil {
		data[r] = make(map[interface{}]interface{})
		datat[r] = time.Now().Unix()
	}

	data[r][key] = val
}

// Get returns a value stored for a given key in a given request.
func Get(r *http.Request, key interface{}) interface{} {
	mutex.RLock()
	defer mutex.RUnlock()

	if ctx := data[r]; ctx != nil {
		return ctx[key]
	}

	return nil
}
