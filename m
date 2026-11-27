Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744787;
	b=TBGlFypGjF6sJEKfpVIDxcRHG0aM03gu3VWzy/ZXN5P+FkoUv/BuCmQCk0CWjfwPrGwG
	 4vL1QFyYOUQjuvlVKUy0tdkZm9vcSw1qx2ymUPZrdS1kg8VnukkZrehdxQWfeRghRd3Tx
	 nSnQPtn+MpLl5akkvAGXXhqs1JuZ8ZsylB+IziaQZpRitno5gVExlmr+x8+mwxWBEe8pz
	 Q15rYUFmjTXP5Ce0ie8NdTXc7RVDs629FxPDh5B0E5PWTRNjYn6hLpRCozVUVMKdepWn9
	 GeerynPpvWusatlaG6HkgSVAwUvaqSyxhwMatHw8rx32XhNuBMFdEvRpzOjjOmvvdiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744787;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zJrMTkFQrNBJQYHAOQz42vxSUMBIXWnh1a2qA1Cv5yA=;
	b=lWwsBMobKWMdgrtn/bvLFJOVb7GB/5facV7OZVHHEkyRicLF5q1SBOLvZHjjZ3wX4mbC
	 AJ0blyEvtbUbIIY2hTBnklEvOSou6W3v+veGhdbfUevwRJiqjg4z3Q74A2K47oMt+yU7x
	 rVE9+fwEn79G0Cv8v+D1sbHKUYmnjohNiES90RKSElZ4jmNK1KN0IliEw6vTUAR3M3z6w
	 uZ+3+6eMPdUFI4FcSid4KYepycOpNpT/e8Z5jEv+SfFXcwOrXLPm+510YpiUKY3vrouH6
	 2mYeuSZg548tF2TzTE3V1YMH4FGmK8lqdUEJCLN1SFCdeAxYGccKzIcUP9OcbmQQbGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JkFCFIlB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A786D606A335
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 01:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JkFCFIlB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDCA1F00897;
	Fri, 27 Nov 2026 01:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795744786;
	bh=zJrMTkFQrNBJQYHAOQz42vxSUMBIXWnh1a2qA1Cv5yA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JkFCFIlBekKcJCmm+uUwMOnV0wdA3n81QynnfsoTZsIsUBvpMZ9HXHzojvd4/OhGp
	 m74ozpRV/Xeb3lPGLEY8r4CSYVkxlxaiA5DhL3TZwpE6lTqsftD77Dowi/rEPgLpPZ
	 gpakMrEBMGixmMfcZ7oPt28AVMPECK4awe6wXT1S5FIxB56bWyBL357c6pw47PR/+G
	 eUOcwkIwz44k+An1S1mPSP+vjKcTzDtxFhNkeLAlBFLbtoMqqmSvPZCgKSV0QJcyz2
	 XSvmc0k6dxsTwwYYvMs3odH8kDEspTW0CfDv2h2j7u8pAsRxZOEZ2LSFV95bwXSwmv
	 pJ8tANkDTAFFQ==
Message-ID: <sashiko-outbox-236426@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] xhci: Handle missing USB2 resume events on Etron
 hosts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuangyi Chiang" <ki.chiang65@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127015407.3937-1-ki.chiang65@gmail.com>
References: <20261127015407.3937-1-ki.chiang65@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 01:59:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On Etron xHCs, a USB2 remote wakeup may also move other suspended
> USB2 ports into the resume state without generating individual Port
> Status Change Events.
>=20
> The issue can be reproduced as follows:
>=20
> 1. Disable autosuspend for the USB2 root hub by setting its
>    power/control to "on".
> 2. Connect two USB2 hubs to the Etron xHC.
> 3. Wait for both USB2 hubs to autosuspend.
> 4. Connect a mouse to one of the USB2 hubs.
> 5. Connect another mouse to the other hub. The second mouse
>    does not work.
>=20
> The affected USB2 ports may remain in the resume state, preventing
> [ ... ]
>=20
> Tested on Etron EJ168 (1b6f:7023) and EJ188 (1b6f:7052) with root hub
> autosuspend disabled.
>=20
> Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127015407.3937=
-1-ki.chiang65@gmail.com?part=3D1
