Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455919;
	b=BLYLIL1d+34ICPxyn2gF/469KO4r6kGpFBClzvHMHyhts8uI1Ownoph+ekw8BzIR1i3o
	 34k6aX22XmK4c239gRL+MBT+Nlk86BU5sHEeITENCsFkHKEOw8EQy+GQFOSPntMIWqQkK
	 i9wgEHjlLvcaa9DhGnEdN2ZtSWSpRfPnq9XkcbFt2a6LkkhNldlPsyEeTE2tMMUrto/Ua
	 KywiH/zowuTXR5IcUtBImfL3rytVuqDgsKw47M0oahiLzGUia9YkZ6K/FJuQpMmxQ0A4T
	 Y4gc9TlTEElIX1Uv+2TuKmiSdVDAIGEbUxwuHvJPmMtiZK2TLyrfXHKzy2UDJM6cIWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455919;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R7imVLupuPzZ7T4rXokect2tZryxXUM60jv4qmM6KKs=;
	b=o++nEEOPBode0ct/M7UvnzLyJDDsSclelt8HQF78TjZ5Mr2oVW8kIXKp+KH3IFIbWIwJ
	 edlonUADgC4/9uPYp244Lw3XXUZjXsPthjGzd05X23T2qt9wwXcScEH4ubJvE7GELhSvx
	 6T1h+o74UG5nJYfgGSEGvkX2ruwt5DI++TYyqaLHR+pHjlVk8wJ1ePMoYxtTXxFH5iHad
	 +qLkgCJ2gc2cADB+5VKRXsdrccvBElEBrBbd8ZUN+6ngbYwV8ivdzKhWKvcKdSa3MueOg
	 37svS9QkZzcOsfoUcqrs7lUgTHbcPRASYikS+vUJnC9969/hutOBFotoZu+OB4fG7aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvnYfVwe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBC3606A325
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 00:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvnYfVwe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E06E1F000C4;
	Tue, 20 Oct 2026 00:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792455913;
	bh=R7imVLupuPzZ7T4rXokect2tZryxXUM60jv4qmM6KKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GvnYfVwedXPW0MftOQfyLs1IgJuPXH5sMeiauyCGkONr+zJTf5f9QZSK3W8h2XEE+
	 YpP11LasN4eZiKjjQP5WZ7ZD6eOKE1MLp6J4PCLnbn7FRRLgbyA/mwlIxp4TiXtU89
	 E4DV6jVDGfnLEORcHqzbOCW+lxPkossJlA7qDz7rkTh7TEriHh3WPF9VUgP8CuaxIM
	 vzYUTCYHblHfI/iitUFCLD1+y8XbkNEAHP15PDDX1MMggnYhq2wiDFnJIgVsdsDY/9
	 uDV1fhR7dvl1bkGfeoAyqIUZBe3IK7AXqpcSCrj7DRzyCiplwlgqvT9Uw0wciIc1pc
	 yDeFITdoWnW4w==
Message-ID: <sashiko-outbox-178380@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v4 1/2] net: usb: lan78xx: do not update statistics
 after a failed read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Jie Law" <law.wei.jie@gt.tech.gov.sg>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020001621.2920-2-law.wei.jie@gt.tech.gov.sg>
References: <20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg>
 <20261020001621.2920-2-law.wei.jie@gt.tech.gov.sg>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 00:25:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020001621.2920=
-1-law.wei.jie@gt.tech.gov.sg?part=3D1

