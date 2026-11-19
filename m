Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095916;
	b=UJCmA4Sl4uwr1BfnaVO5ip6nHQsX4sem7HmgJx3tVi0UqAnWg1bQs3uCIOlARixZ6Q8B
	 v85vJaF5jY/xF3FXVMOIsvVPBez/oTuUOCPS5VuG5nt0PWIXGMrPod9fxueihxx/cVrSd
	 I7BubVo+aQXXJvw+RJnO+MTsw84pbURdaDxdBrorJ2BXsIiVPhoixxNtEOJc+9bejVJFA
	 cX42VhzV2U00Kjk6Q0pFK4T62ItGAIN01jBNg6TqZruTZFBG3pD2LDjtEPmHM+N+xlFKM
	 Gfmb7fCX3YDEXX4hq/+sBBNHwKkoVPD2jrgiexQYG9jpN2puIg3oM5vE54AoYOzkRkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095916;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BBKCC18cb3lSCjOjYYezTt+qLb0+mmV1F6WhhDmpfsY=;
	b=xUBSeHgdh5G2pda3jNkm1L2bs7AtKFchBu8sQbRJqBuH/mbaIWQ3wjJzIkkimQy4ABPF
	 mW2m+oaNwLHFojRQ0MuYeRxIXCY+z7wzER/ppYVcW5Q0m68Jd1CgqZtmYl37uVnZP5IjK
	 eZ/cJAvnRojU4A9sfF3uQZlKk4nmJporG9r10jFsKOxBPKS7QxCi7xdh/hc3bk84+Emuw
	 ub+P4UlZ1afOIOl8r90mYFlUCpaBLPpr0dULhDEu4JwWKTALv9mwA81ffHARB9eChwDVc
	 3BJFS53RVA5tvS7qmEThbji8jV7KFrb7VozE4OsQuAJ4crc7qW0YZeL8fDlFM57ZHMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RCqhpzQc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3936E60A2611
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RCqhpzQc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991C81F000C4;
	Thu, 19 Nov 2026 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095915;
	bh=BBKCC18cb3lSCjOjYYezTt+qLb0+mmV1F6WhhDmpfsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RCqhpzQcDW5DxkuKMOlp4GqOxIuzLGe5iCDFCualFgmmcUeCT4uIQYNOtDU6YgsNp
	 uKRI0TJ1dST/uvBEcVMdXo8yCL2YM77T+keN+tL9eI52bh7Xd0waT5yIZL/ivknPjp
	 4HVUTHVJKRy8iN9Aj51gkv14pRx/SLf3PSWxtpNi12ZvAAWI3dUV0kUbUUzKEasxS5
	 csgMVYa7jvgmhXSlZhnDI0Sh+zVbQlZ33cQ6KuMRLKjM9eEUphP3q1NccBQAYs6oGW
	 DWu9E1D3e0p+EhdxXUPImo7sJMDQcRd2LstDVOg7qiJgjspceNgwl7PoCdOEycEaq/
	 vGSY+8RiKX/eA==
Message-ID: <sashiko-outbox-223204@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] usb: chipidea: usb2: add SpacemiT K1 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-b4-spacemit-k1-usb2-v6-5-4a9add848728@linux.spacemit.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
 <20261119-b4-spacemit-k1-usb2-v6-5-4a9add848728@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:45:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add a compatible for SpacemiT K1, and add platform data with correct
> flag since the hardware doesn't have internal otg register support.
>=20
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-b4-spacemi=
t-k1-usb2-v6-0-4a9add848728@linux.spacemit.com?part=3D5

