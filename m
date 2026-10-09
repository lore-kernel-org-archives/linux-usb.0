Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2291C4E323B
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559561; cv=none; b=aFAaEUXe0jeHKaQNsTssl2HW9lNYhNwo1YHnApPAujp3Vft4k4ssuT90+cbEQZtLBV6xfM+Dxk5tmR7YhR2YMy1Ex8TgY/6Rzqg15xGf/O0xjtW6ZOJYSCGqwhg5ORIX3NuA6u9m1IRE89RAM1+VFLthSrQBJ0LswkMRUqhVWDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559561; c=relaxed/simple;
	bh=wzCFHrvM7iUxW4q0xDC0XRgZfmiYqZwuXtUKDxriIC4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SBgw82QUmdDjCkAoI8wAREoGBR4ImC85Bd0ncYCRdz3UAEV0JBiUxcSt8LnLOxY/9u0+YXO+LyAEAn/ocXBV14k/4M+h0EqYn0+WXK+M5F8DgoaXEGW9mUoYwbFHy89NPw+zmWFMX6Ar2fryTF0oXgK+SpyUxJtXLK/Gv2DYD5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVqc/F9Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVqc/F9Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E221F000FF;
	Fri,  9 Oct 2026 15:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559559;
	bh=wzCFHrvM7iUxW4q0xDC0XRgZfmiYqZwuXtUKDxriIC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bVqc/F9YiwTaG6V2YEN9/2PMN8BJubIqwttsLxAZQ6KbF6vyeD2FIw0wy84jpNgwr
	 opxxKl5NvFEe0Hq6ImLMaWkqjoqhi3CwJnxYQip744GuPaogtz6dVOh59Obs8Xd0z9
	 fEcXWS2qKNhxsjN9r/QdoRIxXqon3kFR9sAq7DIfRr88uJGT2CrLo5rkcOOqA2dtDf
	 Rht0OC8uEE3nlesr2kbVQSRsA7++u2Dn84R7dn2nyyP8LZlo6NH6w+YmVVOwWtSOCm
	 RxeHJaDCFB8xvcM1VsnYTWks0giDan+bSG0V/UX9IG1ew1xD4XFO6/G+REqq1YvXzi
	 CvWq9mpL5wF5g==
Message-ID: <sashiko-outbox-165770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/11] usb: xhci: Guarantee URB giveback on Ring
 Underrun/Overrun
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009151624.618967-7-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
 <20261009151624.618967-7-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:25:59 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Michal Pecio <michal.pecio@gmail.com>
>=20
> In this case we know that the xHC has released ownership of all missed
> TDs, we only don't know which were missed and which were queued later.
>=20
> URBs are queued atomically, so we can safely give back all TDs of the
> currently executing URB. Unlike the previous policy, this does actually
> ensure that the class driver will learn about the error and won't see
> all of its URBs still in progress when all TDs are missed on xHCI 1.0.
>=20
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009151624.6189=
67-1-mathias.nyman@linux.intel.com?part=3D6

