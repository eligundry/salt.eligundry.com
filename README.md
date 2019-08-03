#------------------------------------------
# Demonstration: salt-desktop integration
#------------------------------------------

1. Fork a random salt-project: https://github.com/eligundry/salt.eligundry.com

2. Do this

` git clone https://github.com/noelmcloughlin/salt.eligundry.com`    <= your fork
` cd salt.eligundry.com/`
` mv pillar configs/`
` mv salt profiles`
` mkdir scripts/`
` curl -o scripts/overlay-salt.sh https://raw.githubusercontent.com/saltstack-formulas/salt-desktop/master/contrib/overlay-salt.sh`
` curl -o scripts/installer.sh https://raw.githubusercontent.com/saltstack-formulas/salt-desktop/master/installer.sh`

3. Add project details to `scripts/installer.sh`

```
    solution['entity']="eligundry"
    solution['repo']="salt.eligundry.com"
    solution['alias']="eligundry"
    solution['targets']="linux-desktop|linux|mac|media-center|server|shared|thinkpad"
```

4. Commit and push changes to your fork.

5. Overlay salt-desktop as follows-

```
curl -o salter.sh https://raw.githubusercontent.com/noelmcloughlin/salt.eligundry.com/master/scripts/installer.sh && sudo bash salter.sh -i bootstrap && sudo bash salter.sh -i salt `
```

6. Run your states:

```
sudo salter.sh -i 'media-center' -u eligundry
```


References:
 1. salt.eligundry.com: https://github.com/noelmcloughlin/salt.eligundry.com
 2. salt-desktop guide: https://github.com/saltstack-formulas/salt-desktop/blob/master/README.rst#integration-recommendation
