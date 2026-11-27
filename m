Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786853;
	b=c+KWurPpM/lMOJCo8S1XS443bUIRIRgK6eeR/l0+kFyZJ0ZMqXMiyoV/ueMIdFyP9Q4U
	 0KlRCYEkh/fSVn6WKQq/70yi1avDYa/2jGqeTLWn1oD716mrWr5Ky+eJIQd9wpzWGO7Mw
	 XsEsSIxMdu29OZXnwHS5NwKCgBNtbbFzAPLiQlYNGmXrl6KyTodd/DHgfer4tZ6CpnYJQ
	 Wlela/9JTiJBcJyrz6RRx/V3BLtikEQp0UcQkcMIty/9UqvRCheaKMiB9+EHoVT5ofZIw
	 2s9tetTyAaJoxD4grwc0VC8dXIlr7D/1x8MwObs1+CX9Gig16HqgH31eyKnqrl85v1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786853;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tLdCGgvIaBnIiwftqkVt+FCBiQa0SHOGgHLcXyCci4I=;
	b=D91/ePvYTO1vnCoovQY9vD2COJMULBvUuKJaWj5C5iACAJSEcVbUmCtmwsmD2bssqJLW
	 P701w2K0CkL8H3R9gdNOJXZ7sB0F0tkG56htmVR40EZMXkIv+kOXKdDj8DauP3s94DC5x
	 InI/wiJYvW75lQcJmxo3uQ/wh9SuiN89wxXNipoXSIPt7x19XcXiX8+HCjFCTuX6yrL1T
	 b4J9Z9Pmqt7ftgp95v6hFHXFAK3b4frjy9sZTXnn7H5iFkxqxOWUgOySdlmw7nwADaTQ+
	 8FXFRWiZlPurOBkdpc4Rvhl5xnibYJgIOtz37+0JW+xJ73HVDgiQruiNqOpk/OwdiMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hf31HTbq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92FF606A330
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hf31HTbq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F471F00929;
	Fri, 27 Nov 2026 13:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795786852;
	bh=tLdCGgvIaBnIiwftqkVt+FCBiQa0SHOGgHLcXyCci4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hf31HTbqJeERgHIMzQoLjXWPtVq+ca//qGyy2eawRbvniUsSWXp8Mat0BHKuf23CF
	 Uvb6d1OGohS0yLJWdcsqeGC2t2XenrYf6W9M3X7j0JAHdrqNJ1vcehrK+HPiC9lcd2
	 g4eJxBvQtktnhC5z2jZT16FzUCkP285zds8m4EbAE4fMJkftl927AF+czqu/c5lyj+
	 wW1OLf1Wo01k+qTz6c2U53sl8s58XOYUxVvDExWNZ1DWRyk0nFJap4EN6Ve8EfMn0D
	 kqnAL1uQ2Rve4GBvihXv0c6Zb0MjGCf3H2V+3SRIM0tYCFikhZN0VRMfVlHVUSBIuc
	 eZVB1ljc+rqlA==
Message-ID: <sashiko-outbox-237508@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/3] usb: core: fix three use-after-free windows in
 the USB anchor protocol
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyu Xie" <xiehongyu1@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179578612505.44635.14553263875690325600@kylinos.cn>
References: <179578612505.44635.14553263875690325600@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 13:40:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179578612505.44635.=
14553263875690325600@kylinos.cn
