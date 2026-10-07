Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C4E4AC141
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379461; cv=none; b=NBwAomSCt87jgtmqcMbZCtjMiPAhFe1wJ4jSEgBdlYpyE625jSlSfglpXKUFNekiA7rp6V01/mkRiHQ1whcb31iX+U6BUHxjV55VSb1ccLOmZ/GwVD8EsChgrr+cPPVSyDABeCG2h5XMfV+CXPWW1L9+IYw6HGuhcSrquZGbWcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379461; c=relaxed/simple;
	bh=wg/Flxhn1bT+E+ELWyaIAqV6mAUNyB5rmYDkBkXjp+g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=IAH180S2o43/k8qJckTR8tT9tacedH5RH5eZkyiW/A2R/ewAqHN4QC3Q9tw0sTD9+IWHJwq9FBvX9YipVL2G5CSQed8X2eRytHUWpb00TwGPwZBjVOE0J9O0JOjfVdV97khrrqr5l53QX2IkB7/qVnrBG4LdZ1VYY+Xhvy7ZhSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFH6BA+e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFH6BA+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3911F1F0089B;
	Wed,  7 Oct 2026 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791379446;
	bh=gHdijBi4EeeR5DmKZyscAZZQiRYEHn00oQtCHp5EwnI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HFH6BA+e+2ZgN++XYk7sUnc0VhHb+skWSDa1LFZOr5pq2TAE2ATled+AOcSSRUx5r
	 X4jjs+zJ6/aFTTICm/I+IIp89oFVxbyJI/8bHfkHosiMbrvMayE8jzDjcOjU0Z6xJy
	 tOsdfZwhcSt81kinRuDTWLqmr9y4G7g2hfvRSTBVKtd0b5a6GYvqN19Ay0noYrTnXb
	 5bhG+fFGNeX1xFYSa4t8EYM5HEuip0FV8cWXfTRNi6Rq2fu4pL1rrM79AvNqPtEXjT
	 3zbN4RmkGPCUs0NLP23eLqPKjho7AeSAjU94HWnDbeqHNRAWUyJV11rx5pgRWd1Qie
	 c94p22wDlO6OA==
Message-ID: <sashiko-outbox-163039@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] driver core: Take parent lock in async device attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mario Peter" <mario.peter@leica-geosystems.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261007131514.1260696-1-mario.peter@leica-geosystems.com>
References: <20261007131514.1260696-1-mario.peter@leica-geosystems.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 13:24:05 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> On buses with need_parent_lock set (only USB), probe() must run with the
> parent device locked. A synchronous attach after device_add() gets this
> from the caller, e.g. usb_set_configuration() holds the udev lock while
> adding interfaces. __device_attach_async_helper() runs the probe from an
> async worker instead, where that lock isn't held, and only takes
> device_lock(dev).
>=20
> With async probing enabled for the hub driver (e.g. driver_async_probe=3D*
> or driver_async_probe=3Dhub), this races when a multi-TT hub is
> configured. For multi-TT hubs, hub_probe() calls
> usb_set_interface(hdev, 0, 1) to select the TT-per-port altsetting, and
> usb_set_interface() creates the endpoint devices of the interface a
> second time:
>=20
>   usb_set_configuration()           async worker
> [ ... ]
> gone in 300 boots on the board and in 6000 iterations in QEMU.
>=20
> Fixes: 765230b5f084 ("driver-core: add asynchronous probing support for d=
rivers")
> Assisted-by: LLM
> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007131514.1260=
696-1-mario.peter@leica-geosystems.com?part=3D1

