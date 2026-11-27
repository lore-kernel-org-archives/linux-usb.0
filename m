Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753621;
	b=YDSfBFWTCeESxNheWCyjf199IwFiXynbw7LHeMo9KjxIrGniA2WWSsJoq/W6pt9aPprK
	 0eUr3J9kfaHXIaBV8VPX1cJTx4oHoXMAARZOEHv0gv61+TQztrLBjC1KHs4NyAKqkDZay
	 ci3hioxUnE9xqbU0xar6N6MtB8xbL/IFyll39Dd6wqFforRWjkyvrxjB8kVH+a7zCflet
	 kK8mMAX1XtBdQ6XjfCCvFQ8m9mFyC58NQDHAAlU015O8kuLVmNFveUi84EBQlaWrdUMGz
	 M3chnfPby3MyhAXGNYLWqXf6QqLH71MTW9uacJuVdhW9ajZYAlEmBOLYkKB6EpaNK/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753621;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9qlfoltgQZQLTiaNigWx976hqgBrcBMxN+/iUMS2pNs=;
	b=HTlcWlx+JoDcIaar07VV1kBVn4ODPJtwe4hI5mMk1IhTygQZldB8b39qeLaxzzJ3G3ne
	 OLaiJDvGjV2CAWEebXK+CLHJG4JzWObQ+U5+0Q4xdtcf+1HkDg8/gSJUFfHmx939iR8Sc
	 5PJxVlFWMupTUuXarHyRvDNynhELmrwas+WqFyuhIpYOY1R8ifyvbYk7hhv02C1EV+YK4
	 iW9zGLX7fLDrgN4MY32s+IKqUcUjU1Jq6I5ZeHSCzr2drmSqD/HJNQb7MpuM8+gXXAvNP
	 wk2Aw0qf5fgUf5MDU3nqvIduNeY6fvENxx6rc5vrpCY4FSviqFfq1ny1kBpSoioB7ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RSWx4UlP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B715606A31C;
	Fri, 27 Nov 2026 04:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RSWx4UlP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642961F00893;
	Fri, 27 Nov 2026 04:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795753621;
	bh=9qlfoltgQZQLTiaNigWx976hqgBrcBMxN+/iUMS2pNs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RSWx4UlPFGUJk3/BB5u/lJSuSOmV+Jrz2ByaJXYYzZDwtSmwexebhTNkshEsEood4
	 +ccga8k7gQlSzerZwyYsmswtYmb9BvB80QBkgIzExJlh7tx4Qw6sy5z15BGhswzpXT
	 nER3WpLBHxT9Q7tA5r2BinxBwuvtb9xLtU8dKHjLdXnBJZQlLVQR4cX+dWkPeSBqTb
	 M22zm0lda0k4e3krkTgk4uJM7eB4JCenONquy2b6/akfgeGqs156zLprcGchp+5pzQ
	 uQEPNpQXQ0u+x0h7ZXxpQgX+0A6a8y5YaEJOUCjRRs/ACC9NgrsBPrcNa5+UvZUeuH
	 T4WAqkBL7XKKg==
Subject: Re: [PATCH net-next v9 01/12] r8152: fix
 RTL8156/RTL8156B/RTL8157/RTL8159 up and down settings
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Fri, 27 Nov 2026 04:26:59 +0000
Message-ID: <179575361990.3135.4466986058036107796@kernel.org>
In-Reply-To: <20261126033211.51850-2-nic_swsd@realtek.com>
References: <20261126033211.51850-2-nic_swsd@realtek.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message of "r8152: fix
  RTL8156/RTL8156B/RTL8157/RTL8159 up and down settings" carries three…
- [Low] Six independent register fixes, attributed to three different
  original commits, are squashed into one patch.

--

r8152: fix RTL8156/RTL8156B/RTL8157/RTL8159 up and down settings

This commit adjusts rtl8156_up() and rtl8156_down() so that several
datasheet-required register settings are applied to the right
RTL8156-family chip versions. It changes the version gates for PLA_RCR1,
USB_SPEED_OPTION and PLA_MCU_SPDWN_EN and adds Clear_SDR writes. It also
sets ALDPS_PROXY_MODE and DIS_MCU_CLROOB on OOB entry and uses different
OOB RMS/MTPS values for RTL8157/RTL8159.

> Several settings the datasheet requires for these chips were either
> missing or gated on the wrong version range in the shared
> rtl8156_up()/rtl8156_down():

[ ... ]

> Fixes: 195aae321c82 ("r8152: support new chips")
> Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
> Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")

[Severity: Low]
Could the commit message say what goes wrong on real hardware without
these settings?

Each item is justified only as something the datasheet requires. None of
them names a symptom someone would see, such as WoL/OOB wake failures,
RX stalls after resume, wrong OOB frame size limits, or link loss after
ifdown/ifup. The message also doesn't say whether any of the changes
fixes a reported problem.

Some of the changes affect every RTL8156-family chip:

- ALDPS_PROXY_MODE in PLA_BDC_CR, set in rtl8156_down().
- DIS_MCU_CLROOB in PLA_OOB_CTRL, set in rtl8156_down().
- The PLA_RCR1 BIT(3) clear in rtl8156_up(), which now also runs on
  RTL8156/RTL8156B.

195aae321c82 dates back to 2021, so these Fixes: tags will pull the patch
into several stable trees. Backporters need to know which bug this fixes.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 4815235e8e730..d00cc911ae135 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -6820,8 +6820,7 @@ static void rtl8156_up(struct r8152 *tp)
>  
>  	ocp_byte_clr_bits(tp, MCU_TYPE_PLA, PLA_OOB_CTRL, NOW_IS_OOB);
>  
> -	if (tp->version >= RTL_VER_16)
> -		ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_RCR1, BIT(3));
> +	ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_RCR1, BIT(3));
>  
>  	ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_SFF_STS_7, MCU_BORW_EN);
>  

[ ... ]

> @@ -6860,6 +6860,23 @@ static void rtl8156_up(struct r8152 *tp)
>  	if (tp->version < RTL_VER_16)
>  		r8153_u2p3en(tp, true);
>  
> +	switch (tp->version) {
> +	case RTL_VER_13:
> +	case RTL_VER_15:
> +		/* Enable Clear_SDR */
> +		ocp_word_set_bits(tp, MCU_TYPE_USB, 0xd3ca, BIT(15));
> +		break;
> +	case RTL_VER_16:
> +	case RTL_VER_17:
> +		/* Enable Clear_SDR */
> +		ocp_byte_set_bits(tp, MCU_TYPE_USB, 0xd378, BIT(7));
> +		/* Clear SDR bit */
> +		ocp_word_clr_bits(tp, MCU_TYPE_USB, 0xcd06, BIT(15));
> +		break;
> +	default:
> +		break;
> +	}
> +

[Severity: Low]
This isn't a bug, but could this be split into separate patches, one per
Fixes: target?

These parts only affect RTL8156/RTL8156B and fix 195aae321c82:

- The PLA_RCR1 BIT(3) clear.
- The 0xd3ca Clear_SDR write for RTL_VER_13/RTL_VER_15.
- ALDPS_PROXY_MODE and DIS_MCU_CLROOB on OOB entry in rtl8156_down().

The rest, including the PLA_RMS/PLA_MTPS switch in rtl8156_down(), only
matters for code added by fd3c7d080df5 and ad2a55b63b41.

The RCR1 hunk above removes the "if (tp->version >= RTL_VER_16)" gate,
which came from ad2a55b63b41. This switch in rtl8156_up() also puts the
RTL_VER_13/15 and RTL_VER_16/17 cases side by side. As a result, the
patch won't apply to stable trees that have 195aae321c82 but not the
RTL8157/RTL8159 support.

Separate patches would also let a bisect show which of the six register
changes is at fault if one of them causes a regression.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126033211.51850-1-nic_swsd%40realtek.com
