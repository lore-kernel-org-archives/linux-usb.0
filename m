Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920393;
	b=PChWcWl7P8Iw2ZL3HV29JUcHeZ03CZwhModYayZfbuwISp/baz5oBtQVqlSXu77KdauG
	 iT8gQda0/ng8NRqWKkK62ETGfCES5xa58DozRRB8FAq04WE7u89HSpFs9CioQ8bmS00sT
	 M+lj23BSENMqA6yCsklXsx0HJHfwlWazpByazvnKPHkFqhJYAMxls+7MYZh3PGhfg2SXF
	 hOWGgcMB0DvJc0pAiVJYUYkduilKczV1hYVfsqCITLDQ4jjjAjUw1rwGj3skoGkeWoZKH
	 VQibXOeoMKxCIbhltooH142s1HiCQXqkwvTZ7kH2/T4dBeYrn6TkNrRLJ2tGW5zzPVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920393;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BgjWu3CkCdNkTH3vBECtBxsp9TMFBjVya1s5NhN1+5g=;
	b=32W4B8jY141W+ShbIdtW2+FRVyfUpWSo0ubnrvVv+qtChcYK1ZO7DDTTxZHC09vyyfWg
	 yuTHg7moMnkYL+BTir9afLJT8zemm2kuyg+MMyONs18TWKo39xPWqcfMm7BjhR4yxq9eH
	 KybDriYGvBizUxHquo3ZFSShrdXmyuCh5CAxg24+glfNsHaidrxQK3mroURdc1TpjZKcY
	 0X/9pneOANgbtqiDkKJBfqdMNhyts5N0mPgW+wnHLW/TmQ8gtynnxtHwpjilCBgGr0jFy
	 38wT2FNoMnNLS/bAQguSJHZhbCZ4+qDxxJCMW56jEClzZsRJQ8h0posMCy+P1VDWtfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VR9z16vj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE14606A33B
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VR9z16vj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D601F000C4;
	Tue, 17 Nov 2026 12:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920393;
	bh=BgjWu3CkCdNkTH3vBECtBxsp9TMFBjVya1s5NhN1+5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VR9z16vjj0R6rfnd282MtOe6B0iOSHrjXJS8VfC+4nOLC88KyxNmCpz+sI2wCYK7A
	 r7FTKsSCKu9XRRIkbX/UBEM6E8FrVPDq2X2y/1ygQi8wTdzSoCGVSnBFLZAURiR9H+
	 87llvb/XEOeKLkdP6F+dZ5CVojXv9+H+G4HgZ/sB+ZcMHlJiWHW+RNJXWho5h4igyw
	 mhcqjnu+zBQvjIqSm92mwXFqW1ODiifWC8DJLODjz8oPNs0minUIkUMLRmMXAaGk1w
	 oRILBiFDNWlH5iRTG0Q7fzkvtlNte3k0RGXNV52dH5bsRpctRVyuGG6G7azRw6+UGp
	 9IQ7oE8BPDPIg==
Message-ID: <sashiko-outbox-218822@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] usb: gadget: f_hid: fix report_list entries leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117125051.5646-2-shishunbo@cmss.chinamobile.com>
References: <179486710796.2938203.13522037990167268712.b4-review@b4>
 <20261117125051.5646-1-shishunbo@cmss.chinamobile.com>
 <20261117125051.5646-2-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 12:59:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Each GADGET_HID_WRITE_GET_REPORT ioctl for a report ID that is not
> yet in hidg->report_list allocates a report_entry and adds it to
> the list.  hidg_release() frees report_desc and set_report_buf, but
> never walks report_list, so every accumulated entry leaks on
> function destroy (e.g. when the HID gadget is unbound and the
> device is removed).
>=20
> Free the entries in hidg_release().  This is safe without extra
> locking: at release time the function is unbound (the workqueue is
> already destroyed and userspace has no way to reach the ioctl).
>=20
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IO=
CTL")
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117125051.5646=
-1-shishunbo@cmss.chinamobile.com?part=3D1

