Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928857;
	b=26V0ijQEpHu5+sLNEZE0oCQAb6mPbszL+F0XW1/wg2bd+rIieyLDVKjeG6nqk3pHjZPE
	 8aYweYds7JwbRbwpHqxtRizWm+SpprBShSypekFotwYTaVeLkIGORtzGhaSsIF0vv/pBQ
	 3QY1Rxs+mpqln1fHw2Z8SVi4xNNi4zDym0rsi77Xzqfz3C2AfnuZDEJaYvmE0GZCbcMZq
	 8wsOsE67O9dT4Wp7s5/7Gvp3kVbsTFGapZdAA93higJi8lHA8EGPfFsJsCcOXvpGxjIr8
	 ZrHLkTODdLAr4Yu+sQGpOCWs3hj6+ylQVHKD/LF1qP6CgO9rSeAwFU9umyQ7x0lHiWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928857;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0xeRxOp+PEmF/7xPpd5T70TEbVbqdmjtoR6B8cr94DA=;
	b=bBw3WD6j7OCaRin5XHpygffNeIi2qqTjN8Ujbf9xS9ep4zGuVCSDiOuPtapEFImqRa02
	 CY3xZS4URwXfXvo5I6rrmqs5voOEXDT6LuZsLYgVnEE4o270oZvaugyM2N3JkVv/UQ//3
	 p2LJBWFApxhFwR6c3Wadd0I9h331TVjdFCQnnPN/yavkKZX2PCuTH8/W/3DQN9pnAH9ZY
	 Zq4rzVI56TnQj3PezpE5sS0XabYRL4XgP4SAbdBQ7eOImvJVZ7KDWA7SwbswIFs/1Zy2O
	 UfzJwmVPO/gfI7jrGOImH6itw2zqHlbX+bMKYmGtuWXzPr1OIIZiFar0AKaSMmNrqDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWYGxJ0+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A87606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 15:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWYGxJ0+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2923F1F000C5;
	Tue, 17 Nov 2026 15:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794928857;
	bh=0xeRxOp+PEmF/7xPpd5T70TEbVbqdmjtoR6B8cr94DA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aWYGxJ0+J1LQ7oaL813IjJmuD1vQ4LPEIM21iLUDr09t2LdbXDI+JzVL4H7GWFpCz
	 d1y414IjAJsyUKWgB4dyPBAqWZmtmNpX0R64AxZQV+tH0VqIF07SOFwROOXvNRa/JQ
	 vtHWL/TT8O68bJutl4DHdpVkTkS9UzxyQmusnPgK+y1CC+/TA8vhRmah4PJjpy1hZZ
	 VBDhrzt5QbFJ+ULoQkQiAWEt+xRsSIXF77uPhYAdiouzmqZMtXQyCTciaLGPgeCElg
	 U+hN9Sm+rl8Ikv3ephPKQRUADuj68vVAbgNElc6aBeNY58LCBbLpq29Tdci7IAthHL
	 X+4l6M+SCmkfg==
Message-ID: <sashiko-outbox-219050@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: usb: amd,versal2-mmi-dwc3: Add MMI
 USB support on Versal Gen2 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117150219.1326693-3-radhey.shyam.pandey@amd.com>
References: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
 <20261117150219.1326693-3-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 15:20:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Versal Gen 2 platform includes two distinct USB controllers. The
> LPD controller is a USB 2.0 instance and reuses the existing
> xlnx,versal-dwc3 binding. The second is the Multimedia Integrated (MMI)
> USB 3.2 Gen 2x1 Dual-Role (DRD) controller, which natively supports USB
> 3.2 host and device operation over Type-C in a Gen 2x1 configuration
> with a maximum data rate of 10 Gbps per direction.
>=20
> Introduce a new compatible in <vendor>,<soc>-<subsystem>-<ip> format to
> uniquely distinguish the MMI USB controller.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117150219.1326=
693-1-radhey.shyam.pandey@amd.com?part=3D2

