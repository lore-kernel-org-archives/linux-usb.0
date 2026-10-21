Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543685;
	b=GlBg9NxO7VWc/OVGRj5sj8HVuwxsBH5e+z6XR6o5Zdqk261f+HzClenNQ4HXZ/pXFefC
	 ZSSvWXV2YJ8UGo2IFvqgxFbx1LGQ1lRmmiCzvJJ+RSAFWF2StItFYQL+cY/h6QukDV85E
	 tlIDaHFDe7lOUBdt52BSeLpWUQXA5iOBh6GmKaEmomZNRs7/Mo4hHNXAR5nXpd+TohpSS
	 VbELWF1VJDCSs1X9wnqfN0pXzZuHNJf19OmBiF9S4V1PSnKB766RB1Cw2j4q43tiSciCO
	 RwnNX8zQSzIxIDNtn/CSyZvon0JZDOL5naSpzO0REiQMQ+naKcfOg9dCMhtGo1iuVKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543685;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AcPwb06EeXH5PBNlMnUgLzO9uZrjn+KGQ/T+qbZFEzo=;
	b=RM60DF2ABbw89AcJ/bPqZiBZU/M5jyF4f9XWRCUIvTV+WTBU7U3YQaYdPliuWfdUlZGb
	 ade0YeA8fXaF434IOJ80GU69fRv6n6YN0PdP8BHFqCS3d/oUcKA/E9BFBNxBtg6NWwKZj
	 YZMGOASr48zf3BogKkLysuJT6xg83clkwgEYlMWqsqAuuIeOuotEj3st2punLtdi5jM7m
	 ptpWCVIN3JPjaazx8q0DNLIcZxt0ro0lC6DP8TCxdV8+aYj45SENfICbC0TtUwjsC8JMP
	 gilKiswySqcUYhQIDaE0wt6Ul/6QWyolkEPVDh+tchp3YMNc6CX2+ZZliswMq9dG+6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVKQ1DOz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC843606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 00:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVKQ1DOz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50D11F000C9;
	Wed, 21 Oct 2026 00:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543684;
	bh=AcPwb06EeXH5PBNlMnUgLzO9uZrjn+KGQ/T+qbZFEzo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nVKQ1DOzm08qhj4r/aStm+KinhDdtKe23C3CQM9R9F4TQK0bWUnCvuZogc0ibQKaL
	 WXnIVNpn3kgH0UEmg6r7s0unu72ClZJVTESdGPDE2dPban1kDBZwQSVqjEra3C9TCJ
	 xtDJA3lwS4+ZWD/5fzlwRfaw2n/jnza7nfnMHggH1+qSJ4/wqIQL005PscimgJCV9U
	 bVzqcXW11EVrEAHRTYO9jZKOR5rXNJsVZdk3UyE1sHMVKBG5iXi6qcAe8XIcE/7ISi
	 feCsRywqZt5gz4+vzVxMTNzKIRvYqtfwjkGwDsb0tdiICGmQagg2h2WvmYUnFpD1Km
	 p5J66fBg739HA==
Message-ID: <sashiko-outbox-179647@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] usb: dwc3: gadget: Issue no-op Start Transfer only
 for stream endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <227e97e30d26a017c92d7008a8633c01f955d088.1792542945.git.Thinh.Nguyen@synopsys.com>
References: <cover.1792542945.git.Thinh.Nguyen@synopsys.com>
 <227e97e30d26a017c92d7008a8633c01f955d088.1792542945.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 00:48:04 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The function driver may re-enable an endpoint before the End Transfer
> command issued on ep disable completes. The no-op Start Transfer issued
> on ep enable then fails with "No Resource".
>=20
> Only stream endpoints need the no-op Start Transfer to initiate a
> stream. Other bulk and interrupt endpoints start their transfer when a
> request is queued. Skip it for those endpoints, and move it to a helper
> to be reused.
>=20
> Fixes: a97ea994605e ("usb: dwc3: gadget: offset Start Transfer latency fo=
r bulk EPs")
> Cc: stable@vger.kernel.org
> Reported-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> Closes: https://lore.kernel.org/linux-usb/20260227121236.963-1-selvarasu.=
g@samsung.com/
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792542945.gi=
t.Thinh.Nguyen@synopsys.com?part=3D4

