Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795326739;
	b=GXGOhO+Wny/M6TZobqAG9jVlzZil9Ki4+JLYkK2b21kMc3hpsaP0ujQN6GHSohBo/h1z
	 Hm3cuvLDBI+Ti66KZuXOw7pqE6MAig7n2AGad6DqaCP85Vj3VmQGNLeXrKrJl2DjX+p5N
	 bKaBARDj14sTKfqyo/tjrLSGe34d12Xtc88dhPbIa2xoMwTBMHppoVjGitT4Bs3ejzQyc
	 847u9NL6gUjiYP6iCg8NTNHLshgiq/BBiQUvT2lA32DskIIKlJ8TPQGUcPP9IyBGVPyC7
	 nKQeQFNmmUQ07T6FJhOz0PixJHqUQf8uowC7v4Ze5GSZy/PMZunj+tkPm4/rHKmGIPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795326739;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KGpEF2MhBnp2oMyC15+UFw7XGwRIXLLKGdN3FOAQjs4=;
	b=39xiESUEwHCR52qJsAycuHwTPEHbj+LrkdzpzdISBjzbFi7gMZWgm8NRdJcUQdqeSkzA
	 vnKaG0N30clUYfHA94p9Q3d6VlEeEkcIre5R4aMzUnNrmwjN292mE8ayM6dyhTsfhLU7E
	 4Ryp6nrTnNmw6jxMTFww2DOTMzupUWYXd8OYnHyrQ5hm+XV3CFWlfbVE8HKwD9C6GtfPR
	 a5V0+bOOANsmMdvtlRRvQKS68t6dDLBcDWcEPnsuAq9YsNVN0uElP6fuso6XOjD9vSCJX
	 jPOfgP+ukcLsf0PW3LrCmPam0wLU6k6NEFbpYx4RcGrc1iyV3c0DRmrK8MowLtfN50w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJKrd6jB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39201606A32C
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 05:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJKrd6jB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A680A1F000C0;
	Sun, 22 Nov 2026 05:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795326738;
	bh=KGpEF2MhBnp2oMyC15+UFw7XGwRIXLLKGdN3FOAQjs4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KJKrd6jBmEsWf9l1wbmM2D2UgPNPWAAGchMRKmD0M/mmZXWETZYqzDyrFCbqEzgz9
	 aD696Qm+vB13jMrwj0hIrYt1uJfXFSqIry1zvnvSkojdN6PY7kti3UuY+XGv+waLSQ
	 sIXa3NgOtDVnQbuwnD+Ur08EPnOiFhZRieaLmfutBNX7Me0qrQv+l74qASof2Mv5pO
	 UcAD5em6+mM/5Kz+ZMWBCq8FejVBGBfhy7gipbxNh/AL5gLP8ThtJrLaaxmUgyGS3a
	 gHAZBQyzXDQ4JExFPDxOyaWyHf0+NbXCFC1terknl5qyqUrGBYQ09GkVoS3DSoi6Us
	 VgYjxCqFfF6Iw==
Message-ID: <sashiko-outbox-227747@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: xhci-pci: don't perform Soft Retry on the AMD X470
 chipset host
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122054922.50251-1-rosenp@gmail.com>
References: <20261122054922.50251-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 05:52:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Commit a4a251f8c235 ("usb: xhci: do not perform Soft Retry for some xHCI
> hosts") disabled Soft Retry on the 300 series Promontory hosts, which
> fail to resume an endpoint after it. The X470 chipset host (1022:43d0)
> has the same problem.
>=20
> With an RT3070 USB Wi-Fi adapter (rt2800usb) on an X470 port, the
> bulk IN endpoint sees one USB Transaction Error while the interface is
> brought up. xhci soft-retries it with a Reset Endpoint command that
> preserves the transfer state, the endpoint context reads back as
> running, and no transfer completes on it again: the adapter receives
> frames (its RX FIFO overflow counter climbs) but none reach the host.
> Booting with xhci_hcd.quirks=3D0x10000000000 (XHCI_NO_SOFT_RETRY) lets
> the URB complete with an error instead, rt2x00usb resubmits it and
> reception keeps working.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122054922.5025=
1-1-rosenp@gmail.com?part=3D1
