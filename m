Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848161;
	b=SxKLc3YMi7B5NxQvF8I6jkwmqkB9ClOl2L4/lRr4jNzxGwrh9+ITpHEO2G9eItfBx2++
	 GAmMRAUJ+IdwX+FIvTUj+zPhzDNtpuk8CLWNl/mNIom8fZCk4R3s0yGrF5NH/ssy3VpSn
	 OBNeL3eY4BclMJ4JwTPKlheYmg0f2Ru3aZxO1/yu06B1ttg6hzygX9wRB7oL8Dma42z8T
	 q7rDwLqSnbbz3afsR8lTBmxXEelDe27FzoeLHiQ1KOSIr4YjgQK7yMApoAZuVIhskO3PH
	 N2rvNg/G1/3apak6hQ8abygM+ycug/NCwOX+QJBeZNnNfdnBJrMbQtCfW4OhqdcmZHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848161;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3ZankHElkFGMWDSXqfvCsy7/t0XVhIK4lZAWUG908DQ=;
	b=fXgIfTSsspeHZfLff9VkY04XZZbJZkOu5qQNFssQYwN849T1vrHUrImEYEBQ7DdVsr8T
	 2+fMZulp6n1ccTamXjTK2R8n+SeJTvOllPP/zfgHoOL8pE59nCv+LiKsoNPaM1tPN7kE1
	 TBQfEEGc6+8aB6CpcVgtL3HmfhpOi9f3LSO0X3vLCGb8l184U1Vl52p9koP+GTknT6mLG
	 ZppRUfE8O8UzDLNCw6MiJHoBjg8TsWLmDCQonu8cfowj6MwVbdBnEWGc+rlFlyZ7kC4xa
	 twwwg3fjWFDK9cuvh+QuPovSW7542rP8JFSJKHuVkCKnrWi/L2IPffcaX5xNoGEF/hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y69XFGoZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2D2606A323;
	Sat, 28 Nov 2026 06:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y69XFGoZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA701F00897;
	Sat, 28 Nov 2026 06:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795848160;
	bh=3ZankHElkFGMWDSXqfvCsy7/t0XVhIK4lZAWUG908DQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y69XFGoZE+e5loO7Hwgmbzf2mtOyCWEnVxkbKtdnQJqWmgOjIlFCKRZzQLDslcg43
	 rOr4AtzES+Ok1xSxRazRqjJ5h/SyJNj2+VKVO7Li0jbu2xFmcD4sN4rfRkwHKlDicH
	 wbXYP7kGl1rw2B94GV3rVfK33hTmI46rCGPAuZQl4flg+vXdXeFJ0GK8M6Pwh2CLSs
	 C3xPZGdS0P55w3aI9sVv8B6fraRUdQjOQOuOhvDyTRGLU0hgdFXznYrjKGJ8Jgb4Lu
	 FNs5MV4V14n8BZpBnTPVuJh9MCgmfSEekTHBFuYcoCKcdScOCJcCpS6ws72PILH20x
	 yzeoThejFeZVA==
Subject: Re: [PATCH net-next 1/2] net: usb: ax88179: Make receiving FCS on
 AX88179A configurable
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, benjamin.larsson@genexis.eu
Date: Sat, 28 Nov 2026 06:42:39 +0000
Message-ID: <179584815990.3135.5137971484005173950@kernel.org>
In-Reply-To: <20261127-fcs-v1-1-0c4ede015bf5@birger-koblitz.de>
References: <20261127-fcs-v1-1-0c4ede015bf5@birger-koblitz.de>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] ax88179_set_multicast()
  (drivers/net/usb/ax88179_lib.c:362-364) treats NETIF_F_RXALL the same…
- [Low] The commit is titled as making FCS reception 'configurable', but
  what it really does is fix a bug.
- [Low] The new condition `data->chip_version != AX_VERSION_AX88179A` in
  ax88179_set_multicast() (drivers/net/usb/ax88179_lib.c:363) also…

--

net: usb: ax88179: Make receiving FCS on AX88179A configurable

With this commit, ax88179_set_multicast() no longer always sets
AX_RX_CTL_DROPCRCERR. That bit keeps the FCS attached to received frames.
On AX88179A it is now only set when NETIF_F_RXFCS or NETIF_F_RXALL is
enabled. Other chip versions behave as before.

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> index 821ee9cd8ded1..85d774bf214f8 100644
> --- a/drivers/net/usb/ax88179_lib.c
> +++ b/drivers/net/usb/ax88179_lib.c
> @@ -356,10 +356,12 @@ void ax88179_set_multicast(struct net_device *net)
>  
>  	data = dev->driver_priv;
>  
> -	rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_DROPCRCERR);
> +	rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB);
>  	if (data->ip_align)
>  		rxctl |= AX_RX_CTL_IPE;
> -
> +	if (net->features & (NETIF_F_RXFCS | NETIF_F_RXALL) ||

[Severity: Medium]
Should NETIF_F_RXALL by itself cause the FCS to be kept?

NETIF_F_RXALL is about delivering frames with errors, such as a bad FCS.
NETIF_F_RXFCS is the flag that tells the stack skbs end with the FCS.
Other drivers keep the two separate. For example, e1000 trims the 4 bytes
unless NETIF_F_RXFCS is set.

This branch can't be reached in this patch alone, because hw_features
doesn't include these bits yet. The follow-up commit "net: usb: ax88179:
Support NETIF_F_RXFCS and NETIF_F_RXALL on AX88179A" adds them to
hw_features in ax88179a_bind(). It also copies the same mapping into
ax88179a_set_features() and ax88179a_reset():

    if (features & (NETIF_F_RXFCS | NETIF_F_RXALL))
        rxctl |= AX_RX_CTL_DROPCRCERR;

In that series, ax88179a_rx_fixup() only uses the flags to widen the MTU
check:

    if (features & (NETIF_F_RXFCS | NETIF_F_RXALL))
        fcs_trailer = ETH_FCS_LEN;

After that check, it copies the full pkt_len without trimming:

		skb_put(ax_skb, pkt_len);
		memcpy(ax_skb->data, skb->data + (ax179_data->ip_align ? AX179A_RX_HW_PAD : 0),
		       pkt_len);

Take "ethtool -K <dev> rx-all on" with rx-fcs off. Wouldn't every frame
then reach the stack with 4 extra trailing bytes, and nothing to show
that they are an FCS?

Could AX_RX_CTL_DROPCRCERR depend only on NETIF_F_RXFCS? Another option
is to trim ETH_FCS_LEN in ax88179a_rx_fixup() when only NETIF_F_RXALL is
set.

> +	    data->chip_version != AX_VERSION_AX88179A)

[Severity: Low]
This isn't a bug, but the subject says FCS reception is being made
"configurable", and the change also fixes existing behaviour.

Before this patch, AX_RX_CTL_DROPCRCERR was always set on AX88179A, and
ax88179a_rx_fixup() doesn't trim the FCS. So every frame received on
AX88179A/AX88772D reached the stack with the 4-byte FCS still attached.

Could the commit message say this directly? Could it also add a Fixes:
tag for 7d573278f9a5 ("ax88179_178a: Add HW support for AX179A-based
chips")? That commit is where DROPCRCERR became always-on for these chips.
It was merged to net-next on 2026-11-14 and is probably not in a released
kernel yet, so this is mostly for traceability.

The commit message also doesn't mention that the new chip_version test
affects the AX88772D.

[Severity: Low]
Does the chip_version != AX_VERSION_AX88179A test also change behaviour
on the AX88772D? ax88179_lib.h has:

	AX_VERSION_AX88179A		= 0x6,	/* Also AX88772D */

ax88179a_bind() tells the two chips apart only through is_ax88772d:

	if (ax179_data->chip_version == AX_VERSION_AX88179A) {
		if (le16_to_cpu(udev->descriptor.bcdDevice) == 0x300)
			ax179_data->is_ax88772d = 1;
	}

So AX_RX_CTL_DROPCRCERR is now cleared on AX88772D as well. The commit
message says this was only tested on AX88179A. According to the comment
in ax88179a_bind(), AX88279 needs the same bit for correct RX URB
framing.

The follow-up commit "net: usb: ax88179: Support NETIF_F_RXFCS and
NETIF_F_RXALL on AX88179A" keeps this behaviour. ax88179a_reset() only
forces DROPCRCERR for AX88279, and RXFCS/RXALL are advertised on AX88772D
too.

Has this been tested on an AX88772D, or should that chip be excluded
using is_ax88772d? Either way, could the commit message mention the
AX88772D?

> +		rxctl |= AX_RX_CTL_DROPCRCERR;
>  	if (net->flags & IFF_PROMISC) {
>  		rxctl |= AX_RX_CTL_PRO;
>  	} else if (net->flags & IFF_ALLMULTI ||

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-fcs-v1-0-0c4ede015bf5%40birger-koblitz.de
