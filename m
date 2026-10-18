Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63FD23395D
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 06:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304790; cv=none; b=cd5gX/HysUdU2gtA6nfXsRwxp10MFz4xs9aBk2HUg2s5H7Avqpv+u4QQeHDGYLtqa/shknWidXsbsY82ERItN7X3qhN4noXQ42Kudw6Tjp3VhW0NOBIqxijwJMdBOlqqhrYilCmLGobKm3dC/Lo3gEM3+5oQLC+xma1setVGuYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304790; c=relaxed/simple;
	bh=5lEGFctmt++XwgN/LCnPX1S6fvajXMELUsCotqEWmCA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Q1fiVI8UKAmlRkfuc/tfR1KOe2l5K/gyblawsgc3BYhbW1xI8SWLKh/LzjJiNwgygO2J3KFgOupmOskR4G1fvgwg18ITMiKorV6B7s53Wr3SVhgiu5fAEeZj42xCI2wKFQNMXFqKb9ssAn3hRR4bB8yOW4RvwRhm8rznlZbtJfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=If0wgCzt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="If0wgCzt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DFD1F000C4;
	Sun, 18 Oct 2026 06:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792304789;
	bh=5lEGFctmt++XwgN/LCnPX1S6fvajXMELUsCotqEWmCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=If0wgCztGtEEdIDvxXOaJZnt580+c+KVypD8oiSZwwmMl4I7YBuBO5eyS2Mu5Q4Re
	 dodOmQycmxChHXaJAQR+qNDas0dVExx5oCsNQBpdtFST5ljwywkDBXx3BSGIXYaroj
	 6Xcu2/3ZHANQL0q02UOm2Y9bzA/o5iUlWCEnItl55a3V6zrClEX30ijbSosX7sPcIH
	 Q8sDo7jEj0+jJd9WVFBcjSLacgYtts4mmegh0G6XuzCdT7QIA8bCNQ4icO1kHaQjH0
	 uIG7Z/5tvGilq14imRvrhIY2tSThCaUSYZT7shA2QRMYTreVOwtiq4puRAcCpaNmLB
	 YTYbcHcFMNk6g==
Message-ID: <sashiko-outbox-175988@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3 1/2] net: usb: lan78xx: do not update statistics
 after a failed read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Jie Law" <law.wei.jie@gt.tech.gov.sg>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018062419.21921-2-law.wei.jie@gt.tech.gov.sg>
References: <20261018062419.21921-1-law.wei.jie@gt.tech.gov.sg>
 <20261018062419.21921-2-law.wei.jie@gt.tech.gov.sg>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 06:26:28 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> lan78xx_update_stats() reads the hardware counters into an on-stack
> struct lan78xx_statstage. If lan78xx_read_stats() fails, only the
> rollover check is skipped: the counters are still recomputed from the
> uninitialized stack buffer and stored in dev->stats.curr_stat, which is
> then reported to user space by ethtool -S.
>=20
> Keep the previous values when the read fails.
>=20
> Found by code review with LLM assistance. Tested together with the next
> patch, which makes short reads fail: with an emulated device, ethtool -S
> then keeps reporting the previous counters.
>=20
> Fixes: 20ff55655a93 ("lan78xx: handle statistics counter rollover")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018062419.2192=
1-1-law.wei.jie@gt.tech.gov.sg?part=3D1

