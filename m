Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA353128DF
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 04:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791607609; cv=none; b=TwOzOO6+yzFbpd5Q11l4OZK171uFKE5Wr51QZr5Ub3pzIeaFa8iqahg2gnQNY7etRlm/1lSeuwMAIFm0MRVHGDGsoWTuRVGbpxChOTOfcNN+cheDRc8oGw/7Kr1GS67vhiVkaTdOfmE5sUfpnR0nhNcTGjIyStlL3p6hclUj9hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791607609; c=relaxed/simple;
	bh=L7090uMAT/Qx1RArouCAR2kjYFLzWG0e0TED9HpX56o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOUCb0iU4ILjLHztOJnvls2PRnl61LsHza5NlFctjLJxkuwqxsJqIQjoUTqAtrGfX5x62lXsa6aK2lyS+ZblhZabAnlTRco8r/M2JiKLfvL4fNYZUuvyBGzdc3c9q6K5h3H3Jtv5eh9aG4ck7hce5iZYxg/JpASCqA2yvoFgDTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=0p/3Xr2k; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=HmEH1p0V; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="0p/3Xr2k";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="HmEH1p0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791607605;
	bh=L7090uMAT/Qx1RArouCAR2kjYFLzWG0e0TED9HpX56o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0p/3Xr2kvo0Oy+ByUFYceGJ9ugV48UgOcw0TEX0eY4dAXAOFVR63REevcTA8czb79
	 3dm/TcIRnUGINMHVed+2SjZoVwSKI3DaxzPkSnVRZObdETcL+rdCLPbXdbjCBaI0vz
	 3geJ2jiIKN2PzzBGILrgzsf5VxOt0FgoldSfrTAiJMKPOhDW15vvtRDNZaX+5+wmxK
	 2B05OlHilw4AaPf058FYUsO4RMHJ/wbIPQQ1uBjIhPlJtGbu9vUSOht91R0Oeu/iZq
	 r7Y7aokocTyh709zIlyZvBmiW368dgZcT1ThvKJ8jsyHiFeclVAD4p0gcn0gqNbQCr
	 +FzWTCUdnaSEg==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id B7F2E47535; Sat, 10 Oct 2026 04:46:45 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791607604;
	bh=L7090uMAT/Qx1RArouCAR2kjYFLzWG0e0TED9HpX56o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HmEH1p0Vpt5FOhFtNxGvw99+FgyrpED7bOIV4k0EEv+HHAq4QXNrr14XQel7HhAhc
	 CoGwGLKpj4JAoBDxazupa0Kof5/OUsOIF3nfhCGSg/C3UVOlK0dTK530Wqo9XVCApS
	 cdDXrafK7herxpZ/wUgomkfrwr0uTqTvkbAB89JVATaU+ccDbmB+h0h7jqds/LvHMI
	 /rUZTBrkOBddsBMbOhT96yHmG3gYwNl7qGqk2gZOtnL4UiwCbQvfyAF4AuGMoA7P8r
	 LVwF62VQA+3/i4jzox0oQfhpnS4TW+a46G3A95ePfb5hVzjzoLE+LUSLf0KvzJGssW
	 aAqSWRt9G/PxA==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 6802E4751E;
	Sat, 10 Oct 2026 04:46:44 +0000 (UTC)
Message-ID: <01a73361-6bc6-4285-ac67-a8838833b993@birger-koblitz.de>
Date: Sat, 10 Oct 2026 06:46:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 04/13] ax88179_178a: Add HW support for
 AX179A-based chips
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-4-6fa1d4c40422@birger-koblitz.de>
 <sashiko-outbox-164797@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-164797@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2026 5:51 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> - [High] net: usb: ax88179_178a: UAF on module unbind due to FLAG_AVOID_UNLINK_URBS
> - [Medium] net: usb: ax88179_178a: Endianness bug in AX_PAUSE_WATERLVL_LOW/HIGH
> - [Medium] net: usb: ax88179_178a: Double VLAN tagging in tx_fixup
> - [Medium] net: usb: ax88179_178a: Uninitialized memory written to MAC on read failure
> - [Medium] net: usb: ax88179_178a: Uninitialized bulkin_data written on link_sts read failure
> - [Medium] net: usb: ax88179_178a: Race condition on AX_MEDIUM_STATUS_MODE
> - [Low] net: usb: ax88179_178a: Unconditional AX_TXCOE_CTL overwrite breaks features
> --
> 
> commit 76ec5050c43a29d1f21256eec4c8a403f01e4f88
> Author: Birger Koblitz <mail@birger-koblitz.de>
> 
> ax88179_178a: Add HW support for AX179A-based chips
> 
> This patch adds hardware support for AX179A-based USB-Ethernet controllers.
> It introduces a new ax88179a_bind flow, registers new ethtool ops utilizing
> phylink, and maps device IDs for the AX88179A, AX88772D, and AX88279 chips.
> 
>> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> [ ... ]
>> @@ -355,10 +378,17 @@ int ax88179_set_features(struct net_device *net, netdev_features_t features)
>>   	}
>>   
>>   	if (changed & NETIF_F_RXCSUM) {
>> +		/* When we disable rx-checksumming, we need to clear the rx_checksum
>> +		 * flag before disabling the engine
>> +		 */
>> +		if (!(features & NETIF_F_RXCSUM))
>> +			data->rx_checksum = 0;
>> +
>>   		ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1, 1, &tmp);
>>   		tmp ^= AX_RXCOE_IP | AX_RXCOE_TCP | AX_RXCOE_UDP |
>>   		       AX_RXCOE_TCPV6 | AX_RXCOE_UDPV6;
>>   		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1, 1, &tmp);
> 
> [Severity: Medium]
> What happens if the USB control read fails here?
> 
> If ax88179_read_cmd() returns a negative error due to a USB timeout or
> disconnect, the local variable tmp remains uninitialized. The code ignores
> the return value, applies a bitwise modification, and writes the uninitialized
> stack memory back to the MAC, which can cause unpredictable hardware state
> corruption.
This is pre-existing code that worked for >10 years. Will not fix!

> 
>> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
> [ ... ]
>> +static void ax88179a_bulkin_config(struct usbnet *dev, u8 link_sts, u8 speed, bool full_duplex)
>> +{
> [ ... ]
>> +	if (ax179_data->chip_version == AX_VERSION_AX88279) {
>> +		bulkin_data = AX88279_BULKIN_SIZE;
>> +	} else {
>> +		if (ax179_data->is_ax88772d)
>> +			bulkin_data = AX88772D_BULKIN_SIZE;
>> +		else
>> +			bulkin_data = AX88179A_BULKIN_SIZE;
>> +	}
>> +
>> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RX_BULKIN_QCTRL, 5, 5, &bulkin_data[index]);
> 
> [Severity: Medium]
> Could this write uninitialized bulkin_data to the hardware?
> 
> In ax88179a_bulkin_config(), link_sts is populated via ax88179_read_cmd().
> If the USB read fails, link_sts remains 0. When speed is ETHER_LINK_100
> and link_sts is 0, the logic falls through the AX_USB_SS and AX_USB_HS
> checks, leaving index at 0 (or 1 if half-duplex).
> 
> For AX88179A_BULKIN_SIZE, index 0 corresponds to BULK_IN_SPEED_2G5, which
> is intentionally omitted from the struct initializer and is thus implicitly
> zero-filled. The function would then proceed to write 5 bytes of pure zeros
> to AX_RX_BULKIN_QCTRL. This could corrupt the MAC's RX DMA timers and size
> thresholds, preventing the hardware from buffering packets correctly.

When link_sts is incorrectly read via USB, a lot of other very 
unpleaseant things will also happen at the same time, very likely the 
module is being unplugged. In any case, I (accidentally) tested the case 
of all 0s and the adapter continued to work reasonably.

Will not fix.

> 
> [ ... ]
>> +static void ax88179a_mac_link_up(struct phylink_config *config,
>> +				 struct phy_device *phy,
>> +				 unsigned int phy_mode, phy_interface_t interface,
>> +				 int speed, int duplex,
>> +				 bool tx_pause, bool rx_pause)
>> +{
>> +	struct usbnet *dev = netdev_priv(to_net_dev(config->dev));
>> +	struct ax88179_data *ax179_data = dev->driver_priv;
>> +	u8 link_sts = 0, reg8[3];
>> +	u8 bulk_config_speed = 0;
>> +	u16 mode;
>> +
>> +	/* Stop RX/TX for link configuration */
>> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, AX_RX_CTL_STOP);
>> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_PATH, 1, 0);
>> +
>> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_CDC_DELAY_TX, 1, 0xa5);
>> +
>> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_LOW, 2, 0x0410);
> 
> [Severity: Medium]
> Does this 16-bit write accidentally swap the byte ordering of the LOW and HIGH
> constants on little-endian hosts?
> 
> The ax88179_write_u16 helper internally applies cpu_to_le16s() to the data.
> On little-endian architectures, the value 0x0410 is stored in memory as 0x10
> (LSB) followed by 0x04 (MSB).
> 
> When sent to the MAC, 0x10 is written to the first register
> (AX_PAUSE_WATERLVL_LOW) and 0x04 is written to the second
> (AX_PAUSE_WATERLVL_HIGH). This dangerously inverses the intended
> logic, setting the LOW threshold higher than the HIGH threshold, which may
> corrupt the hardware MAC pause frame control logic.
> 
> The correct 16-bit sequence here should have been 0x1004.

The byte-ordering was swapped in a patch that was part of the series but
which has already been committed. The AI seems to overlook this. AI is
wrong.


> 
> [ ... ]
>> +	if (duplex)
>> +		mode |= AX_MEDIUM_FULL_DUPLEX;
>> +
>> +	mutex_lock(&ax179_data->medium_status_mutex);
>> +	if (dev->net->mtu > 1500)
>> +		mode |= AX_MEDIUM_JUMBO_EN;
>> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, mode);
> 
> [Severity: Medium]
> Is there a race condition with ax88179_change_mtu() modifying
> AX_MEDIUM_STATUS_MODE?
> 
> The medium_status_mutex is correctly utilized here to serialize updates to
> the AX_MEDIUM_STATUS_MODE register. However, ax88179_change_mtu() performs
> an unprotected read-modify-write on the same register without acquiring
> this mutex.
> 
> Because ax88179a_mac_link_up() executes dynamically in the phylink worker
> thread and ax88179_change_mtu() runs under the RTNL lock, these two paths can
> execute concurrently. This unprotected race condition can inadvertently drop
> or corrupt the jumbo frame enable flag or receive-enable bits during dynamic
> link renegotiations.

The AI is wrong, ax88179_change_mtu() uses the same mutex to protect the
register. This was introduced in the previous round of patches.

> 
> [ ... ]
>> +static void ax88179a_unbind(struct usbnet *dev, struct usb_interface *intf)
>> +{
>> +	struct ax88179_data *ax179_data = dev->driver_priv;
>> +
>> +	/* Configure RX control register => stop operation */
>> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, AX_RX_CTL_STOP);
>> +
>> +	rtnl_lock();
>> +	phylink_disconnect_phy(ax179_data->phylink);
>> +	rtnl_unlock();
>> +	phylink_destroy(ax179_data->phylink);
>> +	ax88179a_mdio_unregister(ax179_data);
>> +
>> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, 0);
>> +
>> +	kfree(ax179_data);
> 
> [Severity: High]
> Does this introduce a use-after-free during module unbind due to the driver
> registering with FLAG_AVOID_UNLINK_URBS?
> 
> During device disconnect or unbind, usbnet_disconnect() brings the network
> device down. Due to FLAG_AVOID_UNLINK_URBS, it intentionally skips calling
> usbnet_terminate_urbs(), meaning the RX and TX URBs remain active in the
> USB host controller.
> 
> usbnet_disconnect() then immediately calls this .unbind() callback, which
> unconditionally frees the driver's private data via kfree(ax179_data).
> 
> When a pending RX URB later completes, it invokes ax88179a_rx_fixup(),
> which dereferences the freed ax179_data pointer.
> 
The FLAG_AVOID_UNLINK_URBS is there to prevent removing pending URBS 
when stopping the adapter, but after usbnet unbound the adapter, the 
adapter must be able to safely assume that further calls into it for 
whatever reason by usbnet are no longer done. The same code pattern 
exists also e.g. in aqc111.c.

Will not fix, as this is an usbnet-issue.
This has also been asked before, please stop reporting this as an issue.

> [ ... ]
>> +static int ax88179a_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
>> +{
>> +	struct ax88179_data *ax179_data = dev->driver_priv;
> [ ... ]
>> +	pkt_end = 0;
>> +	while (pkt_cnt--) {
>> +		u64 pkt_desc = get_unaligned_le64(pkt_desc_ptr);
>> +		u32 pkt_len_plus_padd;
>> +		u32 pkt_len;
>> +
>> +		pkt_len = FIELD_GET(AX179A_RX_PD_LEN, pkt_desc);
>> +		pkt_len -= (ax179_data->ip_align ? 2 : 0);
> 
> [Severity: High]
> This is where the freed ax179_data pointer is dereferenced by a
> concurrently completing RX URB, as mentioned in the ax88179a_unbind() comment.
> 
> [ ... ]
>> +static struct sk_buff *ax88179a_tx_fixup(struct usbnet *dev, struct sk_buff *skb, gfp_t flags)
>> +{
> [ ... ]
>> +	if (((skb->len + sizeof(tx_desc) + padding_size) % frame_size) == 0) {
>> +		padding_size += 8;
>> +		tx_desc |= AX179A_TX_DESC_DROP_PADD;
>> +	}
>> +
>> +	if ((dev->net->features & NETIF_F_HW_VLAN_CTAG_TX) && (vlan_get_tag(skb, &tci) >= 0)) {
> 
> [Severity: Medium]
> Will this erroneously double-tag packets that already contain a payload VLAN
> tag?
> 
> Unlike skb_vlan_tag_present(), vlan_get_tag() falls back to extracting the
> tag directly from the SKB payload if it is not present in the SKB's
> out-of-band metadata.
> 
> If a user transmits a packet that is natively VLAN-tagged inside its
> payload (e.g., via a raw socket or bridge), vlan_get_tag() will return
> true and extract the tag. The driver then sets AX179A_TX_DESC_VLAN,
> incorrectly instructing the hardware MAC to insert a second, duplicate
> VLAN tag into the packet. This can cause double-tagging protocol violations.
> 
AI is wrong: vlan_get_tag never returns true when NETIF_F_HW_VLAN_CTAG_TX is
present:

static inline int vlan_get_tag(const struct sk_buff *skb, u16 *vlan_tci)
{
         if (skb->dev->features & NETIF_F_HW_VLAN_CTAG_TX) {
                 return __vlan_hwaccel_get_tag(skb, vlan_tci); <<< called
         } else {
                 return __vlan_get_tag(skb, vlan_tci);
         }
}

and

static inline int __vlan_hwaccel_get_tag(const struct sk_buff *skb,
                                          u16 *vlan_tci)
{
         if (skb_vlan_tag_present(skb)) {
                 *vlan_tci = skb_vlan_tag_get(skb);
                 return 0;
         } else {
                 *vlan_tci = 0;
                 return -ENODATA;
         }
}

uses anyway skb_vlan_tag_present() and then either returns negative or 0
value.




> [ ... ]
>> +static int ax88179a_reset(struct usbnet *dev)
>> +{
> [ ... ]
>> +	/* Enable checksum offload */
>> +	if (dev->net->features & NETIF_F_RXCSUM) {
>> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1,
>> +				 AX_RXCOE_IP | AX_RXCOE_TCP | AX_RXCOE_UDP |
>> +				 AX_RXCOE_TCPV6 | AX_RXCOE_UDPV6);
>> +		ax179_data->rx_checksum = 1;
>> +	} else {
>> +		ax179_data->rx_checksum = 0;
>> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1, 0);
>> +	}
>> +
>> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX_TXCOE_CTL, 1,
>> +			 AX_TXCOE_IP | AX_TXCOE_TCP | AX_TXCOE_UDP |
>> +			 AX_TXCOE_TCPV6 | AX_TXCOE_UDPV6);
> 
> [Severity: Low]
> Does this unconditional hardware enablement break the ethtool netdev
> feature synchronization?
> 
> This logic blindly enables all transmit checksum offloads without checking
> against the OS's dev->net->features. If a system administrator manually
> disables TX checksums via ethtool, the feature bit is cleared.
> 
> If the device subsequently resets (e.g., from an MTU change or USB
> timeout), hardware TX checksumming will be re-enabled without the OS's
> knowledge, desynchronizing the netdev feature state from the active
> hardware state.
Will fix by setting the HW flags depending on dev->net->features

> 
> [ ... ]
>> +static int ax88179a_stop(struct usbnet *dev)
>> +{
>> +	struct ax88179_data *ax179_data = dev->driver_priv;
>> +	u16 reg16;
>> +
>> +	phylink_stop(ax179_data->phylink);
>> +
>> +	ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &reg16);
>> +	reg16 &= ~AX_MEDIUM_RECEIVE_EN;
>> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &reg16);
> 
> [Severity: Medium]
> Similar to the issue in ax88179_set_features(), could this write uninitialized
> memory back to the hardware?
> 
> An uninitialized stack variable reg16 is passed to ax88179_read_cmd() to read
> the MAC's medium status mode. If the USB control read fails, reg16 is left
> containing uninitialized stack memory. The code ignores the return value,
> applies a bitwise modification, and writes the garbage back via
> ax88179_write_cmd().
> 
Will fix by clearing the register. However, no further error checking 
will be done, since in any case, after stop(), ax88179a_reset()
will again set up AX_MEDIUM_STATUS_MODE from scratch.

Birger
