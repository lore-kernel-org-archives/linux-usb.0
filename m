Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D4838BF7A
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516429; cv=none; b=CGgPHgCwOojIMYn4b/bHuRgtzjrd+sjozPd6rWmezGsVnpstlVwP6ZDLVEhvSQipCkksSDbnDTUkvHJlz5k3USKTci00GxaIcI+ITdJtg111WTSd94VOgF+uyn+lhQcP/r3mt/5MqZvrq1A6W/hgRLJ3CQoN06sMPd5PxfTwTzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516429; c=relaxed/simple;
	bh=L/SWrPSshMf9uQrnpAkWAUF5pj5OXjfldfEd98flZns=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=L0lG7OnJRh2Jg6FKdkYsq6sBYKr3Cg9fecA9UaUxoRwKAOuPITdKF/Go4+tIscYWFdhbSZ6clj7mdDFKm9MpS4tWwdxEj1O8/WVQXMXxAMlQYH2LVc24de5/DS/UoCG+/MTu0MDlXB8HJ6adm3tAHXOvSDHiNBTxR7pedCN9pEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtrLg9sA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtrLg9sA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7396A1F000FF;
	Fri,  9 Oct 2026 03:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791516418;
	bh=L/SWrPSshMf9uQrnpAkWAUF5pj5OXjfldfEd98flZns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KtrLg9sAzLZ5j4lzuT6zbwz0UmJw9j5DXwOI2PU0Wrp/Tnb9DB6Zo83o6nvK2SBgs
	 l0znKnSZB/xKb7UM2w1KyeMiHcKF43jhoc5tGMvfo2Azwhd9agKr+rIgPlBuHEbBER
	 mux9Sy/MBDFVHMcMdnLok3WaW75fhJnZ4xpXv17EwlcB8an17PKHBJnHudE9LRq4BE
	 ERtcpA6bwE7ezKlGBZTQrFH3kJqNSCGueR6bKxZ4XSaKHeL1Fp/gBVVPjxVzgl1wcQ
	 8NTE5Or1beS9jaPYfdk6PamQ561XmHCvUrhYSf9YGLyYT6kBkI4P0jTG6xZsHevqyq
	 VcJ4eeTK3sjDg==
Message-ID: <sashiko-outbox-164759@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: pxa25x: mark the watchdog timer IRQ-safe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Runyu Xiao" <runyu.xiao@seu.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009031318.1122589-1-runyu.xiao@seu.edu.cn>
References: <20261009031318.1122589-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:26:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The PXA25x UDC reset path runs from its hard-IRQ handler and calls
> timer_delete_sync() for the watchdog. The timer is currently initialized
> without TIMER_IRQSAFE, so timer_delete_sync() warns and can deadlock when
> the reset races with the watchdog callback.
>=20
> Mark the timer IRQ-safe. Since IRQ-safe callbacks run with interrupts
> disabled and remain so on return, remove the callback's local IRQ disable
> and enable pair; local_irq_enable() would otherwise re-enable interrupts
> before the callback returns.
>=20
> Fixes: 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009031318.1122=
589-1-runyu.xiao@seu.edu.cn?part=3D1

