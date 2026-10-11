Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04A234C9A6
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 16:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791737225; cv=none; b=qO+SweutyQmaOrkccICU9aqVB7V5xulK44mZkPC7cvy0FsVCIqXM2/wJq9xxM0dmous+Eu0YMQkLxzS2wQsG16EG7rJVAaeze0zfxk/eurj4C8ZOjqE46eHUUwL+E94WEGzD9djA/FQ0F/jMsndTR0rEgaDxShB/jZymfSxQ+U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791737225; c=relaxed/simple;
	bh=dl1f5eXhec6381D2jjJiwpIIJbUHX+ce+eGsPnD4hvs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=u0VLwFA0j35oMwbalolMxkFRMkmmss1KC/NWeKKbq2StxVywNknWJ/ISHKYToCgb6K+6xYYmPdn6cxslhfKn+sxGBW5MUcHXr+3Ae0h8qpZ0MZ2stUMbBU454ID3X8n2RO98a4p51rYzKwWqYQTZcV4um2AAYgf1wX6zOxwPWnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kp43ni8m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kp43ni8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496AE1F0089B;
	Sun, 11 Oct 2026 16:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791737221;
	bh=mfGgEB8jcxo+MqQto9jq8yY2/9EeTd5erlBcqyomxJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kp43ni8mJ+SoFu0QPGwmJ4xgoxEExu7lTLvPB9acubqBsy6Eb17+g3Q88lLqeUv2n
	 TisK8W8mRYjEXUEL2dt8w5w5v9H0LKLK+v1PuxYefRx4eF92M+GUBE8sYqrJTg8wSG
	 JP4b9IqxU9xT6aiCZGMkcg6g3CC5Nxid9f9Y4n/i2nao3GCOVaNn7d9lV/73dYhiS0
	 CT9GCRYzcDqN8wXzjJ/Dc2QPrWFtvcTQ8c0R8eKULZqdnG9vqGZg/Dv5FwHeX1KHmG
	 Wyrxi7xqW2vz5rH92auBx2ZoONtJpo08jgCs90SrzTu5/ZVvHGB/RvLaheykfIB4I1
	 v6LOTOpPpljZg==
Message-ID: <sashiko-outbox-167319@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Kaloudoff" <olivier.kaloudoff@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261011164259.30572-1-olivier.kaloudoff@gmail.com>
References: <20261011164259.30572-1-olivier.kaloudoff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 16:47:00 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The ASMedia chip detection in uas_use_uas_driver() assumes that every
> device with idVendor/idProduct 174c:5106 or 174c:55aa reporting a
> config.MaxPower of 0 is an ASM1153 with working UAS.
>=20
> Newer ASMT135x bridges (iProduct "ASMT135x") share the same 174c:55aa
> id and also report MaxPower =3D=3D 0, so they take the "ASM1153, do
> nothing" path =E2=80=94 but their UAS implementation is broken:
>=20
> - The first READ(16) issued by sd probing times out after 30 s;
>   enumeration only completes after a uas_eh_abort_handler plus a full
>   uas_eh_host_reset_handler cycle:
>=20
>     scsi 3:0:0:0: Direct-Access  ASMT  ASMT135x  0  PQ: 0 ANSI: 6
>     sd 3:0:0:0: [sdb] tag#26 uas_eh_abort_handler 0 uas-tag 1 inflight: C=
MD IN
>     sd 3:0:0:0: [sdb] tag#26 CDB: Read(16) 88 00 00 00 00 00 00 00 00 00 =
00 00 00 01 00 00
> [ ... ]
> with the equivalent usb-storage quirks parameter (174c:55aa:u) the
> device is completely stable.
>=20
> Reported-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
> Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011164259.3057=
2-1-olivier.kaloudoff@gmail.com?part=3D1

