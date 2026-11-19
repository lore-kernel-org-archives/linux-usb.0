Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125225;
	b=DF1D6KA1fJ30LmAFVv6/9RIvmj7IpY2drqGjJu/OLFEyTx+YfTYnu9VsErmPqZTXG1R3
	 EKVIjVUHTzGFmn2QJsA4oj+fPwwRYKqBM4fE/HEgNK7EnUA4qcDVu39F7JsTzB9IAf0ih
	 RiBieZ7cedaSpu0Dd/bBi6YQp4YSSh4J5qT+TM7fMQH8XgaSLQ8QRW7VE2+TIyNrhIVyu
	 x0R2bCYIJ2Y43CKlzHzf2j6r9o2xhf5f+mndZSlv3GbNHoe0xu5sod+fsU/Ky1/eLHHSh
	 Z7JldrVx0uQ175OYJRBAlxEN028PUcRd5AJf9Tm3MO/sRRBBWOqYEA7ejNm/f7VqdFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125225;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sWDKfxq/XdIEFR0gdDId+jVBejfnjg6WVhJgleRxfq8=;
	b=YlN+Vnl3+a0zXo3YaIxFJKM7lZw8GHFPCuv21LjCAdpa9xmLytAuJ9jKn2L9slzaLxFu
	 Vj5jaW6IEnE4UuE1roH76ZJ2/+jZoiCCPsljMwt4nCfdmltc+YzD06NtiY0/JmiwysAK2
	 m33mC0BHMKWAxQEAqTwumdwkq5zaRhJDiN9EpH2oVMJYh4n0/9uWMwJeyE+WogCeVjYcG
	 Y/3CCzzPqHxqHUk1QA+UuO3yHFUPL30+bdAoiQ8zwAi0hGVmpeaaSCYORcO9Wqj/xppek
	 pNJJm3MJkciu9LqZkf/UqJ4KFD2MHvhxeAIK0KG+3ehRPXPDVN7Cy2A4AOpqBdufFMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y8kakveZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E3F606A326
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 21:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y8kakveZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1053C1F000C0;
	Thu, 19 Nov 2026 21:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125225;
	bh=sWDKfxq/XdIEFR0gdDId+jVBejfnjg6WVhJgleRxfq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y8kakveZUde4GvvJrEFYgZ/L7yh5tTmPKyt3IAxLYwo4Qkpat6T98ffmUQP0SKaRZ
	 87UHG+r1kQxdYHd9iHFDCt9+9yDHUrvjtpxOA18DrSPlj4FtuQVUxcbDU3awvBBVrE
	 q1dfOftkc7bnaSgrYG2HFkFXVmD7+d6loJtjpAldrnoNscDRwMH3Ydlp6NktX+GXfX
	 1h8dQUznZ+PSxaL7nOqJ70ESIil63bLVJU5gfcezDo2akmQ8tAGUKLZb06Oz8GvJZb
	 ugY3Rf2M1jOZJXsb3lwTRvxpemGSBHRWr+qd9s+LMw0RFBGic8jVu0njU1/ZBP2Nid
	 q6X384qCadh2A==
Message-ID: <sashiko-outbox-224111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [[RFT PATCH v2] 1/2] xhci: sideband: avoid use-after-free of
 stale virt device pointer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119214841.1552318-2-mathias.nyman@linux.intel.com>
References: <20261119214841.1552318-1-mathias.nyman@linux.intel.com>
 <20261119214841.1552318-2-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 21:53:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The sideband structure caches vdev, an xhci_virt_device pointer that
> the xhci driver may free and reallocate while the sideband is still
> registered, leaving the sideband with a dangling sb->vdev pointer.
>=20
> This can happen during resume, either when the xhci driver detects xHC
> power loss and resets the xHC, freeing all virt devices without
> informing class drivers, or during reset-resume when usb core
> re-enumerates the device and xhci frees and allocates a new virt device.
>=20
> Store the usb_device pointer (udev) instead. It stays valid across
> reset-resume and xHC reset.
> Look up the current virt device and ensure it still points to this
> sideband before using and dereferencing it in sideband API calls.
>=20
> Make sure xhci_sideband_unregister() works properly when called with
> an invalid vdev. Don't dereference it, or ask the xHC to stop non-existing
> endpoints, but make sure the sideband is properly freed.
> Fail other relevant sideband API calls that would access an invalid
> vdev.
>=20
> This solution isn't airtight. It only validates vdev when entering
> sideband API functions. It does not serialize the sideband API
> functions against the code in the xhci driver that reallocates vdev,
> so vdev may still be freed in the middle of a sideband call. It's still
> a big improvement and a first step in resolving this.
>=20
> The following patch starts working on the serialization.
>=20
> Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secon=
dary interrupter entity")
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119214841.1552=
318-1-mathias.nyman@linux.intel.com?part=3D1

