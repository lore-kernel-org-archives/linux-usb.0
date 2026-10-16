Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B5B45C709
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141661; cv=none; b=fKsTvwmjP5DbdOmGVSDhJFH+0hP7uq29nLPtfZfzgOsRgosfyJ0W35jvXI+QP/HUdUGzoy9uorm7I6jiR6xZAf7Ey626MUkjsdeBx1PTiiQlc6DvT8COdhQBRKTNn02XGGt2s1Vo7d+BGnw4FT3xqpPjFSToeo3w28pGwZT3HG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141661; c=relaxed/simple;
	bh=iMV3wL7q2oK4cLmx7KN2IG8YYLorsJgyV7xYvYf1d0A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ufuiCRod1eXWX+o/nyC6duxrO4pUz983nb6eyVm/55BbwlPi+W2CJKFWqnsPHQwrWXMyDV1O9JIW6631wt0ovzsMC+HWfhGH4V1+QOosMDKwHmoGh+G9rnrMx3s+9JFPni6ZFlStGC/6l7uN4CyUwlXrzjxhjFSDhrbirQmKdRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKPdHeVx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKPdHeVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A951F000C4;
	Fri, 16 Oct 2026 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141659;
	bh=iMV3wL7q2oK4cLmx7KN2IG8YYLorsJgyV7xYvYf1d0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BKPdHeVx2Qg0Qi6EXESiCDZ7AIcTIYY0dQWfgMayzVyNYQ9AqljmiZJVW9NlDJo1z
	 xUxlPXJ3YOiKig+0P9heFCgXIJCSH3xKRxcwNqkIQAIv/6/AjJaTCNEU3B4TWwlHGd
	 ZytFJVBIvX1AkX5fcVr5x/K4y+RSWdk7fpq/hiCARibhdMQbZ4W/FsanInsmJqHydG
	 l4IJ3I8a3JtBwm+ZnVZTktQZdPBvArXIWKVr1uOI9UL/0jvpEyUtrPZpgFmtwBmFXY
	 V3MzDPJMOO+QSMx1ul0zmkBlaBKUTKUl78smokTkYrS5gFxICP2U4U7PUGKvciyPcV
	 eHKDGz3Xk1/+Q==
Message-ID: <sashiko-outbox-174056@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: ehci: Quiesce ASPEED EHCI before halting it on
 shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joe Wang" <joe_wang@aspeedtech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016-upstream_ehci_aspeed_shutdown-v1-1-8440c13b5652@aspeedtech.com>
References: <20261016-upstream_ehci_aspeed_shutdown-v1-1-8440c13b5652@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 09:07:39 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> On ASPEED EHCI controllers, clearing USBCMD.RS while both the periodic
> and asynchronous schedules are enabled may leave the controller unable
> to halt. If an asynchronous transaction is in progress when RS is
> cleared, it may run past the end of the micro-frame. The controller then
> clears its internal schedule buffer at the start of the next micro-frame
> while it is already walking the periodic schedule, issues a DMA read
> from address 0x0 and never sets USBSTS.HCHalted.
>=20
> ehci_shutdown() calls ehci_silence_controller(), which halts the
> controller without first turning off the schedules. For ASPEED
> controllers, call ehci_quiesce() first to clear CMD_ASE/CMD_PSE and
> wait for STS_ASS/STS_PSS to clear, as ehci_stop() and
> ehci_bus_suspend() already do before halting. This is also the stop
> sequence recommended by ASPEED.
>=20
> [ ... ]
> state writes the command register with these bits still cleared
> and polls the schedule status bits using the existing timeout
> limits, without re-enabling the controller or its schedules.
>=20
> Signed-off-by: Joe Wang <joe_wang@aspeedtech.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-upstream_e=
hci_aspeed_shutdown-v1-1-8440c13b5652@aspeedtech.com?part=3D1

