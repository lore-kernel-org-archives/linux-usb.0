Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295690;
	b=k0bmQXHGZT4xYlmrcl7rBU/zjksrp7pnVFOkseMfVw28bizYvhQdmmtKUgCL5W/6ufe3
	 iCuEN4E8NKJiIWXx05cuzeQ237BnQpqyeAhzEPJ0sF1k3d1HyLkVY2Z8C56VyoOMw0rlJ
	 W2eiJfYCvzGfBVLT74J+pzhLSN4lbS5oq9CO3pxEmeUJHH9laFudXs5ZcLD28Hd5BiUMs
	 KUUr66wUXupujb9UlCnPZ8cQw2nRBXukBIRj5apJp4U4ArFk7ycXijuikyQJ2v8qrBF9b
	 AR85Eh0IkPQRm/lrYw2Be+PvNPkEkzxjILuBByfTo57zgKF7tzHh0j50pjVzOzLfzWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295690;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qBH6W1if/IYIyySlOv5ScnLGCRGP+HWjQM6wvrxJqig=;
	b=gtwboRVbsByP0Oiu4q39jDYkR/m9QHOrBZaFt8V801CbYO9CJt/NGtsXTL2dIY9qW3A7
	 MVUwsuiVuJZvOE2NpsEJfw3adUcrfwyOAgazBbVfosHw8vyZyQIaZbHl9ugmk9mCAFqky
	 r/Wz8PUHVc5WO3HSQsaqKuiVe/pxM8dtkjEWW1FG3+I/hrlM4YvbQ+9WPTZN25rOMKSbN
	 friwE/oqA7Fdwd26AHbq7yZoU0/YwkPh1UkGbJmTJfajG4WXk4VRTI+fsxomUaejVeFzp
	 bVRbPHO5wrdnZij055GlfuCw4rHxHSedRZvWMK84+GOHLuVHfXVPeyw0+ybrsxEo/lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JgmR8/y3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD595606A321
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgmR8/y3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657431F0089F;
	Tue, 10 Nov 2026 07:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295689;
	bh=qBH6W1if/IYIyySlOv5ScnLGCRGP+HWjQM6wvrxJqig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JgmR8/y3xtJmWWKijj0sreWsuLwPWgPooKGvAYtltGnbETThxOieEyHjFNchXs99J
	 t4K3gg4ZHNx9L8dA/zWq+XtISVxFpt+/gTk95U16aCiqH5KxkzXakd2wjUDkg0yWr9
	 WGxR9qeIVPnJ1lLX7JGTZPZpUHxC7V5/B6JfiHIzDMGnMwNrkDV/cYRxgqoGWBhBor
	 Me852LwZjgYdIDv+O1PA/a6Q/twpx0njWN2bUXBvyyjTI7qmj7vNejFgwzAMLdaYDE
	 d2GIO639ogVeC+b8keCcqxdy7csuiqzVyi9S+jpIZm3z6hY1l0fjssdAb2CInD/P+w
	 /M5beGeLUeGvA==
Message-ID: <sashiko-outbox-206491@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: dwc3: Tell xhci-plat when the core lost its
 state on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-dwc3-s2idle-v1-1-2ef4cc3f8130@gmail.com>
References: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com>
 <20261110-dwc3-s2idle-v1-1-2ef4cc3f8130@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:28:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> In host mode without wakeup, dwc3_suspend_common() tears the core down
> with dwc3_core_exit() and dwc3_resume_common() initialises it again, so
> the xHCI registers are back at their reset values when xhci-plat resumes.
> xhci_resume() is not told about this: it writes the saved operational
> registers back and asks the controller to restore its internal state
> (USBCMD.CRS), which cannot work on a freshly reset core. It fails with
> USBSTS.SRE, and xhci_resume() only then falls back to a full reset:
>=20
>   xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
>=20
> xhci-plat already has a way for the glue to report this:
> xhci_plat_priv.power_lost, which cdns3 sets the same way. Set it from
> dwc3_resume_common() whenever the core was re-initialised (and clear it
> when it was kept running for wakeup), so xhci_resume() goes straight to
> the reset and re-init path.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-dwc3-s2idl=
e-v1-0-2ef4cc3f8130@gmail.com?part=3D1

