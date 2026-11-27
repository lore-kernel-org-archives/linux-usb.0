Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753622;
	b=ff7DZ3YL+TOiDaG94/cYv3KGxDsbS+ZMWJLIoYWQXLkbMk7lD2yZSfC+SFFrGanMbkoO
	 vXffOW9MDFWX6iF2a6Bjpx+yx/Z+vwiFv3o22CXCzahuUdvnI66ru7/yBxQ7VKecf8lt9
	 U7g9xDg3V5ZsZJhsWiuSKzV0afmuUevA3jiT/6KeeIRxgUULBDZI13TQjouAPLEncc+VZ
	 dArhHdqnF12HDLD+UIR0ttzLmKdjJdrRO6y0s6CMJGq6gPf0BOyQTUsfW6PCRG4hw06h4
	 H4aTWDfFwXC23HUrVfH/p6Ml1DrwDQ3E2N/ou5cbzkI4ukAwUphy50j+0EPmdLwurZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753622;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zJKuJ7vg9PpqIh/0IWbImhEqiaev0DXuAD3r2o7D1ow=;
	b=FMmrM5i9JtWUeOo5o0uqPq2iYM6Yo9UGY4vNtg3xc1EO5Tx21ryrxOUhKXRcXFCDBDi0
	 mkgVPO/gQ89EGt9oXhnDx0t2CQiOrukt//gjEagMv0668/a/6km/kXGasI2TsGyGExayO
	 GdUXgxg4rCovLGp/pCKICoRuaLjTEwePhck+tH0qFz1XbxjbV2U/nddYgCBF25rvGeT79
	 ifyXRDL8AmKxprhQqq1nIgZRRtGkbApkEvtf0WXNhwCU8qHhDJJmq2p48Hq9eCLuP6yZg
	 PuwHARggN8g+gntco6VeOhP22qVeLgrjJLxIx6jmxP2/ADEDW+l/4RyL5Xqg5BYRK/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K8laFION;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6A9606A32F;
	Fri, 27 Nov 2026 04:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K8laFION
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CC21F00893;
	Fri, 27 Nov 2026 04:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795753622;
	bh=zJKuJ7vg9PpqIh/0IWbImhEqiaev0DXuAD3r2o7D1ow=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K8laFIONL2n0Djtz3VSa3NqwackBnfRkpV5/VRrPB+bv/B5Ln2xWnkf8Ix9lTWBVu
	 jHuJ04Y7V16fwynInsixFnSQeUxMG+HO6D7sl4Kq1pEtCfSyBDCisYiHxlhGuSzVZn
	 FQHkYXwmwCRUc8wMCZ4FgyyX8ZApFhMGy4Qymq8UYlmaNc1Hfj70nGGffJ+gxWK5p/
	 HJM/FmUqUBE6P9xWxw/tlRfJ9e4xwdwksIoUiwPIH/2ccJZfRw5R6JEol251BxJd9Y
	 G7Rv5Zvq5JOH4xtT25I6ZKr6rCnj31hV2BhD59tXnPIeEDDsH8iw00J8RqL5/pt3rD
	 trpCx/yN3YtbA==
Subject: Re: [PATCH net-next v9 02/12] r8152: add rtl8157_unload() for RTL8157
 and RTL8159
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Fri, 27 Nov 2026 04:27:01 +0000
Message-ID: <179575362138.3135.2071411045899794230@kernel.org>
In-Reply-To: <20261126033211.51850-3-nic_swsd@realtek.com>
References: <20261126033211.51850-3-nic_swsd@realtek.com>
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

- [Low] Commit "r8152: add rtl8157_unload() for RTL8157 and RTL8159" has
  two Fixes: tags (fd3c7d080df5, ad2a55b63b41), but its only…

--

r8152: add rtl8157_unload() for RTL8157 and RTL8159

This patch gives RTL8157 and RTL8159 their own rtl8157_unload()
callback. The callback uses r8157_power_cut_en() instead of
r8153_power_cut_en(). The 0xcf04 Interrupt Mitigation clear moves from
rtl8153_unload() into the new function.

> RTL8157 and RTL8159 used rtl8153_unload(), which disables power cut
> with r8153_power_cut_en(). Per the datasheet they need
> r8157_power_cut_en(), which r8156_init() already calls for them.

[Severity: Low]

This patch carries two Fixes: tags. The only reason given is "Per the
datasheet they need r8157_power_cut_en()". Could the commit message say
what goes wrong for users when RTL8157 and RTL8159 use the old
rtl8153_unload()?

The unload callback runs from rtl8152_disconnect() on unbind or module
removal. It also runs from the out1 error path in rtl8152_probe_once().

Where does the problem show up? For example, is it on re-bind, with a
fallback class driver, or in the device's power state after unbind?

The commit message also leaves out the register changes. The old path
cleared both bits in USB_POWER_CUT:

r8153_power_cut_en(tp, false)
    ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_POWER_CUT,
                      PWR_EN | PHASE2_EN);
    ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_MISC_0, PCUT_STATUS);

The new path leaves PHASE2_EN unchanged. It also clears USB_MISC_2
BIT(1), which the old path never touched:

r8157_power_cut_en(tp, false)
    ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_POWER_CUT, PWR_EN);
    ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_MISC_0, PCUT_STATUS);
    ocp_byte_clr_bits(tp, MCU_TYPE_USB, USB_MISC_2, BIT(1));

Could the commit message describe these register differences and the
user-visible impact? Documentation/process/submitting-patches.rst asks
for both in fixes.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126033211.51850-1-nic_swsd%40realtek.com
