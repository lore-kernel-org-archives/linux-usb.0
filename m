Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2EF372661
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 12:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154355; cv=none; b=Aw9qjstnPx4/JCrjHB5F9PYiQJsSdhL4ZBG1MZmV+EsnwUljDISJQlTSuxX1BsOeLZG3o1ThqkzOE9+ZHJBGkBryaEBzm0sqZpHWbvnXk4o9KgE4c3A9mh/wspkiQ4wVgqfsk7SgJmwOCamiUWAEt17rxwrJOQx+ZzsuEUsVUAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154355; c=relaxed/simple;
	bh=4O4e02hVt4rsNOjeuiKLzGy5dFBhN/TJQdKuwCjsHGQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nKJO1zzaJyFMJw4pmTrmPoARg7kCfmvVgwCmadZOTeCZG/tHJ2mOEQ9+8aeUoDwrxU4gMJdl0aoDSc5OA4xD4WHLZZauQD/C0NjWA2D3m1kLu/od6/RusknhKQO39Xi+rAXlvnwdkfD9dvPLOICf52JWifdbT841CrqJSg5caTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgqzPsyk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgqzPsyk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5501F000C4;
	Fri, 16 Oct 2026 12:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792154353;
	bh=4O4e02hVt4rsNOjeuiKLzGy5dFBhN/TJQdKuwCjsHGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZgqzPsykJHfHHDNA0JBlRk2IZjudOHp4wb+YO8Ul0WW0R8USBjUOSRfd9fjlDZg96
	 TdN0nmG2b1pSiwoVYxeoHPI7v9R4vlS8HwEVan5auv9zlCV0/i3wGEq0EyKZcIRGfA
	 rjmSBqa944IWglYG/rutVv5fiNyuQoRINI49IP1/JRxCnI25b9eKCZ/hHqCuWr/pXO
	 /4PRQQKNMs1sIJqphITM6G05KMTrE0SxR1OiqpWSPUvGH+UAf3CeCCfXn7+7jkE9OJ
	 mo7FI4njLf9F8L7MwKiHXk0Iuq/4qJMd6KrSlm3kEpnDEOZ/+8t844NtefAiWnDmCq
	 8TSpxl+BPZtUg==
Message-ID: <sashiko-outbox-174305@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2] net: usb: aqc111: fix set_mac_address return
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hanson Wang" <hanson.wang@ugreen.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016122944.1889622-1-hanson.wang@ugreen.com>
References: <20260703073936.462231-1-hanson.wang@ugreen.com>
 <20261016122944.1889622-1-hanson.wang@ugreen.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 12:39:13 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016122944.1889=
622-1-hanson.wang@ugreen.com?part=3D1

