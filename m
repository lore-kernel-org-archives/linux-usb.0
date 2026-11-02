Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627262;
	b=PjlBvhLSigsd8GsPzi6DfGp8wuYGUSHpKAtPyyn7IGsKnO639vPqFHr6hS0oKp1TPHob
	 S8x6WTEdjUsy6lc1MOPmVt9BPj7WMqX3m3ar4Ff/1uTCbjgmUmLMKP7JNXQkSmpvBCC7n
	 RPm7gV5LDcjcSe75N5NvQzBvhYefjJQ+LO8MeOfFUf4DOQK6gRHqs3yK47hMwjvDhTz9C
	 lhxCyN/608hteWdUMdf/Ss3dGTX8wq7JwzZofIGKqibO12LXQhqaxZXiJp4N89+BSpYfI
	 nL+RV6oa9sDW49q93VYzaOOhAwqDMdu8nvO715SzgvTwePq1kU0OciOwUGsU9P6Tx+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627262;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9Gd8OrFDaYbXH9peZY4igke1JnP4zFt0pkqwpjNcVeM=;
	b=OkfmM2gX7ktLUNAtJRhsqq3SvJwN8zIRWGZveak99me/WT79DuzCtnmBLYlVyekXBmYM
	 fqiYK7c9aQ7Kr72PYqki7IVciQtar/Rsr7aDgOpozMVchl0oBgHVvSRV/Sk6+AdzYB4md
	 i3gCQPuzByjn40FKOm1RV/JOIWudiBMm6bRKi2hGE0GXWAskGOZ7JSDzux0NlmKjHBaEq
	 raojsDRsYsDqkexOiw5tTy3W5ckULX/IUN8gCcuhGVm22RnlUvAl4cBNKU7TjWnKgujuz
	 4P9DK7+i2j4WJ6LmWnYqviDA/LChIFv/yRilUmZ6TZwbp944N293w1Cf+8o1O4lXhbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mnd7VRlt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46549606A33F
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mnd7VRlt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CD31F00A1E;
	Mon,  2 Nov 2026 13:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627262;
	bh=9Gd8OrFDaYbXH9peZY4igke1JnP4zFt0pkqwpjNcVeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mnd7VRlta6jK5fCWg6kUDFkZuj75bdLrOi8Vbb7htQ8EW20zOpzmaM+gV+ALSSAQZ
	 wkRbBcSyQGku6D9OkDII0SE3D1FPQV8Y06dp5qnQsX1LA7ADVReY2jhFlWwL6hFdlR
	 wxdoVLWuzAWJGrGopQSJ78FS1jtcc2fZ7a2r2wWMsLNXs1mAdmK1YOkZtCadWY52mq
	 mKPheIaJfbgMa5WtYvt0ngaj6QNzRvVS2aTuRXb2BzNzpVVXvRKH3VKXVt0Wliramk
	 iH9E7+5bvD0FY9hXOWYaOQ8vfi+eYxwXx+zqCgMSdPtalEoKjOOGVbZXwkvyBJuFOH
	 7Md2phlC+iWFg==
Message-ID: <sashiko-outbox-193504@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] usb: xhci: clear stale bandwidth data after
 hibernation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Niklas Neronin" <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102134228.584032-2-niklas.neronin@linux.intel.com>
References: <20261102134228.584032-1-niklas.neronin@linux.intel.com>
 <20261102134228.584032-2-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 13:47:41 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Controllers using software managed bandwidth accounting maintain
> periodic endpoint bandwidth information in struct 'xhci_interval_bw_table=
'.
>=20
> Each root hub port owns a bandwidth table and a list of TT bandwidth
> domains, where each TT has its own bandwidth table. Virtual devices
> reference the bandwidth table of their current bandwidth domain through
> 'bw_table' or 'tt_info'.
>=20
> Historically, resume from S4 reinitialized the entire xHCI driver state,
> which implicitly cleared all bandwidth accounting data. After the
> hibernation resume path was optimized to preserve parts of the driver
> state, virtual devices and TT bandwidth information were freed and
> recreated, but the root hub bandwidth tables were left intact.
>=20
> As a result, stale bandwidth accounting data could remain in the root
> hub bandwidth tables across hibernation resume, leading to incorrect
> bandwidth calculations after devices were rediscovered.
>=20
> Fix this by resetting all bandwidth accounting data in xhci_rh_bw_cleanup=
()
> so that resume starts with a clean bandwidth state, and resetting the tot=
al
> active endpoints count.
>=20
> Fixes: 2a70e5dc0301 ("usb: xhci: optimize resuming from S4 (suspend-to-di=
sk)")
> Reported-by: Harald Judt <h.judt@gmx.at>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D222071
> Suggested-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
> Tested-by: Harald Judt <h.judt@gmx.at>
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102134228.5840=
32-1-niklas.neronin@linux.intel.com?part=3D1

