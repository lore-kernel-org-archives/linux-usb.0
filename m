Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753626;
	b=gbxtMC0sGYgmKLNOFv8JjmEzrpwd6hjW0FQ3/mhvah488KnKIOthOideQi+0sBd83QmN
	 T4hvpmWJEDbQXUxz7PYVnVv/+/gXglufx3lnI/yp7/VPKInDxCfenJhXrNnze3nDTC0Cu
	 jiUMrGmcGWaacQ+f9oR6lB+ciNvee697CRYTKApddtiICreHUOFDXxviFkYd6TbEjr3l4
	 V6KdIrYI8o5p5Bw4y/tGXfNd61ZwJvn0nH5joJKh2CztF7Ugeae9nT0GROOApRlOxtnTa
	 wu2ItZlUejm6legV0S+vSYNgXZKvOpoL0DTaD1HaZ1QQxE3TunSCKSDEzq5/pDsoDug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753626;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=AnVF3aqWclhab2tDyVjUIAz+dvlD7Ph4asBpLs76sgM=;
	b=QENIoKmPEJnoEqsM5MCGHR6XsDp3dldxJRHWnRCExv+RigN7gm4MKDNgfPQUQFi6g20K
	 wGmUs5gZgd0L/pOBdLXg5Dv6tnW1ryih4InW2LKuiPBfUlHZPAsZUmAE6Yfqw7dfMCuPL
	 H97DAJ2zhJ2i3myXlSHGnqOZ9MfOWJhwpzs4jpDRzzituD9cJfvZ29juPYqnVOKSNv50J
	 alppnaQ62RWJK8elfZS8/U77QWXKh8nUBkPiGzQ03xxZq9O763TobvajDBm3Opfwt6MQs
	 VT8cAoOQlnrtoHH5DiZ9RYka2f0DhONwmAi+Zx2k6O8yPqCmKgoPoHA2Hp8o0noG51Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=al1QV3xI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56B2606A330;
	Fri, 27 Nov 2026 04:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=al1QV3xI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDC41F000C1;
	Fri, 27 Nov 2026 04:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795753626;
	bh=AnVF3aqWclhab2tDyVjUIAz+dvlD7Ph4asBpLs76sgM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=al1QV3xIkZ5dqOk1kE1P/ZADOJMFYJz3uJFz6XluEcSo0GwKqC01NMupmEwP6etna
	 F5hn515ycJSojfAw5IbCK0K/vX+8S8cEYzLlOm001l+6CbmCiXAWiresaFGi34lOsZ
	 /Q+Lc4dhoWDO+5W4lByJPSCHtjVRQCRj7NwtWXLeG3/d3DVmLOmK+WQI/KCiMR3Ah7
	 WSYWQrFj+R3c7CNSRt/Fni7EWr61g6BT2ddiVCIrDoWpGPUdSDSDtJL65p+aU0S4EG
	 lVcizVZm+Xw+TInsiIJiZfhOC65BMhqtlEBY/N2063d4p2XJ1gG276RzO5O/l4aHws
	 7qNeuUUjVQ/6w==
Subject: Re: [PATCH net-next v9 10/12] r8152: split r8157_hw_phy_cfg into
 RTL8157 and RTL8159 variants
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Fri, 27 Nov 2026 04:27:05 +0000
Message-ID: <179575362520.3135.17351544520034128631@kernel.org>
In-Reply-To: <20261126033211.51850-11-nic_swsd@realtek.com>
References: <20261126033211.51850-11-nic_swsd@realtek.com>
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

- [Low] r8159_hw_phy_cfg() (drivers/net/usb/r8152.c) adds two RTL8159
  (VER_17_QFN68/QFN100) PHY register writes that neither the code nor…
- [Low] The commit message says that clearing PLA 0xd3c8 BIT(0) ("Disable
  bypass_turn_off_clk_in_aldps") "is needed by both chips" and now also…

--

r8152: split r8157_hw_phy_cfg into RTL8157 and RTL8159 variants

This patch splits r8157_hw_phy_cfg() into an RTL8157-only function and a
new r8159_hw_phy_cfg() for RTL8159 (VER_17_QFN68/QFN100). It also changes
the RTL8159 EEE, 10M clock divider, 0xa5ea and 0x8ffe programming, and
moves the 0xd3c8 bypass_turn_off_clk_in_aldps clear into the shared
prologue so RTL8157 runs it too. Several new RTL8159 PHY tuning parameters
are added as well.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index dbbaf06dca20b..2f3d97e2400c3 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -8231,11 +8242,14 @@ static void r8157_hw_phy_cfg(struct r8152 *tp)

[ ... ]

>  	/* Disable ALDPS force mode */
>  	ocp_reg_clr_bits(tp, 0xa44a, BIT(2));
>  
> +	/* Disable bypass_turn_off_clk_in_aldps */
> +	ocp_byte_clr_bits(tp, MCU_TYPE_PLA, 0xd3c8, BIT(0));
> +

[Severity: Low]
This isn't a bug, but should this patch carry Fixes: tags?

The commit message says the 0xd3c8 BIT(0) clear "is needed by both
chips". Until now r8157_hw_phy_cfg() has not run it for RTL8157, and the
RTL8157 support came in with fd3c7d080df5 ("r8152: Add support for the
RTL8157 hardware").

In the same way, the RTL8159 EN_10M_CLKDIV, 0xa5ea and 0x8ffe changes in
r8159_hw_phy_cfg() correct programming added by ad2a55b63b41 ("r8152: Add
support for the RTL8159 chip"):

	ocp_reg_clr_bits(tp, OCP_DOWN_SPEED,
			 EN_EEE_100 | EN_EEE_1000 | EN_10M_CLKDIV);
	tp->ups_info._10m_ckdiv = false;

Other "per the datasheet" corrections in this series that target the same
two commits do carry Fixes: tags. Examples are "r8152: add
rtl8157_unload() for RTL8157 and RTL8159", "r8152: add
rtl8157_change_mtu() for RTL8157 and RTL8159" and "r8152: fix
RTL8156/RTL8156B/RTL8157/RTL8159 up and down settings".

This patch has no tag and doesn't describe a user-visible symptom. That
makes it hard for stable and distro backporters to tell whether the old
programming caused real problems or whether this is only a datasheet
alignment. Could the commit message say which one it is?

[ ... ]

> @@ -8372,22 +8459,35 @@ static void r8157_hw_phy_cfg(struct r8152 *tp)

[ ... ]

> +		sram2_clr_bits(tp, 0x83ef, 0x0e00);
> +
> +		ocp_reg_w0w1(tp, 0xbf38, 0x01f0, 0x0160);
> +		ocp_reg_w0w1(tp, 0xbf3a, 0x001f, 0x0014);
> +		/* shorten CLKS latency */
> +		ocp_reg_clr_bits(tp, 0xbf28, BIT(14) | BIT(13));
> +		ocp_reg_clr_bits(tp, 0xbf2c, BIT(15) | BIT(14));
> +		/* CMP_Timer on MP_Timer=333
> +		 * GPHY OCP 0xbf28 bit[0] = 0x1
> +		 * GPHY OCP 0xbf28 bit[6:1] = 0x3
> +		 * GPHY OCP 0xbf28 bit[12:7] = 0x3
> +		 */
> +		ocp_reg_w0w1(tp, 0xbf28, 0x1fff, 0x0187);
> +		ocp_reg_w0w1(tp, 0xbf2a, 0x3f, 0x03);

[Severity: Low]
This isn't a bug, but what do the 0xbf38 and 0xbf3a writes in
r8159_hw_phy_cfg() configure?

They have no comment. None of the new RTL8159 tuning parameters listed in
the commit message (shorten CLKS latency, CMP_Timer on MP_Timer=333,
spdchg_pga1_lpf_cap, ENET PLL jitter improvement) seem to cover them.

The CMP_Timer comment also describes only the 0xbf28 bit fields. Nothing
explains the 0xbf2a write that follows it.

Could these writes get a short comment, and a mention in the commit
message, so each one can be traced to the datasheet item it implements?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126033211.51850-1-nic_swsd%40realtek.com
