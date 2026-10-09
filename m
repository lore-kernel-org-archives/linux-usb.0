Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8915442FB6
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549987; cv=none; b=YUb2w9CqvAtWA2jz8Bp35vI6BtBWJm2/yGeZ7JyS3FWMGF885E6frfdBRhl1waQ4HT0cgbs25wuSmJ2/1LKksjTxNkoqjZ1AUAU6Xi6PPDWo2HSdXAYQT8pKCnJH/O+EclpVG3oGTm4QDwFtoiPLBB83dgt2InV0UZ2pff/xA00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549987; c=relaxed/simple;
	bh=VpHtSlXQp4zGvugaVtPJKQWOfPmvPgdZFXQmHgwY6Pc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=I0wObNEa6IYV+C1P6ga+L7anMIbpJ31H3tAAeaa9m8Z0lfA3ewz4y4T0lCFizHVx7Mx9PnbJ+Vc2VPwNZuB2iHiv+5/8WVe7DHqDgReyWQSaiN6TNEN4I+aK925960kLaLxcf90qm+RHT5QAmzP8CwEy2GgoJL6kU9o2f3bXw5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcNnSrkj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcNnSrkj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066A21F00893;
	Fri,  9 Oct 2026 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791549980;
	bh=TrDk2kgOkGcgNxLhot0pBgQG2HT9w0vLuUduE8mpe4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HcNnSrkjB3Gv9k85sA1PHrNAra0hO1LZd7DxJFnhejUv9tZkoaPQyYEfMVsBGK4Nc
	 8bo8We8w7L7Fvcad0JerOCZofzv+nWrvWXtfDqAQfMR9VFj40DakBbLZuNmskgC8MQ
	 nDFJ1fWEMCY0CXq4V/+CFvEjdu6Z1ryzFL5VqYLDnsNVWpKgYAxKoGIwFhZBlDZ35h
	 l70p3FzpJsL7QPzTM9bAo4uKLacNQF0p2yfWkL0cJktRMF7v1FOhD5RTOsk2tG/8BM
	 BEKkKFMD6Fr8GtetgQWA+8C3CME1v1yJzzbgUfsu/+AwDaQWEIjFq6NocUo/LpR9i5
	 gI3W/CsvU15yg==
Message-ID: <sashiko-outbox-165557@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: sierra: fix urb leak on write completion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009123359.465071-1-johan@kernel.org>
References: <20261009123359.465071-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:46:19 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Make sure to drop the reference taken by usb_anchor_urb() also on
> successful submission of delayed write URBs during runtime resume to
> prevent them from leaking on completion.
>=20
> Fixes: e6929a9020ac ("USB: support for autosuspend in sierra while online=
")
> Reported-by: Wentao Liang <vulab@iscas.ac.cn>
> Link: https://lore.kernel.org/20260916165352.2085480-1-vulab@iscas.ac.cn
> Cc: stable@vger.kernel.org	# 2.6.32
> Cc: Oliver Neukum <oliver@neukum.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009123359.4650=
71-1-johan@kernel.org?part=3D1

