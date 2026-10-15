Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A176472F75
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052442; cv=none; b=A0gSWPL5SiuCD9bb6CPfb21WTnUBL6dFBc5OnLBNqyRIktfJ1mqsgyCebcdTARbefGT9vAPq0vTQeqewvzlXAGFCYcfJ44yrtUn7yeYpVmN/nTGJ45frOHyA7+ZGAtqtScUjITpLuQ8QVYfVD8CUFkYZ49uOM074ixU2RLZB3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052442; c=relaxed/simple;
	bh=vmMBw528hyLDfZ0DUV/EdCReiTh5i3sMU1tH/lC8HRI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gPk/unkzjA4xbzkf0sUhHvdHnvphb5ZrYQjft0KrMc8TF1kQKNK1M4d3tfwgTRZvXmJP+6Rxw8xr/Z2mTxK/H8vlO8yhumi0m97jmLhhE2yk0v4v1W8K/RUh+TxKHu1wfNTxkL7dYQvHWDRxmsJ257mkn1Tp5GutAAHZWt3m33Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jn1h/9gj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jn1h/9gj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3811F1F000CD;
	Thu, 15 Oct 2026 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052440;
	bh=a2qSMP9/fA33hrayqqFIuBD/zrsLsSkw/UB0ZI6OVb8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jn1h/9gj2yDvi6Zyt+b+kcyai+3rXjzb7NyiUOwzj/ptzUlHv6wmS4IkQaiR3HZgP
	 tfk7o5tnOJxLCVhybcgyndM18wfcVXLm5n87bAkboKvIICzZXG892dP/VMyi9evBou
	 gxU693QFnmAJ7dX99SmuzVX9ZlnWrt9N6yP5gsaeolEvOp57kQR/V5Y9DeJkte2v+s
	 MnKElSmtmL5HEtWBTamrNK1Vd0w8V+U77bG96BrBLyw+u0H/XEhjIWOeeniTXaG4PZ
	 7Tc2mjvNGzJTpyQtDmCVDTvPnPay2mVhDBX1YUloOVt7+XroMq6/hzTsRMJbdtlQzk
	 +3Px7gm0Um2UQ==
Message-ID: <sashiko-outbox-172471@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 09/10] r8152: extract rtl_fc_pause_pkt_en()
 and apply it to RTL8156/8157/8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014081904.6491-10-nic_swsd@realtek.com>
References: <20261014081904.6491-1-nic_swsd@realtek.com>
 <20261014081904.6491-10-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:20:39 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The flow-control configuration keeps the device from sending pause
> frames without limit. Only RTL8156B (VER_12/13/15) got the full
> sequence from r8156_init(). RTL8156A (VER_10/11) toggled
> FC_PATCH_TASK in rtl8156_enable() without the FC timer and
> FLOW_CTRL_PATCH_OPT setup that has to precede it, and RTL8157/RTL8159
> (VER_16/17) got no flow-control configuration at all, so they could
> keep sending pause frames indefinitely.
>=20
> Collect the per-family sequence into rtl_fc_pause_pkt_en() and call
> it for all of them.
>=20
> - VER_10/11: the FC timer + FLOW_CTRL_PATCH_OPT sequence that
>   RTL8153B (VER_09) already runs from its pre_fw/post_fw hooks,
>   applied directly instead.
>=20
> [ ... ]
>=20
> Fixes: 195aae321c82 ("r8152: support new chips")
> Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
> Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014081904.6491=
-1-nic_swsd@realtek.com?part=3D9

