Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920620;
	b=EMPO9YCgjj7kjRXBpUHgtl/rXOFUp8qZMEAolOhCG6UtcPztQzpUA18zE78mhy6dnpio
	 IY038R1mgWNKI5AMLFOzFEIUntRY43hU4IhARyL2pgueo5PKBt+k5ZmOzTob4bwhyiII0
	 zPV4UBz6jeSa4hrAhMvxPjTJpiBarTpH7HUjR79cSu0nyL/x88oRn//C8TL2MWGF8s5kF
	 cTJwTpMNd9rip/AJNJ+ogN7QLYG6/og2d4NspuSI6C0Ah1RUe84J26y6gfO3LJwYVk9LR
	 CnQ+19NkgWVQD1neV0eBc/jA+BMLUNBQcss3gY45iECWX/cbwhgIsHhWbfvLyJnzesQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920620;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bCsy3GK0QMzFv+sntDGfOVwbn6oxoP1OkOqn9fUWQq4=;
	b=crXiTYl8VdaAJ5uW3anbZOv6+VMo5Ps/iIfE20zcn+E4zGNdZ0/PuRCxqEV+ZI3Fyuyh
	 SorFqvnlN/BSaWax91WTi5ubGW8rZIra2uNrXOMGrLkpwDYr+wrxaY3/+EFaTgure/8gM
	 B55Ck/n1g4a0D9ZjIYFjh5bxwDsIuZem3ssb06TJRvqMJ5j91WhgsphQStsl3RVatiFRG
	 iE7aMMMa1aLff9luQ8kNCS6QHA23FGpvftEFBj8SBwr7P93YhCQFlOD7ImjyJgKfWCpwo
	 clcvSlnzTBGQnpj7TSsXghRllbxaPdnQz1UBH1nNtLsY3hGmGh2Gogpbwn1yd4ehUkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qu7TA9jk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B73606A32C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qu7TA9jk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597261F000C4;
	Tue, 17 Nov 2026 13:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920619;
	bh=bCsy3GK0QMzFv+sntDGfOVwbn6oxoP1OkOqn9fUWQq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qu7TA9jks4uWhDIKLaT3i9LkBa3QLBDq6pLXtwBHGsU2CwkaCb3e3pce/9Jtn4AfH
	 0gcoHH3zJOorOrqs4AzZkdS+DO7jPt5cG4UChLVT+DLCBChuUFQlWcRY4+/y8tMZ2T
	 wp7pd8Xp8c0HyQcsWx4MT2U6YKreZy1UYysyrFW8mSDsfDjj6w4St5UzxnfpX3WTS0
	 47tCvA+NVezx+KerCQ/q7mes6CUpNAef0qBQRCYb67Xcnfovgytmf6w7/P7voj4ax3
	 sY/cDgn0H8YHTj4yTMJdV51VWScndAUQo2y0nOPAqg1+kMMx/J0ZETeoLOo6SSkm6b
	 rWMIktvKUTbMA==
Message-ID: <sashiko-outbox-218830@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] usb: gadget: udc: Clear a pending connection
 when starting the UDC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-udc-connect-v3-1-9413b491d213@flipper.net>
References: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
 <20261117-udc-connect-v3-1-9413b491d213@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:03:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if already
> connected"), usb_gadget_connect_locked() returns early when
> gadget->connected is set. A connection requested while the UDC is
> stopped sets that flag too, without enabling the pullup. A later
> gadget_bind_driver() or soft_connect "connect" then finds it set and
> never enables the pullup, so the host doesn't see the gadget until it is
> unbound and bound again.
>=20
> This happens whenever a UDC driver reports VBUS through
> usb_udc_vbus_handler() while no gadget driver is bound, e.g. when a
> Type-C port controller switches the controller to the device role at
> boot, seconds before userspace binds a configfs gadget.
>=20
> The pullup is never enabled while the UDC is stopped, so clear
> gadget->connected once it starts. The bind connects according to the
> VBUS state that the core tracks anyway, and a function that deactivates
> the gadget during bind still has the connection recorded for
> usb_gadget_activate().
>=20
> Fixes: 62911bc82b03 ("usb: gadget: udc: skip pullup() if already connecte=
d")
> Cc: stable@vger.kernel.org
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-udc-connec=
t-v3-0-9413b491d213@flipper.net?part=3D1

