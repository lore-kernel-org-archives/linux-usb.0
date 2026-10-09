Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949554F4D14
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570537; cv=none; b=qO1JlUY9bp3kxcMWE+fdVBOatNhE+EO65/CNlLI8jInQMg3HgCGSF1uCdMCQxu/6a4Mg+DF/56RwKCT0FX+LgM35SR4sIPd0lvLVFesHSNtMLNu2xAg13khZGaLdTNeLahmi+Avo5CFHL1NYWkTIm+NjilskpCmnM3Dn92eJ3RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570537; c=relaxed/simple;
	bh=8ABuPA2A0pBhwpHQ7+FiGwsQwJn/xLQ6yDEqOhjPXJI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KOIc2pnBsQFM0BJxHPBdj5dX2VyKERyz4ql/2z91eavTyZ0nhQRAuF5/MAg49gOdKa75P5WSfnLY+dc8hGOlCE92p0wD0qkTImKcZvy40w7ehx3qsi2D2d/3BXhVUwQKJtAGTpSpWhtlSqnyE7v7mnugY3/256jnHo0Cyw5gMAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdTxbY2c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdTxbY2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011A21F008A0;
	Fri,  9 Oct 2026 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791570535;
	bh=D2hxWBdJDLeIcAu6bVsTwfpuhpuJ7O01togEajKrH3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OdTxbY2c9sEwfbjKm3u73bJYXk6Y3YrnoUHnlKsHheEsPpr3Nc+UQSasMMFD6zQY9
	 Yzaf7HwsQ6Vf6ptjbiR2lGFDP+4376CU87xE+hjlNk8Xm4aESuMUoH4etXYzSy9fmm
	 v9mEWp/ycyEuNbQcXRTir+vUrBFXY/1YKygSEi/P/O5Fom22RNKHO10s9Cut1/bAI3
	 eFAd/g9vMkkC6m/6vDEip4YSFEHYu9N5HPYrfMLS0lkUDcGba8zY3dlKLSzyZMXoCv
	 1hO+w0d5c2XGaIMP3y9Y8gR3FwEEyCC7+SOOqEsB6OdJXRy/TQH15z2zl9cy0Roz1x
	 Uke0QtMkyOlrA==
Message-ID: <sashiko-outbox-165946@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] driver core: complete deferred binds when
 drivers_autoprobe is off
Reply-To: sashiko-reviews@lists.linux.dev
To: mosafer <mohsafer@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009182239.283329-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
References: <DM06HWVAFSOW.2F050J0BT27TK@kernel.org>
 <20261009182239.283329-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 18:28:54 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Mohammad Mosafer <mohsafer@gmail.com>
>=20
> device_add() registers a device and then runs the bus's initial probe
> via bus_probe_device() -> device_initial_probe().  With
> drivers_autoprobe disabled for the bus, device_initial_probe() skipped
> __device_attach() entirely.
>=20
> That is correct for automatic *matching* against the bus's driver list,
> but __device_attach() also doubles as "complete a bind that a driver
> already initiated": when dev->driver has been pre-assigned outside the
> normal match/probe path, it finishes the bind by calling
> device_bind_driver() under the device lock, bypassing probe().
>=20
> With autoprobe off, that second duty was skipped too.  USB depends on
> it: usb_driver_claim_interface() pre-sets dev->driver on an interface
> [ ... ]
> Reported-by: syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D863936f50214e843ae0c
> Fixes: b8c5cec23d5c ("Driver core: udev triggered device-<>driver binding=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009182239.2833=
29-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us?part=3D1

