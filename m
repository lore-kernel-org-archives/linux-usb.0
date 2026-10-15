Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B580C5616AD
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093342; cv=none; b=NOqnrFrJ6BeYD6nq0QEo/wbJfWysgt1uDDdALWhmtfWYHUftcFvIylD6ZdzHkRfT5MMzU+/9u/tGy7SPACVbwOPL9Vr+ha+ENa7maulNSzFaknZFKRz7Ue01X1OdwXCjLdwjl8HIR7ojGcfuiytMM19oIKQogshWlvfkEYTComc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093342; c=relaxed/simple;
	bh=v0YZ5kCZWllA139nQ8ZorvNKN5hdI9yawhPTgsL0yCo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=VWZnylB7n+cbiDztHWh60eWhf25Z1XN7cAI3wYWA+/rAhfgPLAvu8odLuCrZc8QJR3ENtUF9YHgIGqvlOC6fl48EXgI/luaVcuz8jJO/h1H8Kdtrf4eoeTWaOam/dWUN9or8VH4QDqh3S4arPmFM95It5waOlCYrtFG6uuXmidM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9qx0577; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9qx0577"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015D71F000C4;
	Thu, 15 Oct 2026 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792093331;
	bh=v0YZ5kCZWllA139nQ8ZorvNKN5hdI9yawhPTgsL0yCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z9qx0577azjMa8OTr0FBdo3DkVsoMvgPV08kZ+ripx2NWVCzlawVu6SrIpOwwciZ2
	 7CScBrI4CBJ7ZPqfBICi6RqjKOzfpgJvMOguR23/BNYGHsnLdG3wlUNatm/agAZ04I
	 ZnQ6+StyfnWcHqpg6dS7TgUdvg0GGq8akGS9VD7/Dj60LNiOx1os/2oE+3Vi56ZXwE
	 jF1RC4hiJmrLDxHp9+s0/5dHxj47hYzxjrGslsIAcy7u9ufZBaPCnkuRYn8xMJ25Fs
	 bYj2dNLS6P0jbYnDmAeH6x+7zp/idqh1Af87K8OgnZH7bqzpb0LeZ0/iVwpbmYPe5l
	 1FA51kbrrU05w==
Message-ID: <sashiko-outbox-173362@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: octeon-hcd: fix the kernel-doc of struct
 octeon_hcd
Reply-To: sashiko-reviews@lists.linux.dev
To: "Orgad Shaneh" <orgads@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261015194043.1597422-1-orgads@gmail.com>
References: <202610151637.5srThc2q-lkp@intel.com>
 <20261015194043.1597422-1-orgads@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 19:42:10 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The struct octeon_hcd comment opens with /** but names its members
> without the @ prefix, so kernel-doc sees none of them and warns about
> every member. aebbc7d63407 added sof_timer without a line at all,
> which the robot reports as a new W=3D1 warning.
>=20
> Prefix the members with @, drop "pipe", which is no longer a member,
> and describe the three that were missing: periodic, nonperiodic and
> sof_timer. scripts/kernel-doc -Wall reports nothing for octeon_hcd
> afterwards.
>=20
> Fixes: aebbc7d63407 ("usb: octeon-hcd: sleep on an hrtimer for far-off pe=
riodic transfers")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610151637.5srThc2q-lkp@i=
ntel.com/
> Assisted-by: LLM
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015194043.1597=
422-1-orgads@gmail.com?part=3D1

