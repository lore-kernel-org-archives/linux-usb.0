Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE9A39A4A0
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 03:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947085; cv=none; b=tddxJzdH1O3o2nbBglstt//psaLAu+Ag9B1ptozyNW4ACr9lRFxFMNZA+X1/xMGg4vGtrKEyEq6q3Ir7VLkRVwsdwfTn537EYg1OXQWL+EN5qN6w0IVRIW4khOcU3EFqhWSRWykUUONDx8ZCRYY2CwRspYiFYUNz2zsnVHNjp88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947085; c=relaxed/simple;
	bh=Hxmz1kwng4iVz0/t36rAy4vzBecA3bQeq7lER5EsBU0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TWTvFZp5bDem1FXOPYlZi7ISgThlqg3NWSLFjPA/NS18VCdsdfQavT4MoYpOl7p2f92ZfDh3ujvap3phw7CFZoA+C1TktTgy3ABfbGT3OLpyYxKr+znQX3xddZ0Q8KBGrkMjwxj8Hznbvpw5KZ/7dlfnJGt59BOSToJvJqTpZZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHRbbqPT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHRbbqPT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439261F000FF;
	Wed, 14 Oct 2026 03:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791947084;
	bh=Hxmz1kwng4iVz0/t36rAy4vzBecA3bQeq7lER5EsBU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BHRbbqPTtrt/3aJwL0LoQodcMs9wJJJfsZXiB/p38fjB8QleK6ltsHQveUvK989dp
	 zl4jHoiaYwC+ilalia4sokQ9H/Xuq80p/yqHyWPh0FxBHxbiP4sL3WKOLffkdXNKbE
	 F8r6RRIIuq0zMBQ7ftCUuWFsAtDlsvuQtg85uj7rjL1a7KzLoUPB9rVovU91WTS2Kh
	 OmPxFJKyN9/EOIJzzJuBkC6oWg6XlZXoj6iE5PlCOoN/fooeN3mNNlKpibRb3oE2dk
	 ccFSZRp1qzfy7L4fOWy3ndw8oCoXFdFVl8wBxFE2BDnJ6T/uCEmf5Cfg7wX9IMWijR
	 qYH1JzAPCxpEg==
Message-ID: <sashiko-outbox-170752@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 1/2] net: usb: lan78xx: do not update statistics
 after a failed read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Jie Law" <law.wei.jie@gt.tech.gov.sg>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014025602.26334-2-law.wei.jie@gt.tech.gov.sg>
References: <20261014025602.26334-1-law.wei.jie@gt.tech.gov.sg>
 <20261014025602.26334-2-law.wei.jie@gt.tech.gov.sg>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 03:04:43 +0000
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

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014025602.2633=
4-1-law.wei.jie@gt.tech.gov.sg?part=3D1

