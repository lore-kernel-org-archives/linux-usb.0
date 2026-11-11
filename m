Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367515;
	b=KyKeZOJj/jrzHw2HlimknxN6vpSXdnu5bS7E6Hc67fGFD+jGYTDeyCLod7sko6prS+85
	 ugE5crFOFpK9V/xjAbjKMERCH6/Bk05d6GJw3wrVKC7hq96tRA/19ffzjyr9zdDGR8okS
	 FStA1y+DtlNqFJxXlhMO3cj/GJbgJYKc5VCCv+aXEVsnv+Mf8ebY57kQRlBJk5MK3F/cT
	 5ISmA3eDAQoSPyQbLRcX2u4a9BQ/gZHFh6gdX70PVMZ62iu9TBRfrbGaOxjfLWdT4ywDu
	 bWKN+TwiN7UAcO9cQ8qKsOYBdZRY2j183vfnrmcemxTp7zPiLd3pkOAdBAG3yjWzBdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367515;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UnfPNTEyGdrSdu3JoUeUrQc5Zj7OkIkLzkCv0h05PAk=;
	b=RB0g+M2ldYtmFPAezF7QyuiWy/KaVNZfVRRWBBIo1/xL730quw2PbS7F+k9KARp/o+iL
	 jDUbOsgJ0UPgBYShWhJ9YVyy7qblymG+/QmNhWMqE7vcpkSkYz8bxFRk4qAHDwqn+zJ0m
	 Jp92RlXRcUudE1KT/pWUVBBBe00cnVPUA4HcjcHNVeS66V36aIHucELY9oVAlO9VbMJHJ
	 r5iPknOFIXxrYtMDzbleOFkNFiUwngb7AB6kdoOUfl1nOBHPChZ+jpO+SCC76/grXoxA2
	 b4Et58ILO2+UVilV3EGQrjG0HDX6IEYjojOGIpb1bJyhziG9glAQUCVsv4aZ4DzLi0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ag1wJB4D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C65E60A2600
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ag1wJB4D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81851F0089F;
	Wed, 11 Nov 2026 03:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367515;
	bh=UnfPNTEyGdrSdu3JoUeUrQc5Zj7OkIkLzkCv0h05PAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ag1wJB4DeVOHhIyKU1pt5rMSVEB/BVERx+y9jpTxSR9+9/QqgHYVumriigUmYU4Jz
	 K7+1ou72g6GhgeqKnQWz4wGn6PmsDSV1kZicXkgBDiCgfpjxMvbJFFRz1G6uJRFkRW
	 Y/du8nRlv9Duz3A4/V0tcWGNcCzzaY3b655b+deMAuJFc0hvzv46QiipkY1sCrQRUi
	 5COPzyC3LmrWbxdx4OoELqqQJuYJA7oCZr0QTTkz4k4gJn463pg/1ShC5CwH9FyzKS
	 QeU7MBeg4LdfAlwNsR/ezAdMUARX73pVxZ+bu96woWfc3JmYGqvayKS+wEDjsqvtMu
	 9hFWlh2MA4X2w==
Message-ID: <sashiko-outbox-208186@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 05/11] r8152: split r8156_init by generation
 and factor out wait_autoload_done
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110032416.16968-6-nic_swsd@realtek.com>
References: <20261110032416.16968-1-nic_swsd@realtek.com>
 <20261110032416.16968-6-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:25:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] r8152: uninitialized stack memory read via
  read_poll_timeout() in wait_autoload_done()
--

commit 0223d579ae41de9da02eeed7c11b0b17d1632cc5
Author: Chih Kai Hsu <hsu.chih.kai@realtek.com>

r8152: split r8156_init by generation and factor out wait_autoload_done

This commit splits r8156_init() into r8156_init() and r8157_init() by chip
generation and factors the PLA_BOOT_CTRL polling loops into a shared
wait_autoload_done() helper using read_poll_timeout().

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 6f55aed4709e1..364a0573f6cd1 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -4177,6 +4177,23 @@ static u16 r8153_phy_status(struct r8152 *tp, u16 =
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
> +
> +	if (ret)
> +		dev_err(&tp->intf->dev, "autoload done timeout\n");
> +
> +	return test_bit(RTL8152_INACCESSIBLE, &tp->flags) ? -ENODEV : 0;
> +}

[Severity: Medium]
As reported by Jakub Kicinski on v7 [1], does read_poll_timeout() cause
ocp_read_word() to read and return uninitialized stack memory when
RTL8152_INACCESSIBLE is set?

read_poll_timeout() runs ocp_read_word() before evaluating the stop
condition test_bit(RTL8152_INACCESSIBLE, &tp->flags).  When
RTL8152_INACCESSIBLE is set (for instance if a USB transfer fails during the
polling sleep, or in r8153b_ups_en() when the preceding ocp_read_word()
fails and returns 0xffff), generic_ocp_read() returns -ENODEV immediately
without initializing tmp, which ocp_read_word() then converts and returns by
value:

drivers/net/usb/r8152.c:ocp_read_word() {
	...
	generic_ocp_read(tp, index, sizeof(tmp), &tmp, type | byen);

	data =3D __le32_to_cpu(tmp);
	data >>=3D (shift * 8);
	data &=3D 0xffff;

	return (u16)data;
}

Returning an uninitialized value triggers a KMSAN uninit-value report, and
if generic_ocp_read() instead fails with -ENOMEM in get_registers() without
setting RTL8152_INACCESSIBLE, wait_autoload_done() also branches on the
uninitialized ocp_data.

[1] https://lore.kernel.org/r/20261021005210.1254886-1-kuba@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110032416.1696=
8-1-nic_swsd@realtek.com?part=3D5
