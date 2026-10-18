Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77F84CF461
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304451; cv=none; b=UM3FhIy8gk215LKktzsmBcfJ4sgiXD3noLZw7NqnNJx6B0/GGqsnMBXl8aOI+v4F2mMvIFKRR2wm+8LAkjrPrAekqtqomJJWZN8YryT1rleYHi5egH3zfq+gdGwpSZhcBkDYn21tq++rxfQzWpmWUYfJLZ05v6oN2btc8tcenDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304451; c=relaxed/simple;
	bh=3GglBFp7MIfU0vMHFerUBKFudQWZysdXZ1/kKE6Jh64=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jU2kpSWcdZYDs3l5G9zJ7e217x3dYefKhN6urxTI9uEIcZN5XIqZ45YvG3mGBiOGZ9pZCDGx8oIuL8pRqKQnbjnbQgiGztAbkIbi5xW8LI/nya5JnrmlV1SCBwfQQqzQLDsgGf3Yb1DfNG38ZppgClwvO1+W28QTdbA46ZEBG1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gP2RNKBe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gP2RNKBe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4029D1F000C4;
	Sun, 18 Oct 2026 06:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792304450;
	bh=3GglBFp7MIfU0vMHFerUBKFudQWZysdXZ1/kKE6Jh64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gP2RNKBeMRlus3jLa3nkJfpfxpRIJ7ZTcBDzFL4jzhDi/YsBZ4yGyfnbdyXn4TOTg
	 +/4oz51XvW0sahXn2ALqT5Mp8G5mpPYBupYvs4MQM2AP9TMSJc1P7vE4FZCqQKutG1
	 vnHOQKVrepVwofiidxp2AEEV9QBj+9egYK/qDYmnuiIk9k6CtyFvYwKJSPpHC6qIqD
	 iW529o6XGiO6XWRp54dfX+mv0/1ci+X4ewdEu8kRHr6A+WqA+GTV8/lqDed2E/lYHZ
	 W6JGMmAaBe6gLK0u2nUzctiWMClDOELjpQw6DbSIz0Ripf5PU3MTuuBhOpfGfku6lR
	 mqXKtK+pbIOfA==
Message-ID: <sashiko-outbox-175984@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2 1/2] net: usb: lan78xx: do not update statistics
 after a failed read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Jie Law" <law.wei.jie@gt.tech.gov.sg>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018061734.19488-2-law.wei.jie@gt.tech.gov.sg>
References: <20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg>
 <20261018061734.19488-2-law.wei.jie@gt.tech.gov.sg>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 06:20:49 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Wei Jie Law <98lawweijie@gmail.com>
>=20
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

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018061734.1948=
8-1-law.wei.jie@gt.tech.gov.sg?part=3D1

