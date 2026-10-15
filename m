Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6024825AD
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052443; cv=none; b=Fl/rUdjmZEeKGKw0EtwkLxVxzo7mk+VGpMJBhUsSCy1we5UXkxPeeEbNxGERFEmkrTENKSIDvmANDGzbGvN/ChxmUnmz59/KpHriVORFwwTK/ld/iB1j9fiTn3ZyDji199X+/G88eC8So0+GO/k5XDpa88mDnSrzGdziarrdx4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052443; c=relaxed/simple;
	bh=+QSweAKHZdU6MujwtiH3zECVB9u/7/dHyaqLRHfBqh0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Hfxz6KgccyP8q9ZVISdcfVuAWSa83qHlrj/ybnRAh+xbUAac2aegCdtX5a4czFP3xLXeNCVlDFKRIxzNLZeogBIod/a4K0bIzWLtWGv9C3DBSRmza9TocnsNWV/eXkLkE9wx9rimRLOVReni26uubn0vkDgGpZ9AihQ29lmHAY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvGzc2yY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvGzc2yY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FE11F000CC;
	Thu, 15 Oct 2026 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052439;
	bh=+QSweAKHZdU6MujwtiH3zECVB9u/7/dHyaqLRHfBqh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KvGzc2yYDhHR+niQB5vJr38U/taLgv/5cvBeEBkSS2v/yt4SrOms90zJQjz41iwuL
	 TI/3LwMHJxSDwlupWUzPUR9q6QHpXToUP6HN+6qc6ODy3DhI00hhSy/L3Lma0ryNd1
	 vI0YvU8h3W6j6wc3yDsThISNvWmgE4g7Z4T3aULlilwqS4j10ZBvd/44wR4d+OQjdl
	 0LfdZVGDJwBPLIOkHDYANb5tjL4BRUjlKODl1UMnRDBMYNCYLU2+1UuwopruLDPd6U
	 7WOs8FwgTAze53XUA8nHt5cB3ZMT2+2ZnuKHFcVj8kAGyX2E1w8pRu4Hrp97aoCS81
	 mZXgKdNzfzVLQ==
Message-ID: <sashiko-outbox-172470@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 07/10] r8152: add rtl8157_unload and
 rtl8157_change_mtu
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014081904.6491-8-nic_swsd@realtek.com>
References: <20261014081904.6491-1-nic_swsd@realtek.com>
 <20261014081904.6491-8-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:20:39 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> RTL8157 and RTL8159 used rtl8153_unload() and rtl8156_change_mtu(),
> which program power-cut and MTPS the way earlier chips require. Per
> the datasheet, RTL8157/RTL8159 need r8157_power_cut_en() (already
> used by r8157_init()) instead of r8153_power_cut_en(),
> and an MTPS scaled from the configured MTU (10K-16K, max_pkt_size /
> 64 capped at 0xff) instead of a fixed MTPS_JUMBO.
>=20
> Add rtl8157_unload(), used only by RTL8157/RTL8159: calls
> r8157_power_cut_en(tp, false), then the Interrupt Mitigation disable
> that rtl8153_unload() used to gate on "tp->version >=3D RTL_VER_16"
> unconditionally, since this function now only runs for those
> versions.
>=20
> Add rtl8157_change_mtu(), also RTL8157/RTL8159-only, and wire it up
> via ops->change_mtu in place of rtl8156_change_mtu().
>=20
> Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
> Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014081904.6491=
-1-nic_swsd@realtek.com?part=3D7

