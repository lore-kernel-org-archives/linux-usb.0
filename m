Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753624;
	b=2cQdBUq8noCSPhzry85lkgdG09UBWuCeBk4zIVHEPwZh3mYS0qDTqIEF61/TIYtjWrN+
	 PWJTUreMLtgimCOxeyuTJuHBAo87unXyHC9y9S1PLGp5vKgio2k5zY66IZ4/NmDdLes9G
	 qecAy6GQCsLKkhfW0ZKEwDSTb1Mt6MTitnyAjrkaP8RcsiO+MQNCItbXFFMats6SpPszv
	 r9VEA65/I87yJj9dNZZl5yQCxGrKdEnIDxTKQ7K7YmgtzI7voa9iOP2pHL0FZBkhNP7LG
	 0pVPAWlcwRnfqrcBGvg/hccbu99MbitMnWHJQxOaHBLP3OyZDCLRrTE5kDE0HDKMvVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753624;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=aM7yTZa2mR1XHJV/CGPWguWQsTg/lG+DKYjci4/Vjco=;
	b=I/sjGlU45+p2nDUmH/HFO8ydQY3e/p8bXeiSUQQfICTH5S9v07hj8hXfB7rvdMyziZCX
	 xT/l938bOHigEsxedWU/8tVsR0fK6QSJZYZ5FgPIZ0kI9SxavLNOQav7gc+lAi/swDKkZ
	 sc00HMVgfIXBscvFEZzzVMvbTvz0gzIzPckgq5RL04qtJFCx5VgK+96acUZwzQGyjdPI0
	 FvWSs+RYbtf8TxJDOpOSTNw0evDfayXxbvraCzQ8VJ4f60CX6bt0Vcd24eoeT/vg+oQc6
	 DvaH3XlWL3rvCBIYvhthwVCiR7yKRldioj1Iqad0h7i13VGTSSyCHLAQyAVHeuDOjhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ltmiJSkh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF40606A334;
	Fri, 27 Nov 2026 04:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ltmiJSkh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFF71F00925;
	Fri, 27 Nov 2026 04:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795753624;
	bh=aM7yTZa2mR1XHJV/CGPWguWQsTg/lG+DKYjci4/Vjco=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ltmiJSkh1N/uSfnZVvELdlJk/ydOiVgbfRj3Eoj1QaWgckvIYEkdBou9vIWND0Dmr
	 SiPlXJz7zpLRat6TX998z1l+ZvBx48js64VjWheF7yB+mOIWTxildmmFxYe8YLLlFQ
	 uOB8ZnhjMmGWfTQNZTAJ/YDNrnbE3p3P9n9qlWqF0OsRBgDdNcQD9axZoOEpwhhcdX
	 kWpZIDSOwfNA28+s31kFLCVXlzjstKDklfhWCdPQnRKNosc+9kPbxNy9ScR2aqm8ja
	 PHN/B2zzHX4WYmAsQqqhMZE2p6OpAJYj6DvFdqykvWl6/WkqrTEt6PZJbBl0CZLSsu
	 YkxJr+5FG6/Tw==
Subject: Re: [PATCH net-next v9 08/12] r8152: split RTL_VER_17 into QFN68 and
 QFN100 package variants
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Fri, 27 Nov 2026 04:27:03 +0000
Message-ID: <179575362324.3135.9669497990549921570@kernel.org>
In-Reply-To: <20261126033211.51850-9-nic_swsd@realtek.com>
References: <20261126033211.51850-9-nic_swsd@realtek.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Before this patch, chip ID 0x2020 always mapped to RTL_VER_17
  and r8152 drove it.
- [Low] The commit message says QFN100 "uses a different firmware image
  from QFN68" and gives "guessing a package could load the wrong…

--

r8152: split RTL_VER_17 into QFN68 and QFN100 package variants

This patch splits RTL_VER_17 into RTL_VER_17_QFN68 and RTL_VER_17_QFN100.
The package is detected by reading the new PLA_PKG_DET register from
__rtl_get_hw_ver(). QFN100 parts now load rtl_nic/rtl8159-2.fw instead of
rtl8159-1.fw, and r8157_init() gains a QFN68-only u2phy backup restore
write.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 3e16d0f832bc3..151acb0f58da6 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -10223,9 +10253,12 @@ static int rtl_fw_init(struct r8152 *tp)
>  	case RTL_VER_16:
>  		rtl_fw->fw_name		= FIRMWARE_8157_1;
>  		break;
> -	case RTL_VER_17:
> +	case RTL_VER_17_QFN68:
>  		rtl_fw->fw_name		= FIRMWARE_8159_1;
>  		break;
> +	case RTL_VER_17_QFN100:
> +		rtl_fw->fw_name		= FIRMWARE_8159_2;
> +		break;
>  	default:
>  		break;
>  	}

[Severity: Low]

The commit message says:

  QFN100 uses a different firmware image from QFN68, so rtl_fw_init()
  selects rtl8159-2.fw for it and keeps rtl8159-1.fw for QFN68.

It also explains rejecting unknown packages with "guessing a package could
load the wrong firmware".

Before this patch, every 0x2020 chip got rtl_nic/rtl8159-1.fw, QFN100 parts
included. If that image was wrong for QFN100, is this a fix to the original
RTL8159 support? Other fixes in this series carry a tag like:

  Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")

Should this patch carry one too?

Is rtl_nic/rtl8159-2.fw already in linux-firmware?
rtl8152_request_firmware() does not fail when the file is missing:

result:
	if (rc) {
		rtl_fw->fw = ERR_PTR(rc);

		dev_warn(&tp->intf->dev,
			 "unable to load firmware patch %s (%ld)\n",
			 rtl_fw->fw_name, rc);
	}

If the new file is not published yet, QFN100 users would go from loading
rtl8159-1.fw to running with no firmware patch at all. Only a warning would
show the change.

Could the commit message say whether this is a fix or a feature, and where
the new firmware can be found?

[ ... ]

> @@ -10318,7 +10382,20 @@ static u8 __rtl_get_hw_ver(struct usb_device *udev)
>  		version = RTL_VER_16;
>  		break;
>  	case 0x2020:
> -		version = RTL_VER_17;
> +		ret = __rtl_get_pkg_det(udev, &pkg_det);
> +		if (ret < 0) {
> +			version = RTL_VER_UNKNOWN;
> +			dev_err(&udev->dev, "Failed to read package: %d\n",
> +				ret);
> +		} else if (pkg_det == 0x1e || pkg_det == 0x1c) {
> +			version = RTL_VER_17_QFN68;
> +		} else if (pkg_det == 0x18 || pkg_det == 0x1a) {
> +			version = RTL_VER_17_QFN100;
> +		} else {
> +			version = RTL_VER_UNKNOWN;
> +			dev_info(&udev->dev, "Unknown package 0x%04x\n",
> +				 pkg_det);
> +		}
>  		break;
>  	default:
>  		version = RTL_VER_UNKNOWN;

[Severity: Medium]

Before this patch, chip ID 0x2020 always mapped to RTL_VER_17. Now it maps
to RTL_VER_UNKNOWN in two cases:

  - __rtl_get_pkg_det() fails (three failed control reads, a short read,
    or -ENOMEM).
  - The masked value is not 0x1e, 0x1c, 0x18 or 0x1a. That covers 12 of
    the 16 values PKG_MASK allows.

The commit message calls this a fallback. Do the callers treat it as one?
Both of them reject the device:

rtl8152_cfgselector_choose_configuration()
	if (__rtl_get_hw_ver(udev) == RTL_VER_UNKNOWN)
		return -ENODEV;

rtl8152_probe()
	version = rtl8152_get_version(intf);
	if (version == RTL_VER_UNKNOWN)
		return -ENODEV;

In those cases a previously supported RTL8159 is never switched to vendor
mode, and r8152 never drives it. The unknown-package case is logged only
at dev_info. Should the commit message say that a chip which used to bind
to r8152 can now stop binding?

The stated reason is to avoid loading the wrong firmware. Is refusing the
whole device needed for that? rtl8152_request_firmware() already skips
loading when no firmware name is set:

	if (rtl_fw->fw || !rtl_fw->fw_name) {
		dev_info(&tp->intf->dev, "skip request firmware\n");

Also, each caller reads PLA_PKG_DET again on its own: the cfgselector,
rtl8152_probe(), and r8153_ecm_probe() through rtl8152_get_version(). If
one read fails transiently, the callers can get different answers. Could
the cfgselector then switch the device to vendor mode, only for
rtl8152_probe() to reject it?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126033211.51850-1-nic_swsd%40realtek.com
