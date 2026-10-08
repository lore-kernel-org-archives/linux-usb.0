Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2562118E025
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 03:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430904; cv=none; b=WUDVANztS/gT7SjX6sPWloc25NzHDGfSE32vPzPrgwEQC/UGgJM6PAt880uYtWmZbaS7wn2zYlFbE7o87zRmCf7/4h8L/awY3DoR1mrmrxWYjwNz+zEyAD4hMjuyRTeS8awwsveoINthgFkVOXi7Lpdm7Xn7Np8W/nSBfCVR5t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430904; c=relaxed/simple;
	bh=8WRr6DD7gx0RQQySOh6Yz7KIh163pK+3jDf0PQFVh+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KOju/kidaoal0cYVyzgObusZri5oEc8zbFfSTipMVMq7vW4SSiFwriST1e/DtZwOF3DKYbHjw+6KKANjan3AMgEL6OSGFfkFPdATR2qg6cCmLSQ5JaCYBs4eTC6zdxyIiMD4SXEgjwEK3aqmon4ns2q3H4CwqlgOb6wz98aL93E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=g0heGDu8; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=rlHahG/w; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="g0heGDu8";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="rlHahG/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791430901;
	bh=8WRr6DD7gx0RQQySOh6Yz7KIh163pK+3jDf0PQFVh+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g0heGDu8NIdSkdf7ektmIXLyn583uuATSBaGxbpATLAEAREX1Lx4OgeOJAXKRkfnl
	 +zGrNTj85LKb6349Myj2FtfxyYajOl1H9CQOhkxjEPV30yzrMyb2qATTIuhmP/xF4P
	 KyQuOZbHHUL3r0fy3nJWI6yOfqsC8YZFxk6YP6+7kZQIZyReIdwaQjsVeM8l4hpcsK
	 rMRGXjWwCozWcW6zhejPncW91ySKBgyDRMiN7S9neqsN/B4eGhmZk0Sy5H1A4YVRCQ
	 V+X/Sd4ZuT7XEKaiXaGGRV3KQwVJ112F0/tlwNYgAQIGQFWTm/jGmRBSWMjgeanQzt
	 POu7m/Ytw8XQA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 44741470CF; Thu,  8 Oct 2026 03:41:41 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791430900;
	bh=8WRr6DD7gx0RQQySOh6Yz7KIh163pK+3jDf0PQFVh+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rlHahG/wfVexoZdhab/AV4s1gw0cd1ZcOx/2WZrQt9eyZNG4SS6tzKWNzLXZPakB+
	 23m/u93BfNgwKeTMhd2logH8fgQpzw27wpULOCKaY9pVG0JAJl0Sqb9Ms7Mbe2d8m/
	 F4NR/Uf7zSxVqVppUV5/2tWuJUyAFc0pkGM6+dE28DzjREh4cWtk6AL1dLr0mkeZny
	 Ye+EjUXv3KCF4IogOnuKsVXnrCadnBLWcvOdEpFl/Vrk4dDfKMWEQR9UPZaNlXCcQi
	 +b1kOPromW5R7Jdxk9SzqyIBECzfkfqn6J+z+R3lgrmokWJZbjTk7pVmYO93sowU3m
	 KWp84DFzjmdPA==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id AB6D341186;
	Thu,  8 Oct 2026 03:41:40 +0000 (UTC)
Message-ID: <931435fc-5ae2-476c-97ab-082486303323@birger-koblitz.de>
Date: Thu, 8 Oct 2026 05:41:40 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v17 04/13] ax88179_178a: Add HW support for
 AX179A-based chips
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-4-252814fe35ea@birger-koblitz.de>
 <sashiko-outbox-162610@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-162610@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 5:05 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] net: usb: ax88179_178a: AB-BA deadlock between rtnl_lock and phylink_resolve
> - [High] net: usb: ax88179_178a: direct modification of cloned SKB in tx_fixup corrupts data
> - [High] net: usb: ax88179_178a: unaligned memory access in rx_fixup when parsing descriptors
> - [Medium] net: usb: ax88179_178a: missing MAC_10 capability for AX88279 prevents 10Mbps links
> --
> 
> commit 30ef18704c5826b2296627db92bef2b5bafb38bf
> Author: Birger Koblitz <mail@birger-koblitz.de>
> Subject: ax88179_178a: Add HW support for AX179A-based chips
> 
> This patch adds bindings and hardware support for AX179A-based USB-Ethernet
> controllers, including the AX88279, AX88179A/B, and AX772D/E. It introduces
> a vendor interface that can be activated to take precedence over CDC-NCM.
> 
>> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/net/usb/ax88179a_devices.c
> [ ... ]
>> +static void ax88179a_mac_link_up(struct phylink_config *config,
>> +				 struct phy_device *phy,
>> +				 unsigned int phy_mode, phy_interface_t interface,
>> +				 int speed, int duplex,
>> +				 bool tx_pause, bool rx_pause)
>> +{
> [ ... ]
>> +	if (duplex)
>> +		mode |= AX_MEDIUM_FULL_DUPLEX;
>> +
>> +	rtnl_lock();
>> +	if (dev->net->mtu > 1500)
>> +		mode |= AX_MEDIUM_JUMBO_EN;
>> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, mode);
>> +
>> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, READ_ONCE(ax179_data->rxctl));
>> +	rtnl_unlock();
> 
> [Severity: High]
> Does this introduce an AB-BA deadlock with dev_close()? The phylink_resolve
> workqueue runs asynchronously and calls mac_link_up, which acquires
> rtnl_lock() here.
> 
> Concurrently, if the interface is brought down, dev_close() holds
> rtnl_lock() and eventually calls ndo_stop (usbnet_stop) which delegates
> to ax88179a_stop() and then phylink_stop(). Since phylink_stop() calls
> flush_work(&pl->resolve), both threads could wait forever if the workqueue
> is actively executing mac_link_up and blocked waiting for rtnl_lock().
> 
Fixed by using the dedicated mutex for the medium status mode
introduced in the previous patch.

> [ ... ]
>> +static int ax88179a_phylink_setup(struct usbnet *dev)
>> +{
> [ ... ]
>> +	data->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE | MAC_100;
>> +	if (data->is_ax88772d)
>> +		data->phylink_config.mac_capabilities |= MAC_10;
>> +	else if (data->chip_version < AX_VERSION_AX88279)
>> +		data->phylink_config.mac_capabilities |= MAC_10 | MAC_1000;
>> +	else
>> +		data->phylink_config.mac_capabilities |= MAC_1000 | MAC_2500FD;
> 
> [Severity: Medium]
> Will omitting MAC_10 here prevent the PHY from negotiating 10Mbps link
> speeds for the AX88279?
> 
> The driver explicitly provides a bulk configuration for BULK_IN_SPEED_FS
> (10Mbps full-speed) for this chip in the AX88279_BULKIN_SIZE array, but
> without MAC_10, phylink might reject 10Mbps link modes entirely and
> prevent fallback to legacy switches.
> 
The AX88279 does not support 10Mbit. Its integrated PHY will not 
negotiate such speeds. The BULK_IN_SPEED_FS setting for 10M is there to 
handle the other supported chips.

> [ ... ]
>> +static int ax88179a_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
>> +{
> [ ... ]
>> +	if (!skb || skb->len < sizeof(rx_hdr))
>> +		goto err;
>> +
>> +	/* RX Descriptor Header */
>> +	skb_trim(skb, skb->len - sizeof(rx_hdr));
>> +	rx_hdr = le64_to_cpup((__le64 *)skb_tail_pointer(skb));
> 
> [Severity: High]
> Could this cause unaligned memory access panics on architectures with strict
> alignment requirements (like SPARC or older ARM)?
> 
> The usbnet framework uses a 2-byte IP alignment offset by default (and
> ip_align = 1 for some chips here), meaning skb_tail_pointer(skb) is likely
> not 8-byte aligned. Calling le64_to_cpup() on unaligned pointers can
> trigger traps. Should this use get_unaligned_le64() instead?
Will use get_unaligned_le64()

> 
> [ ... ]
>> +	/* Get the first RX packet descriptor */
>> +	pkt_desc_ptr = (__le64 *)(skb->data + hdr_off);
>> +
>> +	pkt_end = 0;
>> +	while (pkt_cnt--) {
>> +		u64 pkt_desc = le64_to_cpup(pkt_desc_ptr);
> 
> [Severity: High]
> Similarly, is pkt_desc_ptr guaranteed to be 8-byte aligned here? With the
> 2-byte IP alignment offset, this might also require get_unaligned_le64().
> 
Will use get_unaligned_le64()

> [ ... ]
>> +static struct sk_buff *ax88179a_tx_fixup(struct usbnet *dev, struct sk_buff *skb, gfp_t flags)
>> +{
> [ ... ]
>> +	headroom = skb_headroom(skb);
>> +	tailroom = skb_tailroom(skb);
>> +
>> +	if (!(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
>> +		ax_skb = skb_copy_expand(skb, sizeof(tx_desc), padding_size, flags);
>> +		dev_kfree_skb_any(skb);
>> +		skb = ax_skb;
>> +		if (!skb)
>> +			return NULL;
>> +	}
>> +	if (padding_size != 0)
>> +		skb_put_zero(skb, padding_size);
>> +	/* Copy TX header */
>> +	tx_desc_ptr = skb_push(skb, sizeof(tx_desc));
>> +	put_unaligned_le64(tx_desc, tx_desc_ptr);
> 
> [Severity: High]
> Could this corrupt data if the SKB is shared or cloned?
> 
> The validation checks for headroom and tailroom, but it appears to miss a
> call to skb_cloned() or skb_cow_head() before modifying the packet
> boundaries with skb_put_zero() and skb_push().
> 
> If the packet is being transmitted by subsystems that clone SKBs (like TCP
> retransmits or packet sniffers), modifying this linear buffer will alter
> the payload for all concurrent users, which can lead to silent data
> corruption or use-after-free panics.
> 
Will also add check for skb_cloned()

Birger
