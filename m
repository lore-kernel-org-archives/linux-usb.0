Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8AF42E8DC
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052442; cv=none; b=Ex+ZG7HgldDIW0M1NlUUZLogISg7/YXmo2uDRKQzah7Y/avfBA0EJyarIXaZ6mFaloDBwU1N9iofC0YQ287zb6VaQvqe1lyd9UAKh/P4BlV/FsnS5b31M1AhaY2iBrQfZmCFLA3tm53bTyA2i0eUzcQYUJStqezeY9MgJCH1OXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052442; c=relaxed/simple;
	bh=QiSoUZSxIz8T+qslMyaxDZD6XX8N2Lma494wpzAkwOM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WuuQNScPM7YENQftF3nk8xd2zre5G7MyQM41/UyeUQ0HRNyz3+f21HsS9ZFF4tw6uizSn0ZZdJOsnkNcNWkqB7SYboZj+vMrAvebj/uU8oKSQbNF8h9EAXyaq/0w/gN3IoFfg/Qf3SN53tRIXQS/iRz9dFISyJ9kXAmOO6ROAKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJEF328h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJEF328h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB0E1F000CA;
	Thu, 15 Oct 2026 08:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052439;
	bh=dymxCw5MQJeAuOkpNfryJX6sxBQt8HNZlYHjfXq+uyM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AJEF328hwkMGKljh22bctO1NeXTAW+yTNCRn88exwNUVzwPuaXtXhgC53cliuGWcy
	 U7Gh/21H9RWqVQ+JM2EHd7I8y0YLoODHwh/9iQd7SNj3hw8BNVL3EET4lytcNCLg1i
	 vXQgOWRYBZObXqAgr047S/XBqwCxJ8l6UuXBIy8rDM3QsAdusbS/4OOuTt4fB8QeAs
	 TY8t8wQ3myhBic0x3VHSfqRj/WlAmh8zdXY5Ge8XHJbfaoL+KX/mUzZWimGh6weGAV
	 MD7w3xaEmQATnfOZgMrA8iySZYmccVF/O/8paecT0tnvCdy06yLFiWQ/pZu6bt/SOe
	 q5quTNPTkFdqg==
Message-ID: <sashiko-outbox-172469@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 10/10] r8152: enable UPS for RTL8157 and
 RTL8159 QFN68
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014081904.6491-11-nic_swsd@realtek.com>
References: <20261014081904.6491-1-nic_swsd@realtek.com>
 <20261014081904.6491-11-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:20:38 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] r8152: uninitialized stack memory usage on ups timeout
--

commit ccaf26bc04b9e38bb645175ba5efb0ef8a733f8f
Author: Chih Kai Hsu <hsu.chih.kai@realtek.com>

r8152: enable UPS for RTL8157 and RTL8159 QFN68

This commit enables UPS for RTL8157 and RTL8159 QFN68 devices by adding
r8157_ups_en() and modifying UPS flags encoding.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 95f510da376de..7a1b34db1d88b 100644
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

[Severity: High]
If the backup-restore wait in r8157_ups_en() times out, it flags the device
inaccessible but returns void. This hides the failure from callers like
rtl8157_runtime_enable(), which will then proceed with initialization.

Because the device is inaccessible, generic_ocp_read() will abort early
without writing to the provided buffer. Accessors like ocp_read_word()
do not check this return value and process uninitialized stack memory:

static u16 ocp_read_word(struct r8152 *tp, u16 type, u16 index)
{
	u32 data;
	__le32 tmp;
...
	generic_ocp_read(tp, index, sizeof(tmp), &tmp, type | byen);

	data =3D __le32_to_cpu(tmp);
...

This causes the driver to branch randomly based on garbage stack values.
For example, this is called shortly after resume:

static inline u16 rtl8152_get_speed(struct r8152 *tp)
{
	return ocp_read_word(tp, MCU_TYPE_PLA, PLA_PHYSTATUS);
}

Could r8157_ups_en() be updated to return an error code instead of void
so the caller can properly handle the timeout?

> +			}
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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014081904.6491=
-1-nic_swsd@realtek.com?part=3D10
