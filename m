Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A18A4D1F99
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421081; cv=none; b=jhWlSHYzYGsDrh/3q5iSu6jhgOcSO6or+MsSonZ4DTsXefVPf3H0C1HaOOp3oM9L3bYsqytAtj6SqnTR2Gr34Y3KaAal8HAYulI+moHnwuhFGYsUbaNNdlHGnBduicC0/FZwzvlJArWkeWMPRdoKPVdq/iNcrp39z5Gyor89mkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421081; c=relaxed/simple;
	bh=pijBuD2zJo0xQOALvKjpWbRpjk1aYQkKOcQoWb8z50w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mh0J6e2EPx2U4zcVDTsmoZK8f+7ST8Y4WEKnp6tslMFlFQJKgxbAyX4Op+l+BF2qaEE+kWgDcpt29doeNIg2C9+tgHH9nbL5N0V29y4RtFYAvnTSogDARAItLeUjnGDbE1phCVZTZHpg7YQBB7eQ5URgqcmuMfD6wY6qngtpdPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBp405KZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBp405KZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2151F000C4;
	Mon, 19 Oct 2026 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792421079;
	bh=nGdcihZkfLMOrWjEtNCRl9Jocs4WMVcRbm70KRJVzNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iBp405KZv3tx1r2CGUXt2l9h7Y3TMBRKxLgUEazWoLIkHRzLsv23aKS+dWz0zIthP
	 qrTkgG9sPr0YCVG+leRRoUysIZklBIH8y/0oYSwXGKKgkKB5XdDGNPvmPJHmF5Mtan
	 4ehGMPj3Aq0pxFZgcNRdaGspmlXZ2RbI4ZFPS9aJjL/YKoEtvuHwE2Cvvtf+rzj39R
	 p16CI+WG0H9UoBphs0mcHS274t2xrbD8mf88FDg1+1aUoWEW0hhc6RwT3aq++QNYeL
	 Qm75/6PVfJsP3HJusqQPw42jR/BAodpuONv24l6sJ6gm7l90uEysbdXlgo34DEbOhu
	 mfgbw6vaf0tbg==
Message-ID: <sashiko-outbox-177486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.15] net: usb: cdc_ether: add quirk for
 AMI BMC stale link events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-248-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-248-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:44:39 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Jinhui Guo <guojinhui.liam@bytedance.com>
>=20
> [ Upstream commit 089ca284afb0f3b2870a5ce41524cbc91ed350d4 ]
>=20
> On AMD Genoa/Turin platforms the BMC-provided USB-Ethernet gadget
> (American Megatrends, VID 0x046b PID 0xffb0) intermittently fails to
> respond to ARP after AC cold boot.  usbmon captures a stale
> NETWORK_CONNECTION(off) immediately followed by
> NETWORK_CONNECTION(on) on the interrupt endpoint (~130us apart)
> after enumeration.  Because alloc_netdev() leaves
> __LINK_STATE_NOCARRIER cleared, netif_carrier_ok() returns true
> when the spurious OFF arrives, so usbnet_cdc_status() cannot
> recognise it as redundant and schedules EVENT_LINK_CHANGE.
> __handle_link_change() then calls unlink_urbs(), killing ~60 rx
> URBs whose payload has already been DMA'd into memory =E2=80=94 xHCI trace
> [ ... ]
>=20
> Signed-off-by: Jinhui Guo <guojinhui.liam@bytedance.com>
> Link: https://patch.msgid.link/20260730051341.24930-1-guojinhui.liam@byte=
dance.com
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-248-sashal@kernel.org?part=3D1

