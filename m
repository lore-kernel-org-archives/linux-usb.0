Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD0B463B80
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382591; cv=none; b=sIglmC52K3fX5i2uywBOIcVY7mV9s3e2P7jsRgDK90sSU/wZHuo9z+1Cuwlm9+B8cp34hPNL7WXEODcht/ce+ihVH7abF3c93jFbsdYtrPlmyVbf2gZa9uMkjKOpmBmllNXK58e/gxdxrnP9eUHAbLXRlgYSoXEzUduWOar3o50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382591; c=relaxed/simple;
	bh=kngjW1zuDcJXUwNrUMgvr0L61GCn2YXlWOU6r47sF4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIlxry0yE5z6bjrM9PRhG0WLzfE6ay2oe0eV8a9VykzHkRNO6IDR9buugh+Nanyqx5EKCoZAc5/hNzPnkj0y58WdWAJ17gDhDK24qSBo8ZYpYORYxwqt/Z/dWvHndb2Y6mXFtauPvbMTYMSF1R87k5Xf3GLZanYyylSzXUL+YZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=J9qtS88P; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=SPbXuR45; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="J9qtS88P";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="SPbXuR45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791382580;
	bh=kngjW1zuDcJXUwNrUMgvr0L61GCn2YXlWOU6r47sF4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J9qtS88PhZgM/vwTPSfPldd3Rn6WNid6+BqujbxCXCrONoKCr3pVr9EBSoyOoWnzm
	 mVarqV07YQfjuksGl6Dg5px8aaXuvi02DiosueBj/NYEn/znzfyaCKSIIO7eI47nw3
	 n5TFH+5jv/PRo+bk8jpEIeGgfC0anIH5SSrep1nOd89+hVwaDXtKR/IoBOToNdR38K
	 FpwEIGXJp8G6C+ZSq5CmrdQ1h3xitAagngJjSAJYb69YSwyaXCENBEdq5UDdeeH8jL
	 WGExI36lUmf39y7/AwYvWHiz82ZchmnTXnNTP+PKcVAOc+YP75z949s+GFvdVi/zPu
	 2o9cp2S0bkNig==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 3F23946F9B; Wed,  7 Oct 2026 14:16:20 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791382579;
	bh=kngjW1zuDcJXUwNrUMgvr0L61GCn2YXlWOU6r47sF4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SPbXuR45F+mpVjcjiwnbGCsdlqQJ0EoaufZvYMwddrMQGhLE4/zXCy9nHfVHPBIEb
	 2h7kzCUqwCe6LEo6YUEw7a1XIZ1vNIpxz4Wmk+cVMvxNcD/mcjnt0FFG23iqiHRnpE
	 b4UD3Ko9tmkzitQncav6AMgNxF2wItXUO9aLHFDmqXW2myajXISZDQO3q2CWizJStV
	 pgp2090JLOyAYApAAcWtUmLbV9+vB5F9XiUkmLGRYCsPxpaZ3oniZvu+FTObxms7qQ
	 BZ2HxBmIQWZdBEuYGMBIgmyuqhn6n92YOxYViRecEL3k8SAs6EUAssyOzugyp0f8sm
	 49SmTHbD3lVhg==
Received: from [192.168.2.51] (p4fd59501.dip0.t-ipconnect.de [79.213.149.1])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 96B4246F20;
	Wed,  7 Oct 2026 14:16:19 +0000 (UTC)
Message-ID: <c1bf49ab-ed3b-4523-aed9-6a3770a26c71@birger-koblitz.de>
Date: Wed, 7 Oct 2026 16:16:18 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [PATCH net-next v17 01/13] phylink: Add
 phylink_mac_interrupt
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-usb@vger.kernel.org, sashiko-reviews@lists.linux.dev
References: <sashiko-outbox-162605@kernel.org>
 <0ecfa5e9-f68d-47ad-8486-1523cb599dde@birger-koblitz.de>
 <34fc1d26-80bd-43ff-b935-811602290989@lunn.ch>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <34fc1d26-80bd-43ff-b935-811602290989@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks so much Andrew for your help and the excellent explanation!

Birger

On 07/10/2026 2:18 pm, Andrew Lunn wrote:
> On Wed, Oct 07, 2026 at 05:55:38AM +0200, Birger Koblitz wrote:
>> Hi Andrew,
>>
>> I have the feeling that this is again rather excessive, but I do not
>> understand enough of phylinks inner workings to counter the argument. Could
>> you help me with this?
>>
>> Thanks,
>>    Birger
>>
>> -------- Forwarded Message --------
>> Subject: Re: [PATCH net-next v17 01/13] phylink: Add phylink_mac_interrupt
>> Date: Wed, 07 Oct 2026 03:05:42 +0000
>> From: sashiko-bot@kernel.org
>> Reply-To: sashiko-reviews@lists.linux.dev
>> To: Birger Koblitz <mail@birger-koblitz.de>
>> CC: linux-usb@vger.kernel.org
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue(s) to consider:
>> - [High] phylink: Use-After-Free in phylink_mac_interrupt() on SFP unplug
>> --
>>
>> commit 30d7b430d60b3d4dc2e6d650aaf0ceaacfbadbce
>> Author: Birger Koblitz <mail@birger-koblitz.de>
>>
>> phylink: Add phylink_mac_interrupt
>>
>> This commit adds the phylink_mac_interrupt() function to phylink, allowing
>> MAC drivers to pass link-change interrupts directly to phylib instead of
>> relying on polling.
>>
>>> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
>>> index a7d086cdc9b25..a3ca7993eb7e0 100644
>>> --- a/drivers/net/phy/phylink.c
>>> +++ b/drivers/net/phy/phylink.c
>>
>> [ ... ]
>>
>>> @@ -1612,6 +1612,26 @@ static bool phylink_link_is_up(struct phylink *pl)
>>>   	return pl->netdev ? netif_carrier_ok(pl->netdev) : pl->old_link_state;
>>>   }
>>> +/**
>>> + * phylink_mac_interrupt() - wrapper for phy_mac_interrupt()
>>> + * @pl: a pointer to a &struct phylink returned from phylink_create()
>>> + *
>>> + * Passes a link-change interrupt received by the MAC to phylib.
>>> + * This function may be called in interrupt context, and therefore cannot take
>>> + * a mutex. However, it is safe to assume that the reference to phy does not
>>> + * disappear during the call, as only an SFP module may be unplugged to make a
>>> + * PHY disappear. SFP modules however do not support interrupts.
>>> + */
>>> +void phylink_mac_interrupt(struct phylink *pl)
>>> +{
>>> +	struct phy_device *phy;
>>> +
>>> +	phy = pl->phydev;
>>> +	if (phy)
>>> +		phy_mac_interrupt(phy);
>>
>> [Severity: High]
>> Can this sequence lead to a use-after-free if an SFP module is unplugged
>> concurrently?
>>
>> The docstring mentions that SFP modules do not support interrupts, but if a
>> MAC driver detects a Loss of Signal and calls phylink_mac_interrupt(),
>> couldn't the SFP subsystem concurrently detect the unplug and trigger
>> phylink_disconnect_phy()?
> 
> Hi Birger
> 
> By Loss of Signal, i assume it is meaning the output pin on the
> SFP. That is tied to a GPIO, and the SFP driver is using that GPIO,
> not the MAC driver. The Device Tree, or other initialisation, would be
> very wrong if the MAC is monitoring it.
> 
> There is a second possible meaning of loss of signal, which i doubt it
> means. The PCS reports it has sync on the SERDES stream. This is a low
> level indicator, that it can extract the clock from the bit pattern,
> etc. But again, this is not something the MAC would do, it is the PCS
> driver, and it calls phylink_pcs_change() whenever there is a change
> in state.
> 
> In summary, SFP unplug is not the MACs problem. The AI is wrong.
> 
> 	Andrew

