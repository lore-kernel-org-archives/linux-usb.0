Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699322;
	b=fPhtlhnXVPzEogkm6FXwxixnd+RcA82hyLMYujAVRAk4i4PYQO90A/9hMj3kTf/qkcL1
	 L2pcn/69PfNjCfH2P6bXrzcwn6yy+x+0wPkdITXyR+dKn8CejBbooXLnJoliUEC14Dds8
	 SFFBEjOSL/Rro8obUKRLsCA0jTcERWWSorBdg5yeIulkaTlnnMRWH3RPyrSvZZp9+rUb4
	 GQtSkc1beLwMw6+k+I10cec/22W1KEbK7oRfWg8klq6ull+TwzQUfdQ12FmVoODzOK3go
	 MWv6laIaibUSN/OoS992RVPjd0BVSHhF4nB9WLKh4G+T4eLCMY3sY2HQ5SICaLAyMmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699322;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aTbNsE8JcxwUZKxyLhW9FCpWmLubVVbr8FcOVOrUlrg=;
	b=QtqTvPgjG8tYX5+zUJWVYpJPvI6BeRC4tTp6q5ZoBcUCQX4TGSjw+bdsmUP1hSGdbanI
	 hxsAYGBKTqp8mkuaqcqFjW4UG2kY48VpJPeGCJ7//zCjz4qPs2NNMQodbYfvsZU+iwFKj
	 uxZmAYskTOUmomOfRKNiFn1NrZOW4CxvrcOXmPP7QgUt0r8iwTJuqH4ZQjoh7T3FD1vyo
	 GxSil3mZf88auocC0kXm7Fuj/Br68hvKNbQiC/gs4P4U+jr+hs64PpUoUlyizI3kzg6BK
	 Lsq3zyTbGdiuHllckiCStRgO8/xfHOMM5QG+WaYgWUiA7ldgvugfW3t5qzg+ZwvdBVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3M+bdqB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D0D606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3M+bdqB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93B91F000C4;
	Thu, 26 Nov 2026 13:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699322;
	bh=aTbNsE8JcxwUZKxyLhW9FCpWmLubVVbr8FcOVOrUlrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e3M+bdqBDl1KVg5An6LB30qi2JU0zsLwxEI1RaSutnIj7SOLj3J3EKIXH1/tuo18o
	 q5f2ZuPkyXRv7kzVW8QURxL8EhBP+2nViRJ+0TtMocG9Oie5Q6ZbL5u/oiVhPL+V9W
	 cPvz7NeKQHREC6Rq37V/mv9cMY+LyPjjQKIlifIx7ASs/VCtM0jfxcUEc3QUKWH/mU
	 XUs1bt/GhebJ7OTV2TtSyUsSL82Ftc3ZtrdGt9N7FutOPV8oqjzvEyvYky7OT85gaO
	 G9UtCybDKjLVi3sRp8AqNt8kD9Z4pigFPbbb9ltnprY4UrRfHViOU4HJ7+KdZG2pi9
	 kO9SvxM1ZYu+A==
Message-ID: <sashiko-outbox-235591@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] usb: dwc3: gadget: serialize resume against
 error recovery
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126-topic-usb_dwc3_fixups-v2-3-c0cc2b75c518@oss.qualcomm.com>
References: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
 <20261126-topic-usb_dwc3_fixups-v2-3-c0cc2b75c518@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:22:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: dwc3: gadget: missing Fixes trailer for commit 1ff77cbefe5a
--

commit 60d5b6f1be4788382a79ae6d53042b9cab66f822
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

> usb: dwc3: gadget: serialize resume against error recovery
>
> dwc3_gadget_resume() calls dwc3_gadget_soft_connect() without taking
> connect_mutex, allowing it to race with err_recovery_work's disconnect
> and reconnect sequence.
>
> Take connect_mutex before checking gadget_driver and softconnect, and
> hold it through the soft-connect operation. This also serializes the
> state check against dwc3_gadget_stop().
>
> Preserve softconnect on resume failure so a later resume can retry the
> requested connection.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[Severity: Low]
This fixes a race with the error recovery sequence introduced in commit
1ff77cbefe5a ("usb: dwc3: gadget: fix IRQ storm on invalid event buffer
count").  Should this include:

  Fixes: 1ff77cbefe5a ("usb: dwc3: gadget: fix IRQ storm on invalid event b=
uffer count")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-topic-usb_=
dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com?part=3D3
