Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACC9500359
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419507; cv=none; b=G020BbR2Q7qqHwSJ2JvFzze+LxAy7reHYnGV+RnGptWleTy6tRxP/PfsMVW1qaYkyHRcCUDQ7TPG7bnGxaLtZgQz329l4UBKhfzqVR1I6rMFkYH2zdzx4wbpj6dZSwy6uG/rMsDj4V/T86727HStMn6em1FtwOUjd1mcyzpfO7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419507; c=relaxed/simple;
	bh=yzi/Exl34xZr85Zp4N2ixiYqRpsiDbg7RWVRJosQO6U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OnGEASnVx3qVySi8ULHYpUr1dT6K5mxh3fsGZaKgwEkKP54OGkeqY0KzYh/yGznTv21WsQKWfddtZQ8zP3/Fjokhb+dE3WSeP5+cC7jaZyAmVJI+EVTBblJcjTKdzfcL2pi88KawBeekAYd91mKAoH4bnMqurmPqPN4Uhz66u7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aggZfTJF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aggZfTJF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541541F000C4;
	Mon, 19 Oct 2026 14:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792419504;
	bh=e4hbOCuddjsRgmgX24o3XzFLMw6TAwncf5a4soxyv7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aggZfTJFh9fyuqVwAr8BdNvrZhlEAIDqQh5qVzWc690SqIAs8AxIH/RNtKLrWlaf5
	 uBYdun1bH1FtLxTtZ5rWHFkm1T5wycS3QNzX0QFOnZrWB7rwLx8C/Y5u1QvWc+KoXz
	 +rUy/0JH1AAC9077E6t4Kez3mghs3wMds3bMFxQGMORfA48rBJD6mNslTDZM/0Dhyr
	 I2jkG4fA5Nlt1La0vzlVQssoIYLOookMVGWn6z7WDrTTTiK+ZZycdsG7Fn5DyMC7pV
	 wWCW85R5AUsuvbHQTEfxbd3e6orEchgYZmq8We65I4AhJpjZG9XyLIGYvOT4OLwbVW
	 RV4oV8QcplL9A==
Message-ID: <sashiko-outbox-177343@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] usb: mtu3: Fix double dereference in
 TP_printk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-102-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-102-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:18:23 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Vladimir Murzin <vladimir.murzin@arm.com>
>=20
> [ Upstream commit cfb3293c4573289f11f913611f530ea6b1926d67 ]
>=20
> Paul reported kernel splat:
>=20
> [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_set_halt has doubl=
e dereference in TP_printk: &REC->gpd_ring->dma
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] Event mtu3_gadget_ep_set_halt has double dereference in TP=
_printk: &REC->gpd_ring->dma
> [    0.000000] WARNING: kernel/trace/trace_events.c:420 at test_double_de=
reference+0x144/0x14c, CPU#0: swapper/0/0
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.3.0-rc1=
 #15247 PREEMPT
> [    0.000000] Hardware name: linux,dummy-virt (DT)
> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    0.000000] pc : test_double_dereference+0x144/0x14c
> [ ... ]
> Tested-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-102-sashal@kernel.org?part=3D1

