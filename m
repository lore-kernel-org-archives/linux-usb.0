Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83573B42CC
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980384; cv=none; b=TGAYbG5/t/jrLMtkvNg0t/B/g0irgNQQg/GYHsytCzScB5jz1wjOd49z+utvk4Xkxn4aSYEj2jZp7aGLWNxY0Lo0lT03IepAEV0CSrPTTvzZ19W0moxQh3MSKJLEZfK+6l9l6mesMTvKjeYZ1+Ki/VrD+lyIWUQdx1NPeN0SHUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980384; c=relaxed/simple;
	bh=FWw/SfUEYX4Z2RJvhP0hYaTnk39N2Eih1H/M/RyjWRM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WFbnXWtarbmy5WmiYx0RmKsKuRPVmXLU4I8wgfQKoDc0fZfo3Y1MpZxfxQ/XZpJepEySWhDTazygH1ta2cFtO5dASj2h68CDhW5XdPgLHaZnz974MlBtgOQEzagfDSFOdeA3jbFI8bmTjc14g1UPMsxnpATGqUWcWLd8pQ0yJGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXJkkKQw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXJkkKQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CB51F000FF;
	Wed, 14 Oct 2026 12:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791980383;
	bh=8WGtOf88NW1g6RgViqSknqrMDTwpGhAb0pkOnMqqK18=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HXJkkKQw1R4G76E1nx8WACKMyPDQ26W5VsIgKqPnImBgSdpRT7Nw3vOVvXlNoiVgs
	 Mv3pCXsg+2GdgLmRtjh9kPK+iXiw2rECbMfNt1CCh2xHSOmPdrNubJGrTJjjdshgs+
	 leehjZJ9tNb5HOsMiZ6mRjDW7qZcaUMfPo5bi/J2jOztpn+JkHFQighba+7t3+IxE7
	 nVQwJ+UhkVuBLw+LQkNlfHcm6BnS1/wCmF//lkeXl8qW80dWi3pSk9D6GWCUOyHlel
	 TRBYoH9o1HX2UA3rtCqJeI3wLgVwTcXaAe48S2WJZArVQXcvt6SZ7AKDf+shK+jmEk
	 9vOr/IUyP++cQ==
Message-ID: <sashiko-outbox-171265@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_phonet: don't free the net_device on
 failed registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicholas Velten" <nicholasfvelten@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014-fix-phonet-free-on-failure-v1-1-3c93c48e7527@gmail.com>
References: <20261014-fix-phonet-free-on-failure-v1-1-3c93c48e7527@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:19:42 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Nicholas Velten <nicholasfvelten@gmail.com>
>=20
> gphonet_register_netdev() frees the net_device when register_netdev()
> fails. That made sense when the device was registered once at module
> load, but since the conversion to the function interface the device is
> allocated in phonet_alloc_inst(), stored in phonet_opts->net and
> registered from pn_bind(), which only sets phonet_opts->bound on
> success. After a failed registration opts->net therefore points to
> freed memory, and the next bind writes to it in gphonet_set_gadget():
>=20
>   BUG: KASAN: slab-use-after-free in pn_bind+0x49a/0x500
>   Write of size 8 at addr ffff888003e785d8 by task gadget_rereg/86
>   Call Trace:
>    pn_bind
>    usb_add_function
> [ ... ]
> Fixes: fcbdf12ebef7 ("usb: gadget: f_phonet: convert to new function inte=
rface with backward compatibility")
> Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D098999e05b6b877c01b3
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Nicholas Velten <nicholasfvelten@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-fix-phonet=
-free-on-failure-v1-1-3c93c48e7527@gmail.com?part=3D1

