Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795723612;
	b=nfC07WOIPpcRMkZ2pO8JsdxkCjrCCrtRWfdNiuYjXWSOWubrUAbkqO9wfMrv9APNwNKr
	 ZEbbYEb+YdCN6+wRBVHOKzcl1kAEydv27EQ2bQPDNqbtkXiC226oSo2bQuEJAfHuvch7S
	 nEl6jPpFp9uYvsu102ynD2fUH9kS/Q8BuSVIkfnR7/X0KbT/ADCf9CiYSz8tTvByS/fpl
	 //z6H7sT+Vw6uqVOFBroKormn/4mzT1WBlL9Hdq4OTeNX0RqOKNBpg4SdjNonFo2bay36
	 6/K28gcp+FPQEKGH+/p3lL+qXH+7qLLcvvZ0HGCKnQOrshHExXIGl+ReeDx4RU7HBKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723612;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EC5JmZPH/+U4yrSje684IVZhvHsejkw1z5wC2FmCaLQ=;
	b=q0hEWf8/rCFCghpunWEefif3eNppZHN2APDj03BcDYKmYeedURxWnTGSrKn80pSalLoA
	 lbsn9bbOGJcAIwjU8S/HKTMqGBvYaFEqTB5Jipigdb8rVhr8FtUTOqPgR82ROnHbe4w8J
	 ZTH+OWlVUAXcLL9EasCohBocsk6qTaoHedm5OLDxt/PXuvSnSeX3E/j85HPcA/sdW/mLC
	 Uko0GDsvIsfC/T2ZTYtPaD2qkqdWKUWkUIyzoD0Hl/hdxlBcpznj6IklvWjt6eAYtXXfm
	 9vTzUh3eBzCxjfrJE26pWGlpGdbXJLmDgQCb0pUI5XRpQjSL30b6S8Y5DdfVw3dgiJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O3dW5vAe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7E6606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 20:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O3dW5vAe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8402F1F000C4;
	Thu, 26 Nov 2026 20:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795723611;
	bh=EC5JmZPH/+U4yrSje684IVZhvHsejkw1z5wC2FmCaLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O3dW5vAeZbVtY5AAC/LzauKgIfWacGilRqx41qNFeC9MlzF5Fx+dpLefuHBMGvumg
	 ChowWZFUJYZTUp9DuaFnuKSKKyOG9gu3dttViN8wVshRCEsa0rlFiOQLRRVTHZV9EO
	 LPHZPZINwahM3/jxPjiUQJDTfnSaOJAGtor0QEwtL6IhzIPv/4ez+O3PU6U+zVb5M4
	 DERb0AG6qC/M00Ax1yuMgQW1YBCyZ+ZY2u9I9kRNuEVRx9dMNl9WG/4ROWoB2/7Dkr
	 zdkBJ4u8ocdFopgbYN1scvxSfGcAfYRMPp/xLKdAa9nJAskFOZ4C2AyXEJtxzGqJgJ
	 DXM0bNDL27jRQ==
Message-ID: <sashiko-outbox-236148@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpci_rt1711h: unmask alerts before
 registering the port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinicius Pedrosa" <vinicius.eduardo.pedrosa@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126195059.1139494-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261126195059.1139494-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:06:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> rt1711h_probe() masks all alerts before tcpci_register_port() and only
> writes the real mask after devm_request_threaded_irq(). TCPM starts
> looking for a partner several milliseconds after the registration
> returns.
>=20
> The ET7304 (RT1715 compatible) does not latch a CC status change in
> TCPC_ALERT while its mask bit is clear, and setting the bit later does
> not bring it back. If the partner shows up before the mask is written,
> CC_STATUS has the Rd but no alert is pending. TCPM stays in
> SRC_UNATTACHED and VBUS stays off until the cable is replugged.
>=20
> On a Radxa Cubie A7Z (Allwinner A733) with PREEMPT_RT, a source-only
> port and a sink attached at boot, 6 of 12 boots ended like that. In each
> of them the mask write finished after TCPM started driving Rp, and in
> each of the other six it finished before. With this change 0 of 12
> failed.
>=20
> Write the mask right before the registration, so the setup before it
> still runs masked, and drop the write after the interrupt request. The
> interrupt is still requested after the registration. It is level
> triggered, so an alert raised in between is handled once it is requested.
>=20
> Fixes: d6b82dafd17d ("usb: typec: tcpci_rt1711h: Unmask alert interrupts =
to fix functionality")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126195059.1139=
494-1-vinicius.eduardo.pedrosa@gmail.com?part=3D1
