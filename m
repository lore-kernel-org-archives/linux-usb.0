Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A6B31BCAE
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533840; cv=none; b=PSkq2bbSnLZBqXSf5a7IHpGVjr8Bv4CYoEmDM6rLV+5h1T6WqjKgy+6p6bkVXtB1wRXPY0bYqew0lfRqyZDJX4La5BM8BHwddtsLupTIltyJo80XmbuyLz69g6Guft9ilUlguCRDWCyCO6j12xIYPtSuVYVY+N190x0e97m1AoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533840; c=relaxed/simple;
	bh=6wgWE2BkcxaHtc/A69uTVoqrl4PrvEO/nsURf8x/Q24=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JXsInWanEU4izhlWVuspWeQOrFaZ2Lu0Wf9MbUHE22tnLJEcKL4CnnrzMnNWHEHAAdRRPRXEDoUN8lbymGkqKrmDr7K676k9U3cd5YWqhYgjENyN12/1FvPVZ9bMyAB+aqnWjEtPVfC3/CosgEbx8SnZxm8sVJRqyLu5m1MY15Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lifjwEm9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lifjwEm9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D965B1F000FF;
	Fri,  9 Oct 2026 08:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791533839;
	bh=DxITaySOHWIl6Rlz3ODOcF5hpiY2d1v6+D6Cqjygxqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lifjwEm9DfeiAYqNz4lYT32w9dfAKOqeUoC7iPpLe7BdgmUbSGIA9eyjZTl5RlvPv
	 Xn5GYJbYLWJtOXw1+8W5kXgg0JFPT0j5n8KaUDik+jI/tniCA6451kZw00q34IdS+e
	 IKMJlyRnbp4oUmgdIHkOGYNDahgSrHan3ahRkAt3FYG4uyihM1jJqj33rGKe+G0wJG
	 RoNIE8Sr2D7ayd0EFhi9N53/YWJ7pH0hfvH9+LYwOWyvIzuQvyV+Ipfg7SsPS9JrUI
	 ZlAN36rvo6yg8yqIb08hocxiQnaAgMncIaqnRKrkzdqMj6jINIG5WDUBl2kKDT49nH
	 HXD01XIAN+o3A==
Message-ID: <sashiko-outbox-165061@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 02/10] r8152: add new init writes for
 RTL8156B/8157/8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008081556.47901-3-nic_swsd@realtek.com>
References: <20261008081556.47901-1-nic_swsd@realtek.com>
 <20261008081556.47901-3-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:17:18 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Bring the per-chip init functions in line with the vendor init
> sequence by adding writes the shared r8156_init() never performed.
>=20
> - Clear PREBOOT_OPTION and RMT_WAKE_EN in all four init functions.
>=20
> - Add r8156b_u2phy_backup() for RTL8156B.
>=20
> - Clear AUTO_SPEEDUP in r8157_init() and r8159_init().
>=20
> - Disable interrupt mitigation (0xcf04) in r8157_init() and
>   r8159_init().
>=20
> - Clear the Warm RST / Bus RST event flag (0xcd06 BIT(11)) in
>   r8157_init() and r8159_init().
>=20
> - Clear the FW u1u2 patch option (0xb9a6 BIT(0)) and enable the u3phy
>   patch backup (0xb9a2) in r8159_init() only.
>=20
> - Clear RX_END_TRANSFER_EN (0xd406 BIT(11)) in r8157_init().
>   While it is set, incoming packets are buffered in the RX FIFO and
>   Bulk-in transfers are suspended. The bit is zero by default and
>   isn't used now. Clear it unconditionally for safety.
>=20
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008081556.4790=
1-1-nic_swsd@realtek.com?part=3D2

