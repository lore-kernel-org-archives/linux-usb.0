Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750404;
	b=dYbi7ma0gqUiWUDuafDeB/suu+zqZ9uKRPXp7suXMa6cSLsYIy8H/PFT9lB+uwDhbDUp
	 89Vkv0V6k/KAyFlf1KQ3ONzZt7X2PEzssnk09tgH/32LaA44UwetFn8U9ILwpHWVHO/x7
	 Z9DoOBb0h41hwXHbsMHbd6EdrnjZXMNPiQ5mbGGgVQd0cdgzEwk/idYHrxuOReBRerSQ7
	 AuaajOO/1KOOMbOfc4a0DMV7+82xrYPnS5Jx7Cal+SjvQDKOlP16JfDhNS8OKJmhjn/hQ
	 aGUChXu56Du+U+ZfR6f/zvcXubEevvdhec9MhblOqhj1PoMfy41g7TOkp1K2jXPBLQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750404;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1El5FEmetZM0kJ2MMf0UZ+Ycmtb1q+CwrYO8lTjxkPs=;
	b=tLH1pzNjqQm3a20aWsp3oq3hW3TG5nuPQSLgnnyoj8JAnA/9lCQB0RuakffghAZVydiP
	 QJGIapVXLKP5Z+v7yHsGHoOzzoIadjPPlTbbA2y8JzrfynfA3NlK7Ir46gSkDINUx2EkS
	 9z6BBj0uUzfK1N5HXgeJg2iTD7BGbO0ErthyhlqTpCnv7787nnqUilhR4MsmSbz4MYdjL
	 +Iq4cQV2Ygx+eIffRzm0XrOhIWro4sD0l4zfRBeKFY0F3F92rulL9NS+yyHT8VZfQ6KRO
	 kd/ShOnHDfrcNqqgasBAujXuDSeR4+IqaHK0FW6Co4oLCAg2XJp3Ev7Gu0vHdx73BPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwv5Ddw6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C15B606A330
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 03:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwv5Ddw6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9234A1F00897;
	Fri, 27 Nov 2026 03:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795750403;
	bh=1El5FEmetZM0kJ2MMf0UZ+Ycmtb1q+CwrYO8lTjxkPs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jwv5Ddw6BsUJvaf2ipeZAcqxtPhfDAOJ5upinwi5PSBciwZOy5q/ojIiz9/cWh9jf
	 f6/JBFamOdPXyaiieSqPs0187asEVeZ0QcOEMmmHlzTAdHObBiFYfpEusEOqYLk6f2
	 FfI9VzcKfPV8gqDQYv4L1Bh9e+roN06Xf83MDF2ViJOgfSfH9d/RT+JgBbs9uBF3a5
	 iTqlVs9HjbDLILlfqa6AHZ2PdDJg/xz4N+w1TEpocaJqL+yC9izoMue8uF/wZFNIA0
	 sGBeYrnUDBiAz9xMTC6Ntxs2B3LxKO+bvq7aXS05O3NBFapXRHx5UTs9Mu/rgKy7fm
	 5uJQAj+jqKLYw==
Message-ID: <sashiko-outbox-236550@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 12/12] r8152: enable UPS for RTL8157 and
 RTL8159 QFN68
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126033211.51850-13-nic_swsd@realtek.com>
References: <20261126033211.51850-1-nic_swsd@realtek.com>
 <20261126033211.51850-13-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 03:33:23 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] r8152: PLA registers accessed before disabling UPS in
  rtl8157_runtime_enable()
- [Medium] r8152: unrecoverable RTL8152_INACCESSIBLE latch in
  r8157_ups_en()
--

commit 969f829c47717852eb0b5d703e7c04a94d02bba2
Author: Chih Kai Hsu <hsu.chih.kai@realtek.com>

r8152: enable UPS for RTL8157 and RTL8159 QFN68

This commit adds r8157_ups_en(), updates r8156_ups_flags() with per-speed
EEE and speed flags, and enables UPS during runtime suspend and resume for
RTL8157 and RTL8159 QFN68.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index e6a5d35403a28..e294e52b426b5 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
[ ... ]
> @@ -4496,6 +4534,58 @@ static void r8156_ups_en(struct r8152 *tp, bool en=
able)
>  	}
>  }
> =20
> +static void r8157_ups_en(struct r8152 *tp, bool enable)
> +{
> +	u32 ocp_data;
> +	int ret;
> +
> +	if (enable) {
> +		r8156_ups_flags(tp);
> +
> +		ocp_byte_set_bits(tp, MCU_TYPE_USB, USB_POWER_CUT,
> +				  UPS_EN | USP_PREWAKE | PHASE2_EN);
> +
> +		ocp_byte_set_bits(tp, MCU_TYPE_USB, USB_MISC_2,
> +				  UPS_FORCE_PWR_DOWN);
> +	} else {
> +		ocp_byte_clr_bits(tp, MCU_TYPE_USB, USB_POWER_CUT,
> +				  UPS_EN | USP_PREWAKE);
> +
> +		ocp_byte_clr_bits(tp, MCU_TYPE_USB, USB_MISC_2,
> +				  UPS_FORCE_PWR_DOWN);
> +
> +		ocp_data =3D ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0);
> +		if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +			return;
> +
> +		if (ocp_data & PCUT_STATUS) {
> +			ret =3D read_poll_timeout(ocp_read_word, ocp_data,
> +						test_bit(RTL8152_INACCESSIBLE,
> +							 &tp->flags) ||
> +						(ocp_data & BACKUP_RESTRORE),
> +						200, 20000, false, tp,
> +						MCU_TYPE_USB, USB_GPHY_CTRL);
> +			if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +				return;
> +
> +			if (ret) {
> +				rtl_set_inaccessible(tp);
> +				dev_err(&tp->intf->dev,
> +					"backup-restore timed out\n");
> +				return;
> +			}

[Severity: Medium]
As reported by Jakub Kicinski on v7 [1], if this BACKUP_RESTRORE poll
times out during runtime resume on RTL_VER_16 or RTL_VER_17_QFN68,
shouldn't this queue a USB reset (e.g. via
usb_queue_reset_device(tp->intf)) or pass the error back rather than
leaving recovery to a follow-up series?

Because the USB control reads succeed, r8152_control_msg() does not queue
a reset, and rtl8152_resume() skips its usb_reset_device(tp->udev)
fallback when runtime_resume is true.  Once RTL8152_INACCESSIBLE is
latched here, all subsequent register accesses short-circuit with -ENODEV
and the interface remains dead until a physical replug or an external
reset.

> +
> +			/* clear USB fw_ver_reg */
> +			ocp_write_byte(tp, MCU_TYPE_USB, USB_FW_USB_VER, 0);
> +
> +			tp->rtl_ops.hw_phy_cfg(tp);
> +
> +			rtl8152_set_speed(tp, tp->autoneg, tp->speed,
> +					  tp->duplex, tp->advertising);
> +		}
> +	}
> +}
> +
>  static void r8153_power_cut_en(struct r8152 *tp, bool enable)
>  {
>  	if (enable)
> @@ -4654,9 +4744,28 @@ static void rtl8157_runtime_enable(struct r8152 *t=
p, bool enable)
>  		r8153b_u1u2en(tp, false);
>  		r8157_u2p3en(tp, false);
>  		rtl_runtime_suspend_enable(tp, true);
> +
> +		switch (tp->version) {
> +		case RTL_VER_16:
> +		case RTL_VER_17_QFN68:
> +			r8157_ups_en(tp, true);
> +			break;
> +		default:
> +			break;
> +		}
>  	} else {
>  		r8153_queue_wake(tp, false);
>  		rtl_runtime_suspend_enable(tp, false);
> +
> +		switch (tp->version) {
> +		case RTL_VER_16:
> +		case RTL_VER_17_QFN68:
> +			r8157_ups_en(tp, false);
> +			break;
> +		default:
> +			break;
> +		}

[Severity: Medium]
Should r8157_ups_en(tp, false) be called before r8153_queue_wake(tp, false)
and rtl_runtime_suspend_enable(tp, false) on runtime resume, matching
rtl8153b_runtime_enable(), rtl8153c_runtime_enable() and r8157_init()?

Calling r8153_queue_wake() and rtl_runtime_suspend_enable() first reads
and writes MCU_TYPE_PLA registers (such as PLA_INDICATE_FALG, PLA_CONFIG5,
PLA_CFG_WOL and PLA_CONFIG34) while UPS is still active and before
r8157_ups_en(tp, false) waits for BACKUP_RESTRORE to finish after a power
cut.  Those PLA writes can be dropped while powered down or overwritten by
the hardware backup-restore snapshot, leaving runtime-suspend wake and WoL
settings enabled after resume.

[1] https://lore.kernel.org/r/20261021005214.1255071-1-kuba@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126033211.5185=
0-1-nic_swsd@realtek.com?part=3D12
