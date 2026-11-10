Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293074;
	b=loGcZoWTN3mjzEGcIScCZ4K8jP+N3ts3OdzmGUcB275lKph+ERuZFYU7ack60hu4JCX4
	 gztwHdWko54Z6ovfqkilfu14ZkOVQZlZXL7jQJU6gwRNOmhTq3KuZDMbBP3JhPS0MQFVX
	 v/TYeTfzSXJsBzW4tJC9Ghpopwt8DbnXe/+zwkDjrKvEZPiCerAub4L25lX2AiRypS8yz
	 X8NQOLkYKw2JbQbTKS7oCXZmJHANowWOP82ex6mTebtzBF7QFnP1wwJ6XWgGBqxDHqpOU
	 IqXpfNmzRIonT92m2gIyDnJpyhFv6hQy6DxO4+Zrkts2S00t77gxGNZRmdNXQv/MI9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293074;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6UecTkL0b+GodycWJqNDY3S3sAg5k+mmEnUu0wALPcE=;
	b=2FyXZYBBE2wovUKWv2Hj7sq4V53Fk+mw9ZZ5HbI3HwQHn8gbvWs2UqFoN0CjFx9aJQqR
	 33cJcC7UAtNfRufSY0ydvNfhrVaAM9WhbeDlPCENsPrx8r1n3yY7a+VAFutS886ZmZeq8
	 vruZCb9vJ02AhlNhrvFMZamGP8SwL2Hv3hU7ftPefgi10yDdiUhIyqIufb87nPvQbQ3iR
	 XuTith0BTH9HXEu4OVAEqSzu6mvmrzthmQlcQ5eMe0keTN0S4hhy1a+zRWnr/qKFwT2LC
	 FSx+yuvwUCXkqxsx1b3y+z65DLF4If73b5FD+f9stV7z9FtwQG/gL87zPPkuQDrzkQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkiJHS9i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C523606B1FA
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkiJHS9i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCAC1F0089F;
	Tue, 10 Nov 2026 06:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293073;
	bh=6UecTkL0b+GodycWJqNDY3S3sAg5k+mmEnUu0wALPcE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EkiJHS9isZ7WUhigYheVRz0wM9jrwcc4IBeRVC0E+2yXZc5k9HMuroY++5vZUWiWK
	 3rQiozWWAsxAsECbZ+2f+4S8zNqeuCMZYNqfSFWxJcrQYG+pa4b5OP1+p5TKwUPn9F
	 Og4D0pCiysc8V97jLVz+26NS9GKiGpB8NVBkC3ctBQCB/khDEnbW/ENdUDlzgBENUS
	 bcP7tvDYgGL8e69SoQGEhyJqVNSYPUhOQzFB7E3WEzIRFRBhPK/LHroGiqWTynFlP4
	 R2trrgsEHDuM40Tb+dan7HWFqOFON7GNGzMPP0X5I4gPsaIzTli4jAZayghX2g25u7
	 osidwemge91kw==
Message-ID: <sashiko-outbox-206436@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/22] usb: phy: fix a few spelling mistakes in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-17-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-17-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:44:33 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D16

