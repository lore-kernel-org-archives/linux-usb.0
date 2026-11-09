Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220914;
	b=EZIXJQgi8SnwoDv7wd1JK26zgG3HtqglscaPAh0uvtn9VVJH+3yUuHycwESu0BZ7B5Z4
	 WJlyKgsslA+9WJHENhIhrOEiMUWxRSvOeUUWaZlQ4FrXtTmBgNvgu+pR4iyDq+bVqgmKm
	 wGoKozZeUGWAnarG5pszYX4v5SxXMvZGO4qMr80qaOfXN6mgA7GNrtZk20mg296u8Smdz
	 xBhkaMRi+67z9/KBeeh7PkdITureJWsdhmu96eTEFj9hmw2uEvPvEk1QE/+fl9fBzILdI
	 pYLqDn4x3rVn6vvuGLW8UMvdebMPct/dkE7AtUoHvG8Xmz8ZniEf+e7s5q4R+GMAVoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220914;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FVutMJGxfKTrFtXYwtz9U3hWU0+h4RoBPEV8gtNFRRM=;
	b=SJfoFH2+wM2qoxGV+0RaAFTwHpOem8sfHluQx7OOHTWpxhpOzkIK2+S7xyybqr2+WDuD
	 ZEHJ5x2zDVH9i0x8h2isMSkEnJsWP2uczRrNqWYCXqX6qkCjwEwGogWttqjQiADoOWIVb
	 USsVaq0U2TfRRHd69VORcRh0EcoT+DK1qYkso7SOtTGVJcAbn5hPZIukcHa+Adq5NqzlN
	 ws1yvPIe0L4Ljt/xw1HcKGKHpG8kbriSvIjnQ8cB4RDZvZNCROBS8dcUQZFFj/o/HYaki
	 LAd0BbifgsHmGU5mclRlBpKeK1I/uKgZDevpnnWU1/gslSit/50s0hM6HXue7WaoH3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PxLn+JSx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E28606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PxLn+JSx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C0E1F0089F;
	Mon,  9 Nov 2026 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794220913;
	bh=FVutMJGxfKTrFtXYwtz9U3hWU0+h4RoBPEV8gtNFRRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PxLn+JSxCl9Yfu6b0zCUzJsXpITheDojDRocgGkBYVKsr4Wh4c6JOIGtIl8UT4lV/
	 YUSw2GYpkB5odDQHxTQsX65vcm0LGerhXAj2P6P+vRHe8MGd2bPSz5RvR1FWpBY/ws
	 Klxw16P8a5bwJQs+IeiOpKI1hUDeoCLtyKfVpFHZCuByWzflcS+b367vXTPp3NUsQJ
	 Htecmpn3gbGO0lxvjxj0OOQJAGdBfYMhfRDjY7pJeWThYAce204x8erMGIcpKVojza
	 8oLH4nxOtsrKC0Qmb+bY39aqqUUXP5lZn7vQXCICfEzLyMn/Qd0Qc6NGw3kwvd0k4o
	 7hXleg5rc+9Cw==
Message-ID: <sashiko-outbox-204833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: Fix mmgrab()/mmdrop() balance.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ingo Rohloff" <ingo.rohloff@lauterbach.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109103714.4000-1-ingo.rohloff@lauterbach.com>
References: <20261109103714.4000-1-ingo.rohloff@lauterbach.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:41:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> This fixes commit 5eb5c72c72fe ("USB: gadget: ffs: fix mm lifetime
> handling").  The problem is that the previous patch calls mmgrab() for
> reads and writes, but it only calls mmdrop() for reads.  So with each
> completed async IO write (via an USB IN endpoint) the number of mm_count
> increases.
>=20
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109103714.4000=
-1-ingo.rohloff@lauterbach.com?part=3D1

