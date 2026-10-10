Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BF51A682B
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 04:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791607758; cv=none; b=R7vwH17M+9sGYqXngNG3tCM97qp2ma9gpOokygEfl1pXGkqw3j2zon8MLzkdRj9yXKu3Mbih5rUHCrbnYikXenbKq+l8PimbtyStCzJdcLCnl6V1hSdD7MiFwRr/Z6/PNH70HOWDXua6ToSuYJP5eYBkaZpx7vErvNfoC9B6C98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791607758; c=relaxed/simple;
	bh=Z5FC2rVHvSLgbFFMS8mpH/4/MyKpT5lw5m4Fo57+OGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYN8d7+uQ6NC/S+A/IV8HtHlU7XdmZ2k09q9JT9Jqm1c+9bVDddt2OrZ1zxvLJsq9PV7G/9z/c6x2yTU5/5cSpQ+K/k4kDp9GLu/MLsxBjOGnXOu4LcoaFdtqFEnL4aMyBEFG20yyx0/sFh90E6ybLNnAkLfEKqEc4LDG21LNDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=F459YtuT; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=E9O+KrZ4; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="F459YtuT";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="E9O+KrZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791607755;
	bh=Z5FC2rVHvSLgbFFMS8mpH/4/MyKpT5lw5m4Fo57+OGA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F459YtuT72ja6xo98wWecsd4+uLk7Wy77oCyWrr8HfAZGhrry5fpRfSwupaMIWCio
	 ButJMZOXVPttVJpy9OLO0q26cegS6WYawWjhBp6UzX6qjO2EFIASLIsXbp7G1fuhV7
	 imecqMweaNwmD71Zq3rr1ruMDsiUymMCD2bYj0EF6o1JFUiTxl4u7OLEbGMJNLYsRu
	 QrK9SgEGWg3JPOyuwyKJ0AvksU8ZwJmijtTlL954rRZrQnPaJVYjat8VxUpYlCSKnt
	 nOi9WOicoMyC+MIgjIyOgLnjALu7YqLXA2w8XE1Tl9z1q7PEdsNilZMmw6n+WjmSyk
	 lq2iRkccVyc2A==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 0F7DB4752E; Sat, 10 Oct 2026 04:49:15 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791607751;
	bh=Z5FC2rVHvSLgbFFMS8mpH/4/MyKpT5lw5m4Fo57+OGA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E9O+KrZ43OuW9Sgt3qzZ1ubz7FDlrXib6MXZER494hYdMgPUFFHFwAALZfHtmIZZV
	 6zoNpSorm0YnsmJBIuZYXqErf75vIfpGHAdvTDhn+q4TwjW5dyn2cCpXcFWXrAHco+
	 ysat65KD2gf1odAAu7QHyRJ9EveHW7j1WFb9qb7eWfMVxotKVKHDk6kEPqxYXN0zmV
	 sEXQEfbapGJIVPruL2TDpQeWR7fzUJNtqfjERnxhqa+yZkIYY9cyS8TtoXZ05t4oVL
	 VgImikNOIViheSqLBpYzz4L1B3bs5s+4LcfmjGHwlmXl74lIwGGkmae7YDXxjYHMJ/
	 3wi+TwIn4TIQw==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 8A98B4751E;
	Sat, 10 Oct 2026 04:49:11 +0000 (UTC)
Message-ID: <5e1e6314-2623-43fd-b8b6-4db4bbf05c3d@birger-koblitz.de>
Date: Sat, 10 Oct 2026 06:49:11 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 07/13] ax88179_178a: Add VLAN offload support
 for AX88179A
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-7-6fa1d4c40422@birger-koblitz.de>
 <sashiko-outbox-164793@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-164793@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2026 5:51 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] net: usb: ax88179a: missing WE command in VLAN filter table init loop
> - [Medium] net: usb: ax88179a: ignored USB write errors in VLAN filter init
> - [Medium] net: usb: ax88179a: uninitialized stack memory use on short USB read
> --
> 
> commit 86960e6590c9a326bcedbb3ba8fde9f53c488e20
> Author: Birger Koblitz <mail@birger-koblitz.de>
> 
>      ax88179_178a: Add VLAN offload support for AX88179A
>      
>      The AX88179A-based chips support VLAN offload. Add configuration
>      support in netdev_ops. Features supported are:
>      NETIF_F_HW_VLAN_CTAG_TX, NETIF_F_HW_VLAN_CTAG_RX
>      and NETIF_F_HW_VLAN_CTAG_FILTER.
> 
>> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
>> index c41d9c2dc737a..bdc67cbc17287 100644
>> --- a/drivers/net/usb/ax88179a_devices.c
>> +++ b/drivers/net/usb/ax88179a_devices.c
>> @@ -258,6 +258,88 @@ static const struct ethtool_ops ax88179a_ethtool_ops = {
>>   	.get_ts_info		= ethtool_op_get_ts_info,
>>   };
>>   
>> +static int ax88179a_vlan_rx_kill_vid(struct net_device *net, __be16 proto, u16 vid)
>> +{
>> +	struct usbnet *dev = netdev_priv(net);
>> +	u8 vlan_ctrl;
>> +	int ret = 0;
>> +	u16 reg16;
>> +	u8 reg8;
>> +
>> +	ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &reg8);
>> +	if (ret < 0)
>> +		return ret;
> 
> [Severity: Medium]
> If a malicious or buggy USB device responds to the read request with a
> zero-length packet, ax88179_read_cmd() will return 0 and skip copying data,
> leaving reg8 uninitialized.
> 
> Since the error check only verifies if ret < 0, does this allow uninitialized
> stack memory to be used for hardware control and eventually written back to
> the MAC? This also applies to the reads in ax88179a_vlan_rx_add_vid() and
> ax88179a_set_features().
Will fix by initializing register variable.

> 
> [ ... ]
>> +static int ax88179a_set_features(struct net_device *net, netdev_features_t features)
>> +{
>> +	struct usbnet *dev = netdev_priv(net);
>> +	netdev_features_t changed;
>> +	int ret;
>> +	u8 tmp;
>> +
>> +	changed = net->features ^ features;
>> +
>> +	ret = ax88179_set_features(net, features);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (changed & NETIF_F_HW_VLAN_CTAG_FILTER) {
>> +		if (features & NETIF_F_HW_VLAN_CTAG_FILTER) {
>> +			for (int i = 0; i < 256; i++) {
>> +				/* Address */
>> +				tmp = i;
>> +				ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS,
>> +						  1, 1, &tmp);
>> +				/* Data */
>> +				ax88179_write_u16(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0,
>> +						  2, 0);
>> +			}
> 
> [Severity: Medium]
> These ax88179_write_cmd() and ax88179_write_u16() calls lack error checking.
> Could this prevent an early abort on device disconnect or hardware failure,
> resulting in the thread blocking through 512 failing USB control transfers?
> 
This was discussed earlier and a test with pullling out the USB-module 
in mid-loop terminated gracefully. Please read related emails. Will not fix.

> [Severity: High]
> Does this loop fail to actually initialize the hardware filter table for the
> first 255 entries?
> 
> The write enable command (AX_VLAN_CONTROL_WE) is only sent once after the
> loop finishes, which suggests that only the last address (255) is written
> to the SRAM while the first 255 entries are ignored. Should the WE trigger be
> included inside the loop?
> 
>> +			ret = ax88179_read_cmd(dev, AX_ACCESS_MAC,
>> +					       AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
>> +			if (ret < 0)
>> +				return ret;
>> +			tmp |= AX_VLAN_CONTROL_VFE | AX_VLAN_CONTROL_WE;
>> +			ret = ax88179_write_cmd(dev, AX_ACCESS_MAC,
>> +						AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
>> +			if (ret < 0)
>> +				return ret;
>> +		} else {
> 

AX88179A_VLAN_ID_CONTROL has 4 bits:
         #define AX_VLAN_CONTROL_WE      0x0001
         #define AX_VLAN_CONTROL_RD      0x0002
         #define AX_VLAN_CONTROL_VSO     0x0010
         #define AX_VLAN_CONTROL_VFE     0x0020

Both the _WE (Write_Execute) and _RD (ReaD) bits are ephemeral, i.e. 
after writing this bit, a read will only read back a cleared bit. As 
seen from the vlan add/kill methods, reading data would then for example 
work like this:

         u16 data;
         u8 tmp = x;
         ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS,
                           1, 1, &tmp);
         /* Read-Execute */
         ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
                          1, vlan_state | AX_VLAN_CONTROL_RD);
         ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0,
                         2, 2, &data);

It turns out, the code for changing NETIF_F_HW_VLAN_CTAG_FILTER was 
right all along that the _WE bit needs to be set to write each address 
table data once. But there is only 1 AX88179A_VLAN_ID_CONTROL register. 
Of that only the _VFE and _VSO bits need to be preserved.

Will change back to write-execute for all entries in the table, added a 
comment for the write-execute command and preserved the VSO/VFE bits.

Birger

