Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4AC3AE707
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 03:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431100; cv=none; b=JvBF593TZfD+I0TQtM+VGAGF32g+Hj3tGIKXhVIW9C3iYiAqljA979HoTAztU596k/r+xSukXc7/JC/25jQmK6aQijFTlTlbeWqsSoVuj/S/k/zxUscvURCKWu0TeluCbLBUc3laLFa1P0sbEv9q0PJcj76y6WXOxXBaFIny4BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431100; c=relaxed/simple;
	bh=NtQPbnsLyPooVYSXAAO17rpGhXL+kKO8FM5rEc/oyeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZQwEYevQAmDdmxbS49R+ofz5ICQF4petww49ZxohRxrXzfnvIonzbbpOcYGe1+MdLJvtlD5Wnx3arin1Qhz+7pugmeRS+96KV/K1bDBLLpCWRZCYTsDCzI697cA2243OB8rDrHQtSv36bQgukQ3X44aFg3GsasAriv15asn2oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=wQdl8fsz; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=wQdl8fsz; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="wQdl8fsz";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="wQdl8fsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791431096;
	bh=NtQPbnsLyPooVYSXAAO17rpGhXL+kKO8FM5rEc/oyeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wQdl8fszGCpjLd3PKptplK8P1/hTGB4F4HoCRoxJzwKluxTPRWHt8C/SgUpnwujGG
	 PEFeuIdGSgE0cn8iXHlAfU+eLf6OpyNIu46O089mktFb8QJhbLW+lFXaey/08xgwNg
	 2Ms4bk0tz/3n9JU9Xn3DHxsQWEm+l7NjJK8QUBzG8u6CXHzueBJA9QqAwNfxvVhrr3
	 Y25/evwaGX+sAviBxv/hPOU4eTgmp1dTHkDMkPCi5xoh609zrSQHMr60yne+PuklYU
	 L7k4QzRe5pF0n3zASEDKh4T7vzfJMHCiHA0YhoYdZkjDd+I5ItmeaDZkng+Y2Z6EUZ
	 SxD/LNgv3Gexg==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id E8846470D0; Thu,  8 Oct 2026 03:44:56 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791431096;
	bh=NtQPbnsLyPooVYSXAAO17rpGhXL+kKO8FM5rEc/oyeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wQdl8fszGCpjLd3PKptplK8P1/hTGB4F4HoCRoxJzwKluxTPRWHt8C/SgUpnwujGG
	 PEFeuIdGSgE0cn8iXHlAfU+eLf6OpyNIu46O089mktFb8QJhbLW+lFXaey/08xgwNg
	 2Ms4bk0tz/3n9JU9Xn3DHxsQWEm+l7NjJK8QUBzG8u6CXHzueBJA9QqAwNfxvVhrr3
	 Y25/evwaGX+sAviBxv/hPOU4eTgmp1dTHkDMkPCi5xoh609zrSQHMr60yne+PuklYU
	 L7k4QzRe5pF0n3zASEDKh4T7vzfJMHCiHA0YhoYdZkjDd+I5ItmeaDZkng+Y2Z6EUZ
	 SxD/LNgv3Gexg==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 1F17E41186;
	Thu,  8 Oct 2026 03:44:56 +0000 (UTC)
Message-ID: <a013d1b0-d8b4-4097-847d-619a2106f427@birger-koblitz.de>
Date: Thu, 8 Oct 2026 05:44:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v17 07/13] ax88179_178a: Add VLAN offload support
 for AX88179A
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-7-252814fe35ea@birger-koblitz.de>
 <sashiko-outbox-162602@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-162602@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 5:05 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] net: missing disable logic and brittle XOR toggling in VLAN state machine
> - [High] net: VLAN filter initialization clobbers AX88179A_VLAN_ID_CONTROL register
> --
> 
> commit a9c0fbb36ee5fddc570645020a27d1096396251d
> Author: Birger Koblitz <mail@birger-koblitz.de>
> 
> ax88179_178a: Add VLAN offload support for AX88179A
> 
> This commit adds VLAN offload configuration support in netdev_ops for
> AX88179A-based chips. The supported features include NETIF_F_HW_VLAN_CTAG_TX,
> NETIF_F_HW_VLAN_CTAG_RX, and NETIF_F_HW_VLAN_CTAG_FILTER.
> 
>> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
>> --- a/drivers/net/usb/ax88179a_devices.c
>> +++ b/drivers/net/usb/ax88179a_devices.c
> 
> [ ... ]
> 
>> @@ -517,6 +599,58 @@ static int ax88179a_mii_ioctl(struct net_device *net, struct ifreq *rq, int cmd)
>>   	return phylink_mii_ioctl(data->phylink, rq, cmd);
>>   }
>>   
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
> 
> [Severity: High]
> Is there a missing else block here for disabling the filter?
> 
> Without an else branch, it appears that disabling NETIF_F_HW_VLAN_CTAG_FILTER
> via ethtool will have no effect on the hardware since the disable path is
> completely skipped.
Else-block will be added.

> 
>> +			for (int i = 0; i < 256; i++) {
>> +				/* Address */
>> +				tmp = i;
>> +				ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS,
>> +						  1, 1, &tmp);
>> +				/* Data */
>> +				ax88179_write_u16(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0,
>> +						  2, 0);
>> +				ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
>> +						 1, AX_VLAN_CONTROL_WE);
> 
> [Severity: High]
> Does writing AX_VLAN_CONTROL_WE directly clobber the rest of the control
> register?
> 
> Inside this loop, ax88179_write_u8() blindly overwrites the entire control
> register with 0x01 instead of using a read-modify-write. This seems to clear
> other active configuration bits in the register, such as AX_VLAN_CONTROL_VSO,
> which could silently break RX VLAN hardware acceleration if it is enabled.
> 
Will fix by moving it ouf of the loop and combining the write with
setting/clearing AX_VLAN_CONTROL_VFE.


>> +			}
>> +			ret = ax88179_read_cmd(dev, AX_ACCESS_MAC,
>> +					       AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
>> +			if (ret < 0)
>> +				return ret;
>> +			tmp ^= AX_VLAN_CONTROL_VFE;
> 
> [Severity: High]
> Does this XOR operation lead to an inverted state if the hardware and OS states
> desynchronize?
> 
> Using XOR to toggle AX_VLAN_CONTROL_VFE instead of explicitly setting or
> clearing the bit based on the features flag means a subsequent state change
> could invert the configuration, leading to incorrectly filtered packets.
Fixed by using explicit set and clear using if/else.

> 
>> +			ret = ax88179_write_cmd(dev, AX_ACCESS_MAC,
>> +						AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
>> +			if (ret < 0)
>> +				return ret;
>> +		}
>> +	}
>> +
>> +	if (changed & NETIF_F_HW_VLAN_CTAG_RX) {
>> +		ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
>> +				       1, 1, &tmp);
>> +		if (ret < 0)
>> +			return ret;
>> +		tmp ^= AX_VLAN_CONTROL_VSO;
> 
> [Severity: High]
> Similarly, does this XOR logic for the RX VLAN offload risk state inversion?
> 
> If the OS state and hardware state desynchronize, the bit will be flipped
> the wrong way, potentially causing packets to be incorrectly untagged or
> causing dropped network traffic.
> 
>> +		ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
>> +					1, 1, &tmp);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +	return 0;
>> +}
> 
Fixed by using explicit set and clear using if/else.

Birger

