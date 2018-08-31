#!/bin/bash

kubectl delete service service-sqlinjection

kubectl delete networkpolicy sqlinjection-public

kubectl delete pod sqlinjection

