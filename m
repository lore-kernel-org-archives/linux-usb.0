Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036116;
	b=JcasI5gWg4O0w5j76nfFoXQ6S3Hi7GB49DcH2VmTYSj5JsA99YjE1v7fpqVYBgRtiXgJ
	 Mi/o8CKsI6OAqRl8t6bZUh9vR26fy4qv/nEVqimCLcsHcVKvXFPEZLjvzSQhMfX9TXPx3
	 zEt0Bb4cMeCZSN8VJMZCiorDYSfxBfzP2/llPauXxAv5rlYuvc+bbBieYeDk9CwSDK+dK
	 9mSXjf0TmnZ7veBwDTjc3Oc6nqxEBcI5JC+hYoQ1vPTd5EbBLB9vdI24pyNQU4lpu6G+p
	 T/M80kuZlffSPxUgFl+tCN1F/X+Px6QnSCU1rpphFrFhAlLzyuRxSXfUe31iR7v891Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036116;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zllb6rA8+0aHktgwxeWSrRcVksERzj+UyeW2uqDXGZY=;
	b=IpjVV91nJ7cweNomD0osmIWU8YYIs7or9Btihufi8/t697JAud7iF2A7IRXyRcJp7Agi
	 DQ3bVhbQSRJ7LBeBfK1TL74yJVn09wLM8KlQ2yEVKU4/tClu6CKkQ1aCGGLmhH0ykNfKg
	 SMYscwbiUPd6BtEv12h/FldzrqMIxVr/b/nTjuzeoLQnTwaJmt3vAFdIfef5WNpkqjPXn
	 /C7PMrhCJO8v4blAwOkS0phV6JAQQ0DNQJyt+66Prr3tHCH/IR7QDRSl1WLxsp+3LjPGR
	 Qp2B3pqjcOW+rb7g1k0JyGNrNBJoNBHtOWxVKmdNK2UkS5+9YbwWc5sQnRHKa+yExvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="OAbJ/c8J";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63021606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OAbJ/c8J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D350A1F0089F;
	Sat,  7 Nov 2026 07:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036116;
	bh=zllb6rA8+0aHktgwxeWSrRcVksERzj+UyeW2uqDXGZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OAbJ/c8JRIiyjZlZYVbDnSfFWSlWfBD9jwVKOHnLHuTguOZsBMI70kOPXfkydKRnl
	 3mnTmQxIZxtFhMCb8LPGIe9h6vXI9ZzUhdqlWy2dkcXzOMOETA8+3BxFh13msVrJTK
	 nqiyT1XkN82uX9xVtLIo7COUYbUrjMGTCTT6OyAKGCh3I1xwxoNvYLZdgSnVA6fytJ
	 GJBiDE1oCWnBmEp84+JPSeT+1QOKsRTSZwupOnJL6eIW3fBaWb+Tw5GPbDwfVhSYg6
	 do9X8i3i75FVA4+H1mqnnG9f08cMCPephvpVIy4o05mNywcFdoZVYfCBbO3RJtYoVL
	 qSRcSCirP5aqA==
Message-ID: <sashiko-outbox-202701@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 11/13] ax88179_178a: Update driver name and
 information
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-11-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-11-37b5a1189983@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:21:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add additionally supported devices to Kconfig description, add
> further requirements such as PHYLINK.
>=20
> Update driver name in usb_driver and update MODULE_DESCRIPTION
> to include the additionally supported chips.
>=20
> Change Kconfig symbol name from USB_NET_AX88179_178A to USB_NET_AX88179
> and update loongson32_defconfig/loongson64_defconfig to use that
> symbol.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D11

