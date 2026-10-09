Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14F83806C1
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533840; cv=none; b=LJqgGo+zwr4Yopl7CT+bV4pR1bytOv0264DJHQ9ieAPvc442yeS1RIylaTmi0kUk68QLStPlk4tIZA7Wo7uVCvGuKy1/Zr0EJptXBUj3B/acFnoFQbnKKqmuRukMiw5t+/8cooC9t6fPhfigM9IOfJsKPNXcePSERIZZYhmGtpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533840; c=relaxed/simple;
	bh=9Qou2WTEJai/4BAThjf0uMHsYJfoS2o/HRVy6nSVXpQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=B7cSfTfKTvhAoisOfM03WEitCT90KIfbiUieDi00VeZYrv6XlrR5hHb7p6hQJbSrL7e2J+rUq/Eu5va4WMR3z5Huf1/rURuRZ9sNazH2kVxBjRzXm0ky+tHGeg72Neup+oInaGMk+JaE0c2BSXYIvacWm4cP83+S1BQnlyFCHqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKQ/pH/O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKQ/pH/O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A1D1F00893;
	Fri,  9 Oct 2026 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791533839;
	bh=bLVwkLwJufVkXKgdkqrs6WELEo61vRBmTv0HhC9fBQU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OKQ/pH/OEyu5UzAbIYPsE6nDCuY57jfSDO7exH75t0Sm4eD5d1xGyn1KKbRhS5bhZ
	 ZHXSyk6njYdSpdzHhEkiKlZzJ7QNEKRr29OwPKnAnsnaOnBbdJXQJqLgcHc1z7nsnk
	 gaT9imcFrliWgsLq4XwFwtGSx3kH0Ilx6rZR3BwPVyJZp0bbYvYuYBszuvU756EgOX
	 1v9SaC1ulIw3W7usWNWcYY3Yq5IWEqo7JjYXZggcs/56MAYhRAJkowxsgRGQKQRiQD
	 qNWk17DWY51FWE1pQ6dJIWpPzzRPvYSWzBohdN3eaEEqW6zQh6gTdzoL94hUz4OGvM
	 +84HcOtBPvemA==
Message-ID: <sashiko-outbox-165062@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 01/10] r8152: split r8156_init per chip and
 factor out wait_autoload_done
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008081556.47901-2-nic_swsd@realtek.com>
References: <20261008081556.47901-1-nic_swsd@realtek.com>
 <20261008081556.47901-2-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:17:19 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> RTL8156, RTL8156B, RTL8157 and RTL8159 shared a single r8156_init(),
> gated by a dense set of tp->version range checks. That made the init
> sequence hard to follow.
>=20
> Split r8156_init() into one function per chip family:
> - r8156_init  (VER_10/11)
> - r8156b_init (VER_12/13/15)
> - r8157_init  (VER_16)
> - r8159_init  (VER_17)
>=20
> Also factor the repeated "poll PLA_BOOT_CTRL for AUTOLOAD_DONE" loop
> into wait_autoload_done(), reusing read_poll_timeout() instead of the
> 500 * msleep(20) busy loops. r8152b_init(), r8153_init(),
> r8153b_init(), r8153c_init(), r8153b_ups_en() and r8153c_ups_en() are
> converted to use it too.
>=20
> wait_autoload_done() only reports failure (nonzero) when
> RTL8152_INACCESSIBLE is set; a plain AUTOLOAD_DONE timeout is logged
> but otherwise treated as success, same as every one of the loops it
> replaces, which only bailed out early on RTL8152_INACCESSIBLE and
> otherwise fell through to the rest of the init sequence. The two
> failure modes are not equivalent: once RTL8152_INACCESSIBLE is set,
> generic_ocp_read()/generic_ocp_write() short-circuit to -ENODEV
> without touching the device, so returning early costs nothing. A plain
> timeout means the device is still reachable, so skipping the rest of
> the bring-up would leave real hardware state half-configured.
>=20
> No functional change intended.
>=20
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008081556.4790=
1-1-nic_swsd@realtek.com?part=3D1

