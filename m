Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34344C10CD
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052438; cv=none; b=KTO9EnJ8MwMj+2lJPGkddiZI4KavM4UNPRd2N2roHmnq2jYx8LCvAfM+z2qvdL7U3uXKEKCze/EHHb8Ag0OIbNXol+1TNhH10Gm/UWTka68CzAxnnpAcGQtFuQrUOc8Gokn5K75tcOzssupXb0n64GecK4pU3y/Fa04Xyb4r1os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052438; c=relaxed/simple;
	bh=yhB+80j3oQS2kI2lNyWIJcwvg3CPvSz8aK8Yv/gmww0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TmfzcD9jVk7ee435/Eer7WhJRvuzZJyPq7jbUDzIfCLVet1asivMpXUEcQg9mJRt8w/DIl+EfC2v1aa9Jum1h+L0kcy0B9j+MZ/EIx87EEg6MZJDw53piM9KK4VOrQYrMhiQ/+8yhiwE/TcQ/IZZw0fJaPOBFDKgf1cuAg2rMQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSXtzLC1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSXtzLC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FA31F000C4;
	Thu, 15 Oct 2026 08:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052434;
	bh=w8IZuefjxrJrNNiJrMmDH+txnlBFXCOdApIbquIl2D0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hSXtzLC18Q59CjucnCk59z9bB7Mtga3P1y7M1MMdqLxRwMUgHj4CCyX/yY2ww1TSH
	 NOMeuYk7l8HL8c758GPLWC6SzOGXEpUgDn8mBch1yuA/Q64v6gYRrDUf8radIVMvoC
	 vyXWcPETAp99H+fC3F80R2WS473keN2RB2fXJqBVNv5JnEQfO1hjo7BvkQvQKl3mB9
	 9tAgBRU+pReIv3YWDG4IQ28mFTXtpsMmfoyDBDPVVnS34yVXjpeTCecmL0yTYmorGj
	 Gy6cwtsYF2Z69U0WDjgzS8r2DcuSdvLDgY3efR/5TGno1E3VI76TBhkRtdn9vrJQ32
	 cHdGQugKknDlw==
Message-ID: <sashiko-outbox-172462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 01/10] r8152: split r8156_init by generation
 and factor out wait_autoload_done
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014081904.6491-2-nic_swsd@realtek.com>
References: <20261014081904.6491-1-nic_swsd@realtek.com>
 <20261014081904.6491-2-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:20:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: r8152: uninitialized stack memory read via read_poll_timeou=
t()
--

commit 7e3b002970c7595bd4777521d55501576d7f77e7
Author: Chih Kai Hsu <hsu.chih.kai@realtek.com>

r8152: split r8156_init by generation and factor out wait_autoload_done

This commit splits r8156_init into two generation-specific functions and
factors out the repeated AUTOLOAD_DONE polling loop into a new common
wait_autoload_done helper using read_poll_timeout.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index af3d7dcb2f141..518a2b42c2200 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -4172,6 +4172,23 @@ static u16 r8153_phy_status(struct r8152 *tp, u16 =
desired)
>  	return data;
>  }
> =20
> +static int wait_autoload_done(struct r8152 *tp)
> +{
> +	u16 ocp_data;
> +	int ret;
> +
> +	ret =3D read_poll_timeout(ocp_read_word, ocp_data,
> +				test_bit(RTL8152_INACCESSIBLE, &tp->flags) ||
> +				(ocp_data & AUTOLOAD_DONE),
> +				20000, 10 * USEC_PER_SEC, false, tp,
> +				MCU_TYPE_PLA, PLA_BOOT_CTRL);

[Severity: Medium]
When the device is inaccessible, could this read uninitialized stack memory?

The read_poll_timeout macro executes the read operation before evaluating
the condition. In this case, ocp_read_word is called before checking
test_bit(RTL8152_INACCESSIBLE, &tp->flags).

If the device is inaccessible, generic_ocp_read returns -ENODEV and leaves
the local variable tmp uninitialized. However, ocp_read_word ignores this
return code and proceeds to read the uninitialized memory:

drivers/net/usb/r8152.c:ocp_read_word() {
    __le32 tmp;
    ...
    generic_ocp_read(tp, index, sizeof(tmp), &tmp, type | byen);

    data =3D __le32_to_cpu(tmp);
    ...
}

The original open-coded loops explicitly checked the inaccessible flag befo=
re
calling ocp_read_word, which avoided this.

> +
> +	if (ret)
> +		dev_err(&tp->intf->dev, "autoload done timeout\n");
> +
> +	return test_bit(RTL8152_INACCESSIBLE, &tp->flags) ? -ENODEV : 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014081904.6491=
-1-nic_swsd@realtek.com?part=3D1
