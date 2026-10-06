Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7B13DD51A
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303779; cv=none; b=FmEODwLeym2W4wLnO3a5eyNpCL+f+EzfxcuY850LHyKQjGFk5lrkBw+iha7WPS8XPhVC1KXDM/7GlblhFQVdTp6CHbdhEABby6XlojNTr0KiqR4hm8dMvaKcssUdNtc1meJgWiSzVfmOYkENnc/KICQoh8LxROYhiyoH27Oeg3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303779; c=relaxed/simple;
	bh=xkpcLrLM8UBaxGJeyxOFVA77Dsn0rrVH/GAREbs0VMs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qysYWqGgjyRbvakHnnK5eM6FJSlIpKZhtiudt+/atJ/fvB3DF+/TiFatt7mumMad5n+97jAGHge1dHoR3nyk/y1qxJrhdiu1QplJgcOoJ8NXlpC4VrRSqOeNRNvnGzfb7b88FOPCkEZdGEmUTEICauLAFGr7JAnhR3poT69oR4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGjUFRhn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGjUFRhn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0AC1F0089B;
	Tue,  6 Oct 2026 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791303771;
	bh=xkpcLrLM8UBaxGJeyxOFVA77Dsn0rrVH/GAREbs0VMs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UGjUFRhnVW2fXgWytd4ud4Rak9kSxvE0HfvzCWRoEqfjI3/4TyoGb/S5i1sn0wy7G
	 GrbtsBaQpuobt1YHy+usBrH7ZNEYcQEIG/IA8YUcK/92RA/GYC27OEGFqtoX2JlKy7
	 RJnSd1M15OpeLRS/kt/7vV6B44c6apfAbKfyjPKmJklaXjPOn18pUs7pFJD6qrxL/m
	 ab8pPp1mi6RsHTkmaLA2twX85lUcSAE9kwTypzepomlI7IuazZV30dlzP/PQDjE8Lq
	 7ZsIoAwDeTzUlJIbAQHiH/E52VX6SFr0q5CRaf2BFLLym+k3xKtpkJjAdqh45R13mJ
	 Z7VUUkHIjXebA==
Message-ID: <sashiko-outbox-162248@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] usb: xhci: clear stale bandwidth data after
 hibernation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Niklas Neronin" <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006152427.3735383-2-niklas.neronin@linux.intel.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
 <20261006152427.3735383-2-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 16:22:50 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Controllers using software managed bandwidth accounting maintain
> periodic endpoint bandwidth information in struct 'xhci_interval_bw_table=
'.
>=20
> Each root hub port owns a bandwidth table and a list of TT bandwidth
> domains, where each TT has its own bandwidth table. Virtual devices
> reference the bandwidth table of their current bandwidth domain through
> 'bw_table' or 'tt_info'.
>=20
> Historically, resume from S4 re-allocated the entire xHCI driver state,
> which implicitly cleared all bandwidth accounting data. After the
> hibernation resume path was optimized to preserve parts of the driver
> state, virtual devices and TT bandwidth information were freed and
> recreated, but the root hub bandwidth tables were left intact.
>=20
> As a result, stale bandwidth accounting data could remain in the root
> hub bandwidth tables across hibernation resume, leading to incorrect
> bandwidth calculations after devices were rediscovered.
>=20
> Fix this by resetting all software bandwidth accounting state in
> xhci_rh_bw_cleanup() so that resume starts with a clean bandwidth state.
> This includes 'xhci->num_active_eps', which must remain consistent with
> the cleared bandwidth tables.
>=20
> Fixes: <2a70e5dc0301> ("usb: xhci: optimize resuming from S4 (suspend-to-=
disk)")
> Reported-by: Harald Judt <h.judt@gmx.at>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D222071
> Suggested-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
> Tested-by: Harald Judt <h.judt@gmx.at>
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006152427.3735=
383-1-niklas.neronin@linux.intel.com?part=3D1

