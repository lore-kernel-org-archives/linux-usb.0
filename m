Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B354146D56B
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540771; cv=none; b=T4WYGD4F0ablqiPpjyON2vGP7WYZOM00lQ9lgOBWoyG/IaqiKNuv2sDQaN0sUgW9Td97St4DvspI0L+GzQ3NBOm9qhEihUUgJId0FSePYDfWbjypfVCSeh38sWsFOUJe9J+24nHmT/qgjVDZ4U69CDSfsMg3RlsGhdtfv/rdpac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540771; c=relaxed/simple;
	bh=OQPsWN6LP2zaXuob7nV5M+uBwu9jUv7ehNDrjthnCKE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=D8WlMisk62zkefW68dgVHJG6LXmuZe0jmuFwyCqMJWBLB6Y7sHsUMdezOa9sx7KR23BguUZbUZsZRG2YAFnKdvWYx9WM6D9mQTPcDtvFD/14N3Iu/d4hyeUI4b3PpazzOY6s+0K3S+g+eHn2QRufs1DkKmrGX0V2WdI9Uk6cWyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2Tm1M8W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2Tm1M8W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EC81F000FF;
	Fri,  9 Oct 2026 10:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540770;
	bh=OQPsWN6LP2zaXuob7nV5M+uBwu9jUv7ehNDrjthnCKE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L2Tm1M8W7yRNko6mJP7qF6/0VvYufeM2WkKRQByoy61UpfB/IvUcos0FS7o5gCelm
	 SGbExoJgeK29csdTDCWtIrvFqfBOP+UiZkYIh2RsSay8WDL2x9mzKh4bkhqQ30S3qr
	 8S887udNGBDEMfZUge+5ug/pgLmdDoNXluDi9bh1cMdRdXIab2DFIZJd5VRqiFeV7z
	 6y1rjrUnmGGdp7/1tpqH7Xzkvba9ISmqOUJYyy9izkAgALLbf6/UUvHroKt+NlBevJ
	 kx4Ws0v5o4cr3KQMOZCueQrlxoP/dhM6CpOP7pHNzFS+obqlZjjSnU63Y/VI7jRj/Y
	 G8ZR8vP/6PKiA==
Message-ID: <sashiko-outbox-165206@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/14] xhci: Prevent invalid vdev dereference during
 sideband unregister
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-15-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-15-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:12:49 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Offloaded USB audio devices using the xhci-sideband API store a pointer to
> the xhci virtual device (vdev) in the sideband structure when registering.
>=20
> This pointer typically remains valid throughout the lifetime of the USB
> device. If a configured offloaded device requires a reset, the USB core
> usually unbinds or notifies the audio driver beforehand, ensuring that the
> sideband is unregistered before the vdev is freed.
>=20
> An exception occurs when the USB core resets a device to recover from a
> failed resume, but a subsequent 'address device' request also fails. To
> recover in this specific scenario, the xHCI driver disables and re-enables
> the slot, which frees and re-allocates the vdev.
>=20
> xhci_sideband_unregister() later dereferences the stale, previously freed
> vdev pointer during disconnect, triggering a kernel oops:
> [ ... ]
> Closes: https://lore.kernel.org/linux-usb/TYUPR06MB6217000B59003EDF233D72=
46D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com/
> Tested-by: Lianqin Hu <hulianqin@vivo.com>
> Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secon=
dary interrupter entity")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D14

