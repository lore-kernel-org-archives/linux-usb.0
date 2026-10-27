Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112494;
	b=kn/0lATfoi+AR0bxYLtWJ0sDGfJ8U/D+GRYooaFkWI8bb9FD7guhrI0CIS3yfYFtLTOy
	 kXblBmu/yx4hcD9xszeSWuTXuWUFf2sVUm51NhV2+TqIun5woe8i4/YriGQKpxog6VLAo
	 P6sf/QidTY/RhQrqsbS3o/iYyagJhNRsjRvEtbDOgv3SCfm38GAQABeXzHuOUwZwqSB8G
	 oJlqeoVxwAUlGis5wH86I741oPViLqo+cKXdgDOXiYElLGKwfccRYgvpYg0PxndEAtX5u
	 bD83XcDJupH/ACtajNfiOkOjEs9MXTgQaEnw7vWT42mvIZ/Fraxb3/hlMComxbBlMRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112494;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+K2PYs/RmRv1ObdzuXi47ipk86amzHHt6o3xGdZ843E=;
	b=Lyiefxs4Kudl3b7Hs+eZtzyyjxd8isrywoBx8imPcqiBqukP9ps9j5Y1CROOinhdAeHg
	 4hg2u2Uyu7EoY/8/MevCecG8iVC9+PWjzSe+cOE4mHAvvhWMYELEo5xMTLisLm+0KpJt1
	 ZTp4+zPqVaxMdZTZqVyFf3yojVtgfDFVJBUYsccL26THsisLedH3oJM27eDb7sDqTf+wC
	 MjMSIUxklteFWh2jX6v9pblY9DjIUE+8tGAFOixlgecFosjteAZkju0341N4Lls+oGPcV
	 dPrqXFc8NwkPfddDoSGOdOHGOncTD28RoVnOFgHpjZm0e/1n6WufoR90RiARTTk29nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l93j6viD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292F7606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l93j6viD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870781F01825;
	Tue, 27 Oct 2026 14:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793112493;
	bh=+K2PYs/RmRv1ObdzuXi47ipk86amzHHt6o3xGdZ843E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l93j6viDRcVrt6sIZj4yMxv+U8xdVcZbSbMmrla8xsu9BsPzAJO3YSxA+vaPYiG8T
	 6LogbaSQBWsShYhz6wl8V2Hcb0tHh+s+lJNbFQ6T8qz3O6ZzW9QBQBj8ietXwhJikK
	 M8qvZ1YanBB1S1e34if87YV8ibviYBVLVW1foxawXvEC7EQkuINWy/DxmKpMWCpMm0
	 JY+c1OZdWf1nqtkhhVuqOxYz/kEMZcHht9KltIcWKnX1F8GOkLU2O/g1gewi3L0nrk
	 8GQd+HzhyL3Y0KFxkzWt5GFsLNnSu1yXhPWo8rxaSN5OmcAI6o/UKVJjl1IijnlPRa
	 QzKZ3ndVGVN4A==
Message-ID: <sashiko-outbox-186760@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: oti6858: fix the teardown order in close
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <2026102725-congenial-profound-99ee@gregkh>
References: <2026102725-congenial-profound-99ee@gregkh>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 14:48:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> The driver passes a baton around: the completion handler of the
> interrupt urb either resubmits the urb, submits the read urb or
> schedules one of the two delayed works, and the works and the bulk
> completion handlers submit the interrupt urb again.
>=20
> oti6858_close() cancels the works first and kills the urbs afterwards.
> An interrupt urb that completes in between schedules a work again:
>=20
> 	oti6858_close()
> 	  cancel_delayed_work_sync(setup)
> 	  cancel_delayed_work_sync(write)
> 				oti6858_read_int_callback()
> 				  schedule_delayed_work(setup)
> [ ... ]
> Fixes: 49cdee0ed0fc ("USB: oti6858 usb-serial driver (in Nokia CA-42 cabl=
e)")
> Cc: stable <stable@kernel.org>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026102725-congenia=
l-profound-99ee@gregkh?part=3D1

