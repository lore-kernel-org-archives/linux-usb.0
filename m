Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682892DEA6B
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 04:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791607789; cv=none; b=Coz3X2RZCezEB3kFS96BuGtgrT01qXJCYZMGlB4Gy4NaXtlibvEJnWlf41gypT0UTks20V/JkciAYiRNavaYVCvX05130/L6lm/d9JpC2nERPKkpQNH1nChstUUWOr1CRNquukzTl5AfOtqeM26alcVk+UNDJ5HvuizIXmUUnoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791607789; c=relaxed/simple;
	bh=PURWj7778O8zXT6jjGMsNhp24pyRUjg+zUjWwFVj/zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5Yengv2ZcN1HTT2dOvtuOv1Ty9Gow7zRS2pKI2mkoCT05aQ2yogIknajNovCmKyG5XkKcQlbOFTEt9G6teuTk0ifT6G4XZ5sN606mNyBuZnW4c9g20Nh1L2JJ66sBs3Ty0GZByS4joJtLUnHIo0XJxWgK57ROx7jmc5vPes43s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=sdifYsHo; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=eOC5UCKA; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="sdifYsHo";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="eOC5UCKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791607786;
	bh=PURWj7778O8zXT6jjGMsNhp24pyRUjg+zUjWwFVj/zc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sdifYsHok9jfkp3A4xJKBqq9fj9gBFYfYkiH6KPmsYMW9VRLzgPo5muIYp0ZJssUJ
	 ar6EO93HbMmPzrUmJCeKLXM1Oo6HATaISPGRzfosfyGwJHdxiYAg5h7nDNCQuXpCiZ
	 oHF/R1vLvYJt1W9x7Wx8Em37pHFKpX+UCx1TlhWqVmEWPz5qPdYjm7Y4CeLwKeCwIN
	 2xspRssXGTcEKwO+3NbikGKFrEsgRuk6PXLa8tpZUQgJnMCNmJkwN0ZactqDLcI1S+
	 IiZb4J/WMaBhZIbbpttWUJvF/X0jwGlU61bkUOYExwhHsAFXuTQPtjUcwXf5jZAuxC
	 SEvLOsPsVYoKw==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id B6BFC47535; Sat, 10 Oct 2026 04:49:46 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791607785;
	bh=PURWj7778O8zXT6jjGMsNhp24pyRUjg+zUjWwFVj/zc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eOC5UCKADr/qHA25wpTUYLrFNVF62M5cQNmnLJjN3/XvQNgtlPylPaV83tzEfrhra
	 iywD6DGCZ6DtSYZ7uajbCPu9YCqb8UipSzLkULHTUqWo5ueM6J+cP3icSS0p+i5LQa
	 mmey+cB+E5Hcp3m/Q9JXsmU1ziQU6HohO5UP0AGYmZr6VZhEKnNXLs4DKKMraWu7iF
	 UKkDMj843A77LCZVZ6909ci00QSasNA7Z9A8KevoYVkB3CwAQOhP3K73qaVMYt00zs
	 cfvBoHf6D0GfuYNSKzQYVg+MGUs2MEhaJzG4VWMf+zMElsYbeTjF+fSNj13XjjrcLY
	 a/RNp0aX7W2fA==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id B5C344751E;
	Sat, 10 Oct 2026 04:49:45 +0000 (UTC)
Message-ID: <9571ad9a-769c-4dfc-bb17-ae849201cc27@birger-koblitz.de>
Date: Sat, 10 Oct 2026 06:49:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 08/13] ax88179_178a: Add AX179A/AX279
 multicast configuration
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-8-6fa1d4c40422@birger-koblitz.de>
 <sashiko-outbox-164796@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-164796@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2026 5:51 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] net: ax88179_set_multicast() data race on data->rxctl
> --
> 
> commit 547e4ec41af3f2201955124dd2564e630771c80f
> Author: Birger Koblitz <mail@birger-koblitz.de>
> 
> ax88179_178a: Add AX179A/AX279 multicast configuration
> 
> This commit adds support for conditionally setting the AX_RX_CTL_IPE flag
> in AX_RX_CTL based on ip_align. It also ensures AX_RX_CTL_DROPCRCERR is
> set to match the initial configuration in ax88179_reset().
> 
>> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
>> index 0efc2eb95e4b3..ea19700c8230f 100644
>> --- a/drivers/net/usb/ax88179_lib.c
>> +++ b/drivers/net/usb/ax88179_lib.c
>> @@ -321,10 +321,14 @@ int ax88179_set_eeprom(struct net_device *net, struct ethtool_eeprom *eeprom, u8
>>   void ax88179_set_multicast(struct net_device *net)
>>   {
>>   	struct usbnet *dev = netdev_priv(net);
>> -	struct ax88179_data *data = dev->driver_priv;
>>   	u8 *m_filter = ((u8 *)dev->data);
>> +	struct ax88179_data *data;
>> +
>> +	data = dev->driver_priv;
>>   
>> -	data->rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_IPE);
>> +	data->rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_DROPCRCERR);
>> +	if (data->ip_align)
>> +		data->rxctl |= AX_RX_CTL_IPE;
> 
> [Severity: High]
> Does this non-atomic modification of data->rxctl introduce a data race?
> 
> It appears data->rxctl is updated here without lock synchronization. If
> ax88179a_mac_link_up() is executing concurrently, could it fetch an
> intermediate torn state?
> 
> For example, a concurrent reader might observe the state like this:
> 
> ax88179a_mac_link_up()
>     ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, READ_ONCE(ax179_data->rxctl));
> 
> Could this result in corrupting the hardware register by committing a
> partially updated rxctl state to the device?
> 
>>   
>>   	if (net->flags & IFF_PROMISC) {
>>   		data->rxctl |= AX_RX_CTL_PRO;
> 
Will fix by first only manipulating a local variable that is then 
written once into ax179_data->rxctl.

Birger
