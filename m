Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64589476077
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631028; cv=none; b=jODmRwjtxOvH7V+48N7uT8smdZ2zgvGkU9gknd5bfiXUsBvIujezjTuWskUOlDMuOzLdRtRoi39PevmUXjjK5ImI9EpFlgecBTbFyNf0qqVwHBuDDg4GIT2j0oPad98iEqhUGXcINQvFG8mZw6g9UO4cd2BmROoJikRqe2bk8nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631028; c=relaxed/simple;
	bh=6YX6lmizulIUi4IDgNU7keiLWo0H+b+ydKotjJJdEGA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=t3FkIePnMUXaf+vMaHC6EghDFZjU6xGkrroqlyUDPp4W4z4ymHyL48PaeuSSoipNRH+KWf22ruQkcdZQN4Dp2LelA0Hz9GUaxyXWSa/+01Xd9VpMUomko3WVaMiD/ziOpulbMfiOXMv4HI4C2bBpdCgoJiOSbvT19zemQvmMKvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFtCox5D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFtCox5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9347C1F000FF;
	Sat, 10 Oct 2026 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791631025;
	bh=+lsfZWk+4Gno3/iuzzjcvru7P1J3DJluZVxgC3CQsZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFtCox5DVOLTWfkBTD8BH9pAzpFim57tjtDUOSFPlHjmjRmA6RuNtTAp8R+0imtpL
	 deyPcDO3aEpfSw083BZR/Rr97e8W8fAzxUfXlc7LEL3E+Cc3zXQ7pcIO9sGtPfHSMS
	 8SE0Av2hfYI++OSssMrup1OJOiPppQTlyDIlmBGzcCI14ZoDc5FohRvASSqjc6ep4k
	 t1iwYuxy2cnqEsds6dtb0ZfVeEKFsNB3aa6iMqDpXyNPUi1Zn68SDU22bB0dWo35HG
	 G3NYLEZgspCrGBSkW5yiLxsNB0sA2f9wHrGyfTV0xPejY2Vl1961FT2RV/R8h/t2Jc
	 4hrHEP4xNF43Q==
Message-ID: <sashiko-outbox-166463@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix NULL pointer dereference in power
 level debugfs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bertrand Jacquin" <bertrand@jacquin.bzh>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010120357.4937-1-bertrand@jacquin.bzh>
References: <20261010120357.4937-1-bertrand@jacquin.bzh>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 11:17:05 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> ucsi_register() creates the debugfs entries right away, but
> ucsi->connector is only set by ucsi_init(), which runs later from
> ucsi->work and only publishes the connectors once the PPM has been
> reset and all ports are registered. Until then, or for good if init
> fails, ucsi->connector is NULL, yet the peak_current, avg_current and
> vbus_voltage show callbacks dereference it unconditionally.
>=20
> On an Intel NUC13ANKi5 whose PPM never answers when CONFIG_ACPI_EC=3Dn,
> reading those files after the failed init oopses:
>=20
>   ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed
>   BUG: kernel NULL pointer dereference, address: 000000000000045c
>   #PF: supervisor read access in kernel mode
>   RIP: 0010:ucsi_debugfs_register+0x291/0x420 [typec_ucsi]
>   Call Trace:
>    <TASK>
>    seq_read_iter+0x1e4/0x4c0
>    seq_read+0x12b/0x160
>    full_proxy_read+0x9a/0x1f0
>    vfs_read+0xba/0x320
>    ksys_read+0x74/0x110
>    do_syscall_64+0x79/0x240
>    entry_SYSCALL_64_after_hwframe+0x71/0x79
>=20
> Return -ENODEV from those callbacks while no connector is available.
>=20
> Fixes: c851b71fd6cd ("usb: typec: ucsi: Add support for READ_POWER_LEVEL =
command")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bertrand Jacquin <bertrand@jacquin.bzh>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010120357.4937=
-1-bertrand@jacquin.bzh?part=3D1

