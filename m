Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DF83264CE
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540618; cv=none; b=GdzkAX8hbeMLphqb1pI0iKssTRNSKAv7hu43oOghp+fPH2o3fmy1TMMHvTiOIA4LGPly/H02IdRmPfV2NK3o9nrASw2uxDukGKMDIcpXWDSObxQNJ2Gz+L0iJ+dmbSRPMKUOjC3LRxzoppJguEATXWkkI6RwAw/i+8Zc8TXBby8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540618; c=relaxed/simple;
	bh=gGp1hzeoPJlSq2rhnyUyGtl+2d1z4rJiymVHufb/RWI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gp98SdHbCdBjlnZ0Ex5zkChQDPu+sgY4YVXGTG0k6Bi6HYsrmP/zSB33b1F2J286Jp48tKsTbkLv+lDHHOXfMR4Gdgams7hsbQNjz0mZLKwBu06wZ3wHAlp7i+nxi+Z65kAfNX/gB/kL2sHyfWrUwtnJduLDcpj6zA+W+vQ+hx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e33FsgLl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e33FsgLl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EA91F000FF;
	Fri,  9 Oct 2026 10:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540616;
	bh=gGp1hzeoPJlSq2rhnyUyGtl+2d1z4rJiymVHufb/RWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e33FsgLlguXJ1AqbweO+Z2mYK0DcYEOEprrwVYWah217O21MK4ZgClzr3YV0olZcl
	 sQ+7m2Doqm/jK6etohvyHxq/1VMzAhYJTZftmSlh42StyJGrC6ogSDdSdrc/gX5iXP
	 xPomxr2Y+V5Jm/C/0eqyX07N13zv+sqHw/lYPvPvpM+sqYrvXcZwBmgRlSZAx0Psyu
	 hUGdjEH1wqZmoqyZ553KGpYA2AxOqMebr1LyFHLY2tLtFR4rBGXTT7SkNc68U3bTL3
	 Sj+9Ug1izY8iFn6umeHzoctBijPwDuxYXTyHq82a0WGu5ILptoC/2ZBZ3WUeCt50se
	 Cm+RItPNhECYg==
Message-ID: <sashiko-outbox-165198@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/14] usb: xhci: Unlock for command abort polling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-4-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-4-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:10:16 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Michal Pecio <michal.pecio@gmail.com>
>=20
> xhci_abort_cmd_ring() requests abort, waits for the CRR bit to clear,
> drops xhci->lock and waits for the Command Ring Stopped event.
>=20
> The CRR wait timeout is 5 seconds as suggested by xHCI 4.6.1.2, which
> means that if the xHC fails to complete the operation at all, we poll
> with the lock held and IRQs disabled for several seconds. If any other
> CPU tries to acquire the lock, it will spin likewise. IRQs get delays,
> drivers log errors, tasks freeze, it's a mess.
>=20
> So drop the lock earlier, before waiting for the CRR bit. It should be
> safe - the sole caller sets cmd_ring_state to CMD_RING_STATE_ABORTED
> before calling us, which will prevent others from ringing the command
> doorbell and interfering with the abort. Queuing new commands during
> [ ... ]
>=20
> Reported-by: Pedro Fonseca <pedro@fonseca.com.pt>
> Link: https://lore.kernel.org/linux-usb/16f65081-5a3c-4c30-9811-9017796a3=
373@fonseca.com.pt/
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D3

