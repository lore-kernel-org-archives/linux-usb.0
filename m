Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8274718D4
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 12:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634950; cv=none; b=UAGLNnjEZ2jKsKk0o84en1Dh7/c4XKHYEjuj5paxOCYmwwF8tcMVfLeJ4E8mtc94a/5RB+do0Psw7/TPCPrTHfxSzk1NKZxYWO2BMT6dttSqzWMpwuHAChkuyfi+4zCjha4TxTSCBQjL1V/RqX8ZDWldQTrz0cI296I2Q61wh38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634950; c=relaxed/simple;
	bh=yQd3rpD+YM04mxZ8UUnFlAnn+jllbBzATcisqG747KI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lsWY3zKVQ79EzMsYeqrzaJ/QSn3M5jBM6LEpF54GmulBFagLpUbW+XCtFfi3RaJU8eD0c2Mnx0cbQJbP3bgR88fZNzP2hiWFSStAzt4zZaEhyeOnYg0A51ie1kd+vvIn7Sa5lZOi7IzRG5WswBq8bk8BPcuajnewKPNDAa4qiMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEg52Y/6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEg52Y/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054AD1F000FF;
	Sat, 10 Oct 2026 12:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791634949;
	bh=yXO2S0RQXAQO+4rMLs91wXEhM0dMCeTC60+5ScsYfYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lEg52Y/6yBahQIVaNy9RH3HdP5LQd8PgnfAbpGVkqv83GauZ0+YaF+BXoVu0LtUzb
	 SdztK2nMpTVxkqBsRbegDqjHkFPpeHBagTc9N954XIErj8fe8px5qREfVVjciDzYQo
	 JPovRv287unGlHqd9gIdx1T7f3TXZ4Tyi76cQp65CbGPynSyX7TvVLG3RD+7QuQP8n
	 0X5kQo/r8PcJ18AAR4JMY4vjl+Zz620d8dOaEnxDK/kePqgGx0z+By/jERbcBEVuLY
	 94PHeR+SXI9SAka2Un4Wla4BgEvmjueSIvI5IafqD6KaxjKt4tftgSquSSUi9b3JLF
	 hmVonAUSwf4WA==
Message-ID: <sashiko-outbox-166517@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Stop a power level change
 notification storm
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Vornholt" <dv@etik.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010121026.84844-1-dv@etik.com>
References: <20261010121026.84844-1-dv@etik.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 12:22:28 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: typec: ucsi: workaround breaks power level notifications glob=
ally
- [High] usb: typec: ucsi: state desync on ucsi->ntfy causes infinite inter=
rupt storm
--

commit 77aa902efb14b4a8b70e32dbfbe471a17454a00e
Author: David Vornholt <david@vornholt.online>
Subject: usb: typec: ucsi: Stop a power level change notification storm

This patch attempts to work around a bug on Lenovo ThinkPad X1 Carbon Gen 13
where the controller continuously signals a negotiated power level change
without an actual contract change. It stops the resulting interrupt storm by
disabling the power level change notification globally if it triggers 10 ti=
mes
in a row without a new contract.

> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index c1450639c7956..f2677875ad1e8 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
[ ... ]
> +static void ucsi_pwr_level_change(struct ucsi_connector *con)
> +{
> +	struct ucsi *ucsi =3D con->ucsi;
> +	u64 ntfy;
[ ... ]
> +	ntfy =3D ucsi->ntfy & ~UCSI_ENABLE_NTFY_PWR_LEVEL_CHANGE;
> +	if (ucsi_send_command(ucsi, UCSI_SET_NOTIFICATION_ENABLE | ntfy, NULL, =
0) < 0)
> +		return;
> +
> +	ucsi->ntfy =3D ntfy;

[Severity: High]
Does this disable power level change notifications globally for all ports on
the system?

The notification command configures the mask for the entire controller,
affecting all connectors.

If this flag is cleared, will legitimate power level changes on other ports
(like a charger reducing power capability due to dynamic sharing) also be
missed?

Additionally, it appears this notification is never re-enabled even after
the buggy partner disconnects.

[Severity: High]
Is there a race condition here that can lead to an infinite interrupt storm?

This code performs a read-modify-write on ucsi->ntfy and sends a hardware
command without holding a lock (like ppm_lock) to serialize against other
readers.

If a concurrent path like ucsi_role_cmd() reads the old ucsi->ntfy:

    c =3D UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
    ucsi_send_command(con->ucsi, c, NULL, 0);

and writes it back after ucsi_pwr_level_change() has updated the mask to
disabled, the hardware will have notifications enabled again.

However, the software check earlier in ucsi_pwr_level_change() will ignore
subsequent events:

    if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_PWR_LEVEL_CHANGE))
        return;

Will this result in an infinite interrupt storm that permanently ties up the
processor with hardware transactions, since the controller keeps asserting
the interrupt but software ignores it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010121026.8484=
4-1-dv@etik.com?part=3D1
