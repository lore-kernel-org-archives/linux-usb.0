Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B126F184540
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791345356; cv=none; b=M+R4BHc5+KQLy0YGqnUq+aBWnZm7hgLvJMkesHIGt7EWZmXAvOPUN5fPPqGWNlhx2Xb8J/Krgc2Wrn5KVmLo8TT4qkWmhx9Qo1MWjdOJ4GlMZsveVOFpk51BvFYWsVUyRB++0FgMoQ8iAQZaUYu6Z7MKPhr2sbSSPWTkk4J5D+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791345356; c=relaxed/simple;
	bh=OA+c6qF7VPkn8ThHr8lw+f+5qKzOxzMCYR2MS2BBU9k=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=hi8n4t9weu3j9ghMGRTUmg4JURwQ0Y+dJgw7QILZ82zLM41oouJj9oo2UlWa2hVszA7c5r2ac5bhA8PIHF2VkE6M6e5LwbDsigwe3LhgOPT51jhHDa4hKq4Vn9Rw+1henieLCUODuVSZupmgu5uq3UEq34io6RVn3JGj77YTXGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=ZK61fws4; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=c+ClTHfZ; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="ZK61fws4";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="c+ClTHfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791345347;
	bh=OA+c6qF7VPkn8ThHr8lw+f+5qKzOxzMCYR2MS2BBU9k=;
	h=Date:Subject:References:From:To:Cc:In-Reply-To:From;
	b=ZK61fws4ptddEBB0i5nhftkbzLaOhbVgTus7SG+vbosKcHNYo9N8pSNbXybXfaxHV
	 2vTXnQIh+Wo/ErgAeo7FD5tQaV1OVjRtPHBHN1kKGsSfh/KxqZejOFGf2JgScC0v1b
	 IlPIv3fNNezVtowbo2Il8v329G5ldBxfzw2l4LmsH04uERefYcuW7pFOv4bb0FMsiz
	 ZYgWVdpII3uTM0SRQ//Paylbxn5nh2vK2Rdz/mbxS7fJOF/6C/vPvV1ziHDfLq3f9K
	 ULUlRyc2j8yJzmCPvAd/UKefTeSabTVHrb/onLjAwadS939Qvm2VguIS+Ps+0wiKfr
	 WA+uPSWh68WEA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 33DFD3F320; Wed,  7 Oct 2026 03:55:47 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791345346;
	bh=OA+c6qF7VPkn8ThHr8lw+f+5qKzOxzMCYR2MS2BBU9k=;
	h=Date:Subject:References:From:To:Cc:In-Reply-To:From;
	b=c+ClTHfZZHkeXPE07OuKrp3hGqAKcI4h6Z3RcYZb9wFq/wjxJcDEUt/iADmn1A38W
	 D3O1q4F05XaRzJPOCPTYuiN5bA2d7jqgs63QcpQCLAA/20KIYLUEgqbpeat+Od8EmY
	 WzfF4JnDp3yJecMVgV64/OHiu103M76HDkH98bS4rnuMoUhpHPIWNHhgoo/DHn2Tq8
	 el9p+rvBeCb9ybucVSx9pD6E6N3RUWOPIIM4bxZGk9196k3RFwDpm1POrw28Iy01Sj
	 bl/m4mXq88YtIF4sxM9qeI42zNHOxAQog9/pDo9fPcJPPSfrw28PxfY2fmWpbC4aqi
	 WTH6AZitALHmQ==
Received: from [192.168.2.51] (p4fd59501.dip0.t-ipconnect.de [79.213.149.1])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 757BD3F318;
	Wed,  7 Oct 2026 03:55:46 +0000 (UTC)
Message-ID: <0ecfa5e9-f68d-47ad-8486-1523cb599dde@birger-koblitz.de>
Date: Wed, 7 Oct 2026 05:55:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: [PATCH net-next v17 01/13] phylink: Add phylink_mac_interrupt
References: <sashiko-outbox-162605@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-usb@vger.kernel.org, Birger Koblitz <mail@birger-koblitz.de>,
 sashiko-reviews@lists.linux.dev
In-Reply-To: <sashiko-outbox-162605@kernel.org>
X-Forwarded-Message-Id: <sashiko-outbox-162605@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

I have the feeling that this is again rather excessive, but I do not 
understand enough of phylinks inner workings to counter the argument. 
Could you help me with this?

Thanks,
   Birger

-------- Forwarded Message --------
Subject: Re: [PATCH net-next v17 01/13] phylink: Add phylink_mac_interrupt
Date: Wed, 07 Oct 2026 03:05:42 +0000
From: sashiko-bot@kernel.org
Reply-To: sashiko-reviews@lists.linux.dev
To: Birger Koblitz <mail@birger-koblitz.de>
CC: linux-usb@vger.kernel.org

Thank you for your contribution! Sashiko AI review found 1 potential 
issue(s) to consider:
- [High] phylink: Use-After-Free in phylink_mac_interrupt() on SFP unplug
--

commit 30d7b430d60b3d4dc2e6d650aaf0ceaacfbadbce
Author: Birger Koblitz <mail@birger-koblitz.de>

phylink: Add phylink_mac_interrupt

This commit adds the phylink_mac_interrupt() function to phylink, allowing
MAC drivers to pass link-change interrupts directly to phylib instead of
relying on polling.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index a7d086cdc9b25..a3ca7993eb7e0 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -1612,6 +1612,26 @@ static bool phylink_link_is_up(struct phylink *pl)
>  	return pl->netdev ? netif_carrier_ok(pl->netdev) : pl->old_link_state;
>  }
>  
> +/**
> + * phylink_mac_interrupt() - wrapper for phy_mac_interrupt()
> + * @pl: a pointer to a &struct phylink returned from phylink_create()
> + *
> + * Passes a link-change interrupt received by the MAC to phylib.
> + * This function may be called in interrupt context, and therefore cannot take
> + * a mutex. However, it is safe to assume that the reference to phy does not
> + * disappear during the call, as only an SFP module may be unplugged to make a
> + * PHY disappear. SFP modules however do not support interrupts.
> + */
> +void phylink_mac_interrupt(struct phylink *pl)
> +{
> +	struct phy_device *phy;
> +
> +	phy = pl->phydev;
> +	if (phy)
> +		phy_mac_interrupt(phy);

[Severity: High]
Can this sequence lead to a use-after-free if an SFP module is unplugged
concurrently?

The docstring mentions that SFP modules do not support interrupts, but if a
MAC driver detects a Loss of Signal and calls phylink_mac_interrupt(),
couldn't the SFP subsystem concurrently detect the unplug and trigger
phylink_disconnect_phy()?

If that happens, phylink_disconnect_phy() takes phydev_mutex, clears
pl->phydev, and calls phy_disconnect() which drops the object reference and
frees the phy_device.

Since pl->phydev is read locklessly here, is it possible for
phylink_mac_interrupt() to read a non-NULL pointer, but hand it to
phy_mac_interrupt() after it has been freed?

CPU1 (SFP unplug)                 CPU2 (MAC Interrupt)
phylink_disconnect_phy()
   mutex_lock(&pl->phydev_mutex)
   phy = pl->phydev
   pl->phydev = NULL
   phy_disconnect(phy)
                                   phy = pl->phydev; (Reads old pointer)
     phy_detach()
       phy_device_free()
                                   if (phy)
                                     phy_mac_interrupt(phy)
                                       phy_trigger_machine(phy)
                                         mod_delayed_work(...)

This could then cause list corruption when phy_trigger_machine() queues work
on the freed phydev->state_queue.

> +}
> +EXPORT_SYMBOL_GPL(phylink_mac_interrupt);

-- 
Sashiko AI review · 
https://sashiko.dev/#/patchset/20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de?part=1
