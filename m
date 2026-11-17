Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919648;
	b=1LFfjJZZxAzhrIE8lfTsrAU8KzGezHCSOE+c/75AQrfTH+/Sz51/evoJVmeyugoMJoaj
	 EcMGUJ/hEe35Jp6mo1j82YoHQ+n3mpup8XMm/tywHAP8zS788BHaf19eBuMXnEUwQ3mWg
	 yrmm7e0Mi9uAXZnlR/6VFqaWa6XVVm8UNyvSkJetoWCZbGgWLWT3dDgy/9N7xLvNWTglV
	 z14Ys7ChmKCzHNZz/qicwZGMbK2+0y8imcC/681AN9mbI59IMtZ69QBEbZRiZoCszI2Go
	 ad66x28fIuZj8N2gFCh3pRERvqUY7Lr6sBh09gwytuQIRPrs52aoUqfsAnC/IhdnGYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919648;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uM3xpzR+9vGqtxGCOjIZ0eEg3BFcoo6e16N9NR2tML4=;
	b=irxyDJrghch1w7nufDcUITr8GS6cQFVVOfIw17wvm3a1/a+S5O7onvzQa7LlnpzD2p6a
	 WZsH8eVlSjKtSsx21RV0Y+VKpmcuMZZ3UEljhQpN00/sjJlsmFDtn8nACXzv/ynzWTi81
	 VjXd+0BSTX6lF2cPxIJyt7f+vOnCNCibXlBce5F3muR+HmVmSkEu35aLVoTXLwQdJOEo7
	 kIZtRFxZLap4AFJRfXih0XLX83avqZQ/LmI54XhscNTMOPsbbqQc4+4T8uKNozLCQXIYL
	 Jr7jSWUTsF5wRY+DnHAbEVOTt/xS7OkPvfIPf3z2iyIIPFVMsk50pdaS6apNFVY/ugg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ju5oBZ5q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB6560A2606
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ju5oBZ5q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43AF1F000CE;
	Tue, 17 Nov 2026 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919648;
	bh=uM3xpzR+9vGqtxGCOjIZ0eEg3BFcoo6e16N9NR2tML4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ju5oBZ5qoWMx7i//a56egd27jO9u43bd0vaUQ/AoRDc3DnHPiM8CsyYaaFHrYek8+
	 K162FoZO1Swt+Kg6d23u/0GPCZHlOy8qatYb8AhaVflcCozjKwwiIsZ8aQofR98FkT
	 PpAcLbWm4MsmrD9pohDsIR6gwZk4ojIQ8msGiJ8kNRFdoSYkufLtXRwKN582VHZ6pL
	 /Z1//lMZ7VCQIvkJtmlE8XlZXefqsCtbtE3OZTUGt+5MvwzNUBorpcpfJIP0VSSSS+
	 2D5ZIxnZeTybC81A5pfUjwWJ4QJa+GUQoYr8kqGwn64AaEei/ffXdeIitnAsQjBLfl
	 C8prraROiAR8Q==
Message-ID: <sashiko-outbox-218790@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/9] riscv: dts: spacemit: add USB2.0 controller
 nodes for K1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-6-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
 <20261117-b4-spacemit-k1-usb2-v5-6-52c3829cca69@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 12:47:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The SpacemiT K1 SoC has two ChipIdea USB2.0 controllers.
> - USB2.0 Dual-Role
> - usb2.0 Host Only
>=20
> Add the controller and PHY nodes.
>=20
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-b4-spacemi=
t-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com?part=3D6

