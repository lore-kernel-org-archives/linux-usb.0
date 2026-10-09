Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBCF3E764C
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550347; cv=none; b=nGcECu3tkAyyYbIUMns0zQdJ/wHtEFVKEldB6Y6rzIrhY9wDF7hufgZKAefe/bREDQlcyJz8dkauFdVDJqS+uS9xBLn4zLdteU3Qhe9aWCDt0pD5wb0NA4TYjuJ7r5lpT6WK0uvYlc0epDPImdgRnFeQKAjZom4xDKyJ+Vl0bBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550347; c=relaxed/simple;
	bh=PP//feY1odsU2YYNd3kfMwHUrrVwNBCPSj1A7szzXB4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=u7P5XEXpugKtxqmdAwbZR5hZvIrrydEiGWmkYdR6853x04Ye56hlWa6OeqRiQkGv4Hp2ysGyyBF7KBUSC6NNggLx/L+F3Db1wit73DuHg88LcOhVzCAt3TRtmcVXSpwVckhRGyAksFGxW5omLVRnVKOTIktyvm9v5lZU3jxAq34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tt5ylIaw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tt5ylIaw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B751F000FF;
	Fri,  9 Oct 2026 12:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791550341;
	bh=E+GH9IGnlcRvAbDO4jxH8DF/6HZR6NMoilEPgT2lmlM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tt5ylIawOby92GDN/bEQIOVS+E4YgHg+miajj76Y1odFsQwTFwkRqNN3yz7/298ka
	 cpMT6g3XpyoJ9dSSVJi8CDh0yIHZg5Ci6PvX/uRzhZVBxCzSDSMfICsErad9Udz2gh
	 o+whK7ZNOO7O1H0ciNDFSv2dxp0ISa51d0lYUHvC6HNMxI+yEKH4817nax8jDSkB47
	 16Vc4zaP1kifA5Js1Z0FdLIBjfILkZeF1wWg1Uowo9BBvdqefwcswk8RkXjZr7VXdG
	 1VzZru8AUj7XJt4SUoPVVPjZQ/XJFDNbau+LVVSRsPJ1drandFmV0QEuuqblvX9Gfj
	 PZhVmPiqsQlgA==
Message-ID: <sashiko-outbox-165569@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: usb_wwan: fix urb leak on disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009123242.464956-1-johan@kernel.org>
References: <20261009123242.464956-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:52:20 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Make sure to drop the reference taken by usb_anchor_urb() when removing
> URBs from the delayed URB anchor to prevent them from leaking when the
> device is later disconnected.
>=20
> Fixes: 383cedc3bb43 ("USB: serial: full autosuspend support for the optio=
n driver")
> Reported-by: Wentao Liang <vulab@iscas.ac.cn>
> Link: https://lore.kernel.org/20260916165608.2085613-1-vulab@iscas.ac.cn
> Cc: stable@vger.kernel.org	# 2.6.32
> Cc: Oliver Neukum <oliver@neukum.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009123242.4649=
56-1-johan@kernel.org?part=3D1

