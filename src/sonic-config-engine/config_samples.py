import sys

from ipaddress import ip_interface
from natsort import natsorted

#TODO: Remove once Python 2 support is removed
if sys.version_info.major == 3:
    UNICODE_TYPE = str
else:
    UNICODE_TYPE = unicode

def generate_t1_sample_config(data):
    data['DEVICE_METADATA']['localhost']['hostname'] = 'sonic'
    return data;

def generate_empty_config(data):
    new_data = {'DEVICE_METADATA': data['DEVICE_METADATA']}
    if 'hostname' not in new_data['DEVICE_METADATA']['localhost']:
        new_data['DEVICE_METADATA']['localhost']['hostname'] = 'sonic'
    if 'type' not in new_data['DEVICE_METADATA']['localhost']:
        new_data['DEVICE_METADATA']['localhost']['type'] = 'LeafRouter'
    return new_data

def generate_l2_config(data):
    if 'is_dualtor' in data and data['is_dualtor']:
        is_dualtor = True
        data.pop('is_dualtor')
    else:
        is_dualtor = False
    data['VLAN'] = {'Vlan1000': {'vlanid': '1000'}}
    data['VLAN_MEMBER'] = {}
    if is_dualtor:
        data['DEVICE_METADATA']['localhost']['subtype'] = 'DualToR'
        data['LOOPBACK_INTERFACE'] = {
                                        'Loopback2': {},
                                        'Loopback2|3.3.3.3': {}
                                     }
        data['MUX_CABLE'] = {}
        data['PEER_SWITCH'] = {
                                "peer_switch_hostname": {
                                    "address_ipv4": "1.1.1.1"
                                }
                              }
        data['TUNNEL'] = {
                            "MuxTunnel0": {
                                "dscp_mode": "uniform",
                                "dst_ip": "2.2.2.2",
                                "ecn_mode": "copy_from_outer",
                                "encap_ecn_mode": "standard",
                                "ttl_mode": "pipe",
                                "tunnel_type": "IPINIP"
                            }
                         }

        server_ipv4_base = ip_interface(UNICODE_TYPE('192.168.0.1/32'))
        server_ipv6_base = ip_interface(UNICODE_TYPE('fc02:1000::1/128'))
    for i, port in enumerate(natsorted(data['PORT'])):
        data['PORT'][port].setdefault('admin_status', 'up')
        data['VLAN_MEMBER']['Vlan1000|{}'.format(port)] = {'tagging_mode': 'untagged'}
        if is_dualtor:
            mux_cable_entry = {
                'server_ipv4': str(server_ipv4_base + i),
                'server_ipv6': str(server_ipv6_base + i),
                'state': 'auto'
            }
            data['MUX_CABLE'][port] = mux_cable_entry
    return data

_sample_generators = {
        't1': generate_t1_sample_config,
        'l2': generate_l2_config,
        'empty': generate_empty_config
        }

def get_available_config():
    return list(_sample_generators.keys())

def generate_sample_config(data, setting_name):
    return _sample_generators[setting_name.lower()](data)

