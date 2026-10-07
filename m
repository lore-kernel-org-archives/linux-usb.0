Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D933F492196;
	Wed,  7 Oct 2026 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377857; cv=none; b=rHnXgFjI1Fr6G/mF82KCV89DLODrBR+NTnt3P5OeH7Ikpo4qdTzyiAhoaw67OPve+osRVBNDg+/xFh3UlYBgXCPjCoIkzcuugL2G1ywUAtWDiPUKbtb9p0nhKoQmMwfwoecHKy7u4lAzYhuJqNxPzes+sfKMQ9syEroec1Ng0cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377857; c=relaxed/simple;
	bh=dtvlosX19tImuD8Mqg+2F9ghlqKUc/hcNYBEHLs9wkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p20GlkuxLmzF2s8AArrJnQuJfpjmqUkfHQ8pH2Rupweb1Yck+9Of3+DZQ+7blKo/xV5/WVXAtxW8q4VKr5WpbGaanAkPwEDLwaYZTyPSihx6KFUDFzUy95I6GNMnA3+rIdiWglOZeC37hb2nBYLIxBnzhdnaz9TiCsJB5SBiQHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kgfzm4rz; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kgfzm4rz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=L6a3hoB6pkVA6SvVlVO9B8bOSBdOydCMfcWsXdGxZFk=; b=kgfzm4rzkAYltoCsPJV+kyRD9P
	DvXN6BC2xW8U1DR1L+JfjS5OtchKJq2X9HAzrmAHYRqQDvmoQ4nBepdDD2X8/ezbz2xWrWe2ldZBV
	sf5/H276oMQ3u8ycmasBUFIHU3t0Z5roMk3tOf9Efv20tsjRbPJR2NIo0VB5ENF3By5c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xEQbf-009S4n-Ox; Wed, 07 Oct 2026 14:18:47 +0200
Date: Wed, 7 Oct 2026 14:18:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: Fwd: [PATCH net-next v17 01/13] phylink: Add
 phylink_mac_interrupt
Message-ID: <34fc1d26-80bd-43ff-b935-811602290989@lunn.ch>
References: <sashiko-outbox-162605@kernel.org>
 <0ecfa5e9-f68d-47ad-8486-1523cb599dde@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ecfa5e9-f68d-47ad-8486-1523cb599dde@birger-koblitz.de>

On Wed, Oct 07, 2026 at 05:55:38AM +0200, Birger Koblitz wrote:
> Hi Andrew,
> 
> I have the feeling that this is again rather excessive, but I do not
> understand enough of phylinks inner workings to counter the argument. Could
> you help me with this?
> 
> Thanks,
>   Birger
> 
> -------- Forwarded Message --------
> Subject: Re: [PATCH net-next v17 01/13] phylink: Add phylink_mac_interrupt
> Date: Wed, 07 Oct 2026 03:05:42 +0000
> From: sashiko-bot@kernel.org
> Reply-To: sashiko-reviews@lists.linux.dev
> To: Birger Koblitz <mail@birger-koblitz.de>
> CC: linux-usb@vger.kernel.org
> 
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
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
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index a7d086cdc9b25..a3ca7993eb7e0 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> 
> [ ... ]
> 
> > @@ -1612,6 +1612,26 @@ static bool phylink_link_is_up(struct phylink *pl)
> >  	return pl->netdev ? netif_carrier_ok(pl->netdev) : pl->old_link_state;
> >  }
> > +/**
> > + * phylink_mac_interrupt() - wrapper for phy_mac_interrupt()
> > + * @pl: a pointer to a &struct phylink returned from phylink_create()
> > + *
> > + * Passes a link-change interrupt received by the MAC to phylib.
> > + * This function may be called in interrupt context, and therefore cannot take
> > + * a mutex. However, it is safe to assume that the reference to phy does not
> > + * disappear during the call, as only an SFP module may be unplugged to make a
> > + * PHY disappear. SFP modules however do not support interrupts.
> > + */
> > +void phylink_mac_interrupt(struct phylink *pl)
> > +{
> > +	struct phy_device *phy;
> > +
> > +	phy = pl->phydev;
> > +	if (phy)
> > +		phy_mac_interrupt(phy);
> 
> [Severity: High]
> Can this sequence lead to a use-after-free if an SFP module is unplugged
> concurrently?
> 
> The docstring mentions that SFP modules do not support interrupts, but if a
> MAC driver detects a Loss of Signal and calls phylink_mac_interrupt(),
> couldn't the SFP subsystem concurrently detect the unplug and trigger
> phylink_disconnect_phy()?

Hi Birger

By Loss of Signal, i assume it is meaning the output pin on the
SFP. That is tied to a GPIO, and the SFP driver is using that GPIO,
not the MAC driver. The Device Tree, or other initialisation, would be
very wrong if the MAC is monitoring it.

There is a second possible meaning of loss of signal, which i doubt it
means. The PCS reports it has sync on the SERDES stream. This is a low
level indicator, that it can extract the clock from the bit pattern,
etc. But again, this is not something the MAC would do, it is the PCS
driver, and it calls phylink_pcs_change() whenever there is a change
in state.

In summary, SFP unplug is not the MACs problem. The AI is wrong.

	Andrew
