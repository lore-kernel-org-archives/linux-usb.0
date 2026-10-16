Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF873479885
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155574; cv=none; b=ZT81UwHMSenQuzQvEnAH5RwSi5qVJliCKBqbMBe+58ucB29zpSBlm5dHt4Y52X77JuzNhyCAcsAdNZI0CkBpYeQtNK5ZHTTxRbmE3WuyXr+YwZxoZlAMRc8/7OqvATdm9ajYLU04rIN763q05GylTy6tu3eGdv7mP4x8udVv3SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155574; c=relaxed/simple;
	bh=6R2XOX9liDg/Xu3aq4JW5EOvBIgANkjOIG4wNPSeN1k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sDMtMYS3JdGCC1NvPD3Znl8vxeU4a39TZIoz7/tj6IqJzrD8NFtb2ZiJUGtXKCgyWCJjH0EHOw34Vl/IWvfvgygYHoHRVe+2j4zpuOab6WiOM9rwkOPSHqfjxnBUeIAd5MdrMzBqgwbhxHx09VmGw034p6efKlrXFVe4vfr1I3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F72vqM7B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F72vqM7B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD381F000C4;
	Fri, 16 Oct 2026 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792155572;
	bh=6R2XOX9liDg/Xu3aq4JW5EOvBIgANkjOIG4wNPSeN1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F72vqM7BFi2PvB5zvDAQSfouAmvWt8exiHscYelBnEi94mBes0eXH4t+OeFbVt6TQ
	 7zvjXA8/ose71e/VdnbGukJtFw35n10wa9ERZKxNL+Pp40rZFIiRKyGG+8UVikokvS
	 LH0gq/DTPSbSlsSyTvtMSs8E0dtJ4OUsjZA3iM4+w9vPlS442CXlo/ZRP8dQvtf86i
	 pokfMEnlLOr6yyYyFn3kQECpgXXvy3ZaOgMrrNK7wFJgBJtbs6RDxZdN9ri3AXpGRe
	 zPjuBiKDHuYVcricvTjw1x4OCcdaSJeD22w9YpoD91wLX7yUoQ2Zn7v2fzeHX83/TB
	 Z4U+pFB+auY4A==
Message-ID: <sashiko-outbox-174353@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2] net: usb: aqc111: fix set_mac_address return
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hanson Wang" <hanson.wang@ugreen.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016124858.1939743-1-hanson.wang@ugreen.com>
References: <20260703073936.462231-1-hanson.wang@ugreen.com>
 <20261016124858.1939743-1-hanson.wang@ugreen.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 12:59:32 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> aqc111_set_mac_addr() returns the result of aqc111_write_cmd() on
> success. That function wraps usb_control_msg(), which returns the
> number of bytes transferred (6 for ETH_ALEN) rather than zero.
>=20
> Callers such as netif_set_mac_address() and bonding treat any
> non-zero return value as failure when setting the MAC address.
>=20
> Return 0 on success and propagate negative error codes on failure.
>=20
> Link: https://lore.kernel.org/netdev/20260703073936.462231-1-hanson.wang@=
ugreen.com
>=20
> Signed-off-by: Hanson Wang <hanson.wang@ugreen.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016124858.1939=
743-1-hanson.wang@ugreen.com?part=3D1

