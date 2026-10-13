Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B66475324
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885600; cv=none; b=qBkrQkYVRe8qWAbMTudGW96Dd57RSVuzmy/3ksISuXwN0BIFqlk6Ong5FKn7xDc9cOqB0KmwbSLBt32nqS3H1NTXh0ireHqy5J9SQsDAL5frYR8BpVZKpDhupQCbglDk0oyWm8K+GGuw6aikfOrnQNhK59DMs/yZhQsK/TR9jOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885600; c=relaxed/simple;
	bh=E5bVetgP/OQEgsaDfH8AZoUDupJjp3UcOGW3sh5a/NY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ta+Az2gGFXfgeOGS/vSQqoQmiRKfjibZh/0i2tSm4SPCDrwF5HizcvXrhT1tGxaJH4+nHTfwoifZpoy7wuW70gDz/C35av/+NL1JOyuMiCb8D7VnOkpxZ/l+e25NKa0+4f2ZsxCUGdk2gYBXF3M1ZOmZc8VFVZSv1q/ohkYM3zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoDNaPRz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoDNaPRz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD9B1F00898;
	Tue, 13 Oct 2026 09:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885599;
	bh=E5bVetgP/OQEgsaDfH8AZoUDupJjp3UcOGW3sh5a/NY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WoDNaPRzsSgnYvQp+iFy+NtqYMqRMJKhmASuTrb4kn824ubdY6jh4UWst7+vKktN9
	 nw3KtmdzSIcQVx/Cx1oodrtEIBMOALDjXPrcrjzVv879Tuz8qIxQwZoPgOY+4jkpOr
	 L/47TucBmOmHqOYf0i2M/aSwGPVs+jVGD/zKXgR2SIhcLfDebkxkseqj/WSiKdBmn4
	 oW2c4L+ZRRrVIUXnlXFL36TUVrecXoADaCWlBSP7hEFy3BIz/GAt66nkVu98LLEyHA
	 vHkJYf3Xwj6OfWULX7wDNKaKeY3VXih4XISyL186Dln1u+MUDS14Xg4d/d9BeRr4hs
	 uwpBW1XZOvjow==
Message-ID: <sashiko-outbox-169426@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 6/6] net: usb: r8152: Move long delayed work
 on system_dfl_long_wq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marco Crivellari" <marco.crivellari@suse.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012095452.135828-7-marco.crivellari@suse.com>
References: <20261012095452.135828-1-marco.crivellari@suse.com>
 <20261012095452.135828-7-marco.crivellari@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 09:59:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Currently the code enqueue work items using {queue|mod}_delayed_work(),
> using system_long_wq. This workqueue should be used when long works are
> expected and it is a per-cpu workqueue.
>=20
> The function(s) end up calling __queue_delayed_work(), which set a global
> timer that could fire anywhere, enqueuing the work where the timer fired.
>=20
> Unbound works could benefit from scheduler task placement, to optimize
> performance and power consumption. Long work shouldn't stick to a single
> CPU.
>=20
> Recently, a new unbound workqueue specific for long running work has
> been added:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0c116737e972e ("workqueue: Add system_dfl_long_wq =
for long unbound works")
>=20
> Since the workqueue work doesn't rely on per-cpu variables, there is no
> obvious reason that justify the use of a per-cpu workqueue. So change
> system_long_wq with system_dfl_long_wq so that the work may benefit from
> scheduler task placement.
>=20
> Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012095452.1358=
28-1-marco.crivellari@suse.com?part=3D6

