Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758907;
	b=P9Vo021im51cDySZzLAl7TsmUvKWG95OMKY+otLXxoY+9dpEPbNfre9MJMV5ZmiQAuSn
	 /Ib/ZQBvQhyWdgFcGEjdrXDew0XswDPf8JI+HCId1QnvjnHga449Sf7TszbILZw3tjkKW
	 lpZv99ibaflVwXtl1mIa/uARwb5LcCsrJisS7513p389NdMg+dMbYuCeqApoQTlQNjnQ9
	 VLfTxWv0mHRziuGVluqf0BJlyWz4ABiJb9a/w+06K+fMTeIK1bVcRa4Lkm0ebUK0dPKTJ
	 EEuDuNzdj6yd770nNupCHJezaqsrjyfZsu2Y2VDVLOFWVo/GX0Wxl9AJsf1hwC3aqpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758907;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3RCPqe0wGnBony9MQwWznYmS6NQHaPzJ0fViDiv2+WY=;
	b=MyIz977RPi0p4kdKXDMSR7FO69p9qTf4Lc6t1AtGTJm3WbVjdm+ygMyDBTP1omcaH4DE
	 66/L0Ol9vZ8dWeqcOyR1RsHo2HkNmV/uktIks2/BilHHuum6FViRddDEUKkkTDtpGcu+T
	 zqZGVVXWVuFOcYB2JlmNt7va0GrijNlJNBLzkxXcuFy9MtJY37FI/AEXBoZ2FxSvCrIL1
	 haF161V/A9ulbukGpPefdgTwR1JBGjUmU4e98NIYfWIB6+uxc+qj9D9etLAX6lFD4ocKI
	 jrp8d+fhIbXJzJK2RWCIAXQjKJP4yaol+wC0ARvpJUVccquIpfh/BA5+UvSlhXuHKUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IeacBynF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6E2606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IeacBynF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4811F01825;
	Fri, 23 Oct 2026 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758906;
	bh=3RCPqe0wGnBony9MQwWznYmS6NQHaPzJ0fViDiv2+WY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IeacBynF+NRZLHf7eHXcE8seoz7+q31LrPoJJsoWxYxo64JSEcCi+WYNBHs2ur0Cn
	 KdIyg5sSP8TIatYvy5ZId4thczMe15DTQfkT+CX1Q8OWEnzUgUIu5OdEw4zO2ZkNUq
	 trqwHx1tcqr1eeU3Q4dpaNDPEj0NmXZgj7EmQE2zg4D7FPcDfV3do4wLfPzfJlAyJ2
	 svKmgWBMLbHIlnxPWlYtUzGGk0NAoAoqP/NYHz9JFRChHyIzJvLgd2NGbj+l9tR4Ql
	 LspAkGvEjjMkPdZdcqY7Q9XgiTXBA0vKp0mP6tKTOWbwqyGwxxugYTdLPxD2xkK7Pe
	 8pioyVjwIgkLg==
Message-ID: <sashiko-outbox-182777@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/12] USB: serial: io_edgeport: fix potential
 NULL-deref at open
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023121530.186541-4-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-4-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:35:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Do not mark the port as open until after the write FIFO has been
> allocated and initialised to prevent a racing interrupt completion from
> attempting to send stale data and dereference the FIFO buffer pointer.
>=20
> Note that the open flag defaults to false and is cleared on close() so
> there is no need to reinitialise it on every open().
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023121530.1865=
41-1-johan@kernel.org?part=3D3

