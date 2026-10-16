Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D054570DA
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 18:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176895; cv=none; b=RiniAkG/HnqcwuBA57krfvDItqf3Wmj5ROIOsI+Ow6HQk/NtSzbNGVgomlEYXiQHcTXFcCbqlNhZhN5zNAAUMTIjufy6QEAo2jeYmZMWkFg2r/kBdGwXM9tI9zecI3S54FND6x9SVrigCt01DDyCSh974Xk2kbR2QWMa1Wdgz6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176895; c=relaxed/simple;
	bh=d4fzGhAR/cUwGaQ2uKhyg6ZQrDHzSZ5kS3yHbiEcco4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=BTUauFws4pwP3nygXr/HY3oXwBF/qmI7OTmN5z4ds/fJ47Kg1XQb88ZTVqPhTow/vZyn35ifPrQyamAWd26kY+ZEEHRUPJ9hYyLJAS3Wf6ioHkkvweWXHuARkG8aKrcMEtSpS1UPgogXrdPht/xMwnVcdWjnbtHJcMsmlYFhNXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNMeIkFq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNMeIkFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25E31F000C4;
	Fri, 16 Oct 2026 18:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792176893;
	bh=d4fzGhAR/cUwGaQ2uKhyg6ZQrDHzSZ5kS3yHbiEcco4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oNMeIkFqIZowwFJWxgWF6qkXTmpmASN8hol3cWDzZrodi3XngQea0EGlRl8to7VpT
	 nOs/6GJ7YUtifCbugZJMq4y93mPzAEc8hrIVg9AEAgRYxukMbl+WUa8Yb6flRPL2I6
	 ooRBFWL2aHyB0trDPs+fEGMBc9gHHjofK4WDLVX/1oBIAwQJa91jCgtsebwfhjVoAz
	 gBE02NRAa4b0vEXWYgN1hrlM6nb9d6qpRV3iG+WXsC9xNZOnvbcy8rRePY0ydcZlUt
	 dQGV0PxwP4WY35rGUaDuds0FR78xca4R9S8zXVQqiZ6OakqSiI0/rnCFnkIEkagjmE
	 Zl2ASbDlH9IrA==
Message-ID: <sashiko-outbox-174786@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 3/7] usb: dwc3: rockchip: introduce glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-3-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
 <20261016-b4-rockchip-dwc3-rockchip-glue-v17-3-876f96893e2f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 18:54:53 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Introduce Rockchip specific glue code for the Synopsys DWC3 USB driver.
> For now this handles things identical to the default glue.
>=20
> After this change the glue driver is mandatory for Rockchip RK3588 and
> RK3576; it does not make sense to fallback to the core driver as the
> whole purpose of the glue driver is fixing race conditions resulting in
> SErrors and non-functional USB.
>=20
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-b4-rockchi=
p-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com?part=3D3

