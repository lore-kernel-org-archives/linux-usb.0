Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E10739185A
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 08:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533846; cv=none; b=tiDvJJaardu1VJZExAYY+fcXsqv8JdJ7W51y9LmcR3NI/3Fv9j0a4gBpGkDLrzFpISbdshqK9yU5Obj+SBZ0yStu+jCK/d0VD9kn9aiomjp+gl4FVib+oW5CAwAsA/WhoUCFo8BTzuas3eKhplNOkqY5THE+nQdnA8cQH3E1YXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533846; c=relaxed/simple;
	bh=xsGqcZT+diZaFFjPfu1CnKeSp8z3u/RKKmrTFkJEdhs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fxsLyzAmo6kBz15sT35ylWTUlmVgK9u0PSJ/klYy472eQWNClimXUekJ6yitl+w9HQCfAlReabo63PygKiUWy8B8/pA5yFHtzj+rlvyLujFJMBVvaarIx2PNnlLUuG37VXCMtdYt0lpMWj84n6Yy8kLBV+TJKEmxdmzGi7099zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aojmdBhv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aojmdBhv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02B41F0089A;
	Fri,  9 Oct 2026 08:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791533845;
	bh=Qk3TCGoeGRl9CtVjVG323toYO0eWg4sWpxPgRhUn87I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aojmdBhvpztVw6YtqfSCEBo3Mvv57RFBP5k8usTcW5SEQO4AtQA2rxcXEMHLPqkqS
	 0Xk4i8q9/xM2zMR+tkp2sf/YJXbvW55OwNTAiMVwlZrrhceRDgJ/Ag7OgXZcMXH9Es
	 L+4R/xv1p1yOJdoD1dpGWnJY009xsgfSifbr7hh+7YEtO19Nj/eXRC6dR60exHZpbG
	 2KZINDyVYIlLpLYswdrimC/fMelW8WpZ8X5WWRakCMmwVI5LS7w951R+Zxq4oIRsM/
	 Yu8mKYbILIILmhIBOot1lv5RUMMdUJpTyxE/nxAasnOyESM5FMJOf8k+ocd1E/OhT6
	 UxCyX8E/lVHhw==
Message-ID: <sashiko-outbox-165070@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 10/10] r8152: enable UPS for RTL8157 and
 RTL8159 QFN68
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008081556.47901-11-nic_swsd@realtek.com>
References: <20261008081556.47901-1-nic_swsd@realtek.com>
 <20261008081556.47901-11-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:17:24 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usbnet: RTL8157 wedged indefinitely on backup-restore timeout duri=
ng resume
--

commit 7b305a1f1e5d990f88ed67089a2652404d9a353b
Author: Chih Kai Hsu <hsu.chih.kai@realtek.com>

r8152: enable UPS for RTL8157 and RTL8159 QFN68

This commit enables UPS for RTL8157 and RTL8159 QFN68 by adding
r8157_ups_en(). It also extends r8156_ups_flags() with per-speed EEE
flags and adds the USB_FW_USB_VER register.

>     If the backup-restore wait in r8157_ups_en() times out, it marks the
>     device inaccessible and logs, without queuing a reset, as
>     r8159_init() does for the same wait. During runtime resume the
>     interface then stays unusable until a replug or an unrelated reset,
>     since r8157_ups_en() returns void and the error is not passed back.
>     Recovery for these timeouts is left to a follow-up series.

[Severity: High]
Is it acceptable to leave the device in a wedged state? Known unhandled
device wedges are regressions that should be fixed in the same series,
rather than leaving the device permanently inaccessible until a replug.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index b5092fdaa12c7..fc75e263b0e4c 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -4484,6 +4522,49 @@ static void r8156_ups_en(struct r8152 *tp, bool en=
able)
>  	}
>  }
> =20
> +static void r8157_ups_en(struct r8152 *tp, bool enable)
> +{
> +	if (enable) {

[ ... ]

> +	} else {
> +		ocp_byte_clr_bits(tp, MCU_TYPE_USB, USB_POWER_CUT,
> +				  UPS_EN | USP_PREWAKE);
> +
> +		ocp_byte_clr_bits(tp, MCU_TYPE_USB, USB_MISC_2,
> +				  UPS_FORCE_PWR_DOWN);
> +
> +		if (ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0) & PCUT_STATUS) {
> +			u32 ocp_data;
> +			int ret;
> +
> +			ret =3D read_poll_timeout(ocp_read_word, ocp_data,
> +						ocp_data & BACKUP_RESTRORE, 200,
> +						20000, false, tp, MCU_TYPE_USB,
> +						USB_GPHY_CTRL);
> +			if (ret) {
> +				rtl_set_inaccessible(tp);
> +				dev_err(&tp->intf->dev,
> +					"backup-restore timed out\n");
> +				return;
> +			}

[Severity: High]
Can this abandon the device in a wedged state upon timeout?

When rtl8157_runtime_enable() calls this on runtime resume and the timeout
occurs, the device is marked inaccessible but the error isn't passed back
since the function returns void.

Because the device is inaccessible, rtl8152_get_speed() returns 0, skipping
rtl_start_rx() which is the only path that could queue a reset:

drivers/net/usb/r8152.c:rtl8152_runtime_resume() {
    ...
		if (netif_carrier_ok(netdev)) {
			if (rtl8152_get_speed(tp) & LINK_STATUS) {
				rtl_start_rx(tp);
			} else {
				netif_carrier_off(netdev);
				tp->rtl_ops.disable(tp);
				netif_info(tp, link, netdev, "linking down\n");
			}
		}
    ...
}

Additionally, the synchronous reset fallback is intentionally skipped during
runtime resume:

drivers/net/usb/r8152.c:rtl8152_resume() {
    ...
	if (!runtime_resume && test_bit(RTL8152_INACCESSIBLE, &tp->flags))
		usb_reset_device(tp->udev);
    ...
}

Does this code permanently wedge the device until it is physically replugged
or an unrelated reset occurs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008081556.4790=
1-1-nic_swsd@realtek.com?part=3D10
