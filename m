Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F74356775
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 03:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430507; cv=none; b=S74yUnF/RV+loUD4466AULu2/NRNfgIJBQW/GWNaNR76yfVw/caOQSqgHNAxjZv5pGwgMHD0EuBVadAvgBH4U8aMpDPyy46cWijuBO6E4sgPah35vR7mYFJEbL9ZeP6ZzzN9pg1NEk6ID5ZZ4zQ3MYLlt790hYXqaOuX5vmquiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430507; c=relaxed/simple;
	bh=knFSd9gxXbU4LbNqy4lxRD7FjLr6llnrePtlywKFiKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmpnEfHsb9tMG0S4VMKUpN89lAdRsn2zSeXsUuQ2TtOgbAhvmG9Q0akCo7BH3h9ZvvoI+vVW83cWF3ykubA0u1GH471UhdKXy89Lh6BxXPvSKqGqWjlfsdr7Yi54pojl/L/Joz0/vsYKTi8BjTkZfBVEU0jXKPCJWk7tDYX8yu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=ldRFdztd; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=Um3mNYRj; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="ldRFdztd";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="Um3mNYRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791430504;
	bh=knFSd9gxXbU4LbNqy4lxRD7FjLr6llnrePtlywKFiKc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ldRFdztd9v2fHgN7Eb4aRqk6HMlQhG/jmmDhPzqaBteHw/4ghqdE6rez7Ty8JLQ//
	 N8B0FBejZLvnWghpojkVVl4WlxvXd6ukNYxArSoBtEc053G32+AwwjSfEk7UB9sfXM
	 v8iCbsMDNSByakajSwPGhgXxc7TnstMZNST45PA00U56rC/fBm1trdJ4ffrKtvaah6
	 0kymGDUM/ccttpF5aqVVyXE/w0YsmlxXzzTtoL5niYMRGZ5BefKfnL+epYPSj2/AKx
	 IjOYFnUJp1IiNfsMhj1+xzkJz6CMG0G4aM2irIPfJYPlAoYgt++BRIy5OfrhsmZMsv
	 vdAqI4dGCKlng==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 23A5B470CF; Thu,  8 Oct 2026 03:35:04 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791430500;
	bh=knFSd9gxXbU4LbNqy4lxRD7FjLr6llnrePtlywKFiKc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Um3mNYRjT5A2LIeaO6PvymEP8Abxv96MBHjwEmdvY3zWJFCo8SlleP9jw6K++su37
	 lrw+QkU7HlUiZ+lUKt0HAOFpGmMoNKGi2eOUXItAJ/NEPaRbf895W2Kmwmnb5KtQUm
	 4XQAlSJ7HBlBwdFEo/+K5TwGrsf4XC+JOc0sBvP2ZHXVAjlHML75Y4/JaJyrpdnHt1
	 G905r2ViZlLCUheXsZstGYC0yg373f6ddAGRG0gi76QxFeW/ykovYkaFKOxJ+fKErc
	 c+o0K5HSkOscWmkollkCkmtUOzjOLJ3mFYH4KDSidVGm23OOBmbmDr+ZF08g8mJUlv
	 V4Oy6cV0+A2EQ==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id A6BC041186;
	Thu,  8 Oct 2026 03:35:00 +0000 (UTC)
Message-ID: <1dea7a29-90c8-4c32-9576-4fc08f3be6e5@birger-koblitz.de>
Date: Thu, 8 Oct 2026 05:34:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v17 01/13] phylink: Add phylink_mac_interrupt
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-1-252814fe35ea@birger-koblitz.de>
 <sashiko-outbox-162605@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-162605@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 5:05 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] phylink: Use-After-Free in phylink_mac_interrupt() on SFP unplug
> --
> 
> commit 30d7b430d60b3d4dc2e6d650aaf0ceaacfbadbce
> Author: Birger Koblitz <mail@birger-koblitz.de>
> 
> phylink: Add phylink_mac_interrupt
> 
> This commit adds the phylink_mac_interrupt() function to phylink, allowing
> MAC drivers to pass link-change interrupts directly to phylib instead of
> relying on polling.
> 
>> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
>> index a7d086cdc9b25..a3ca7993eb7e0 100644
>> --- a/drivers/net/phy/phylink.c
>> +++ b/drivers/net/phy/phylink.c
> 
> [ ... ]
> 
>> @@ -1612,6 +1612,26 @@ static bool phylink_link_is_up(struct phylink *pl)
>>   	return pl->netdev ? netif_carrier_ok(pl->netdev) : pl->old_link_state;
>>   }
>>   
>> +/**
>> + * phylink_mac_interrupt() - wrapper for phy_mac_interrupt()
>> + * @pl: a pointer to a &struct phylink returned from phylink_create()
>> + *
>> + * Passes a link-change interrupt received by the MAC to phylib.
>> + * This function may be called in interrupt context, and therefore cannot take
>> + * a mutex. However, it is safe to assume that the reference to phy does not
>> + * disappear during the call, as only an SFP module may be unplugged to make a
>> + * PHY disappear. SFP modules however do not support interrupts.
>> + */
>> +void phylink_mac_interrupt(struct phylink *pl)
>> +{
>> +	struct phy_device *phy;
>> +
>> +	phy = pl->phydev;
>> +	if (phy)
>> +		phy_mac_interrupt(phy);
> 
> [Severity: High]
> Can this sequence lead to a use-after-free if an SFP module is unplugged
> concurrently?
> 
> The docstring mentions that SFP modules do not support interrupts, but if a
> MAC driver detects a Loss of Signal and calls phylink_mac_interrupt(),
> couldn't the SFP subsystem concurrently detect the unplug and trigger
> phylink_disconnect_phy()?
> 
> If that happens, phylink_disconnect_phy() takes phydev_mutex, clears
> pl->phydev, and calls phy_disconnect() which drops the object reference and
> frees the phy_device.
> 
> Since pl->phydev is read locklessly here, is it possible for
> phylink_mac_interrupt() to read a non-NULL pointer, but hand it to
> phy_mac_interrupt() after it has been freed?
> 
> CPU1 (SFP unplug)                 CPU2 (MAC Interrupt)
> phylink_disconnect_phy()
>    mutex_lock(&pl->phydev_mutex)
>    phy = pl->phydev
>    pl->phydev = NULL
>    phy_disconnect(phy)
>                                    phy = pl->phydev; (Reads old pointer)
>      phy_detach()
>        phy_device_free()
>                                    if (phy)
>                                      phy_mac_interrupt(phy)
>                                        phy_trigger_machine(phy)
>                                          mod_delayed_work(...)
> 
> This could then cause list corruption when phy_trigger_machine() queues work
> on the freed phydev->state_queue.
> 
>> +}
>> +EXPORT_SYMBOL_GPL(phylink_mac_interrupt);
> 

The AI is wrong here, because SFP unplug is not the MAC's problem, see 
the detailed answer Andrew has given already.

Birger




