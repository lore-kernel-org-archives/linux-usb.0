Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D59272816
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 03:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860557; cv=none; b=nqlBhGNka+9LRrdp3ztWWlnaEm3nJ/fqKAp2IdDK7OZ/8aJJ1RrrX6yS16z9m0cenPYcoVL282u8fBGQKjdiFNcb3cS7j76V8nO4aGhfq4Vd7a2CIQbB+ahBkNPJFY+CC+V2op48RFCpyNIzRQuZVg57ltx0/mt+aSqiQjk//gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860557; c=relaxed/simple;
	bh=AY2ASlmt52O4WVZVbv2fDw2JQSCtI7hh1xXr12TluvU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YCgJRCmOEHeXh8YMZghxDzwoMErYz6Kdzq00bxTN5cUmQmOewa4KI3fUS1AgOTGG/SkhVaNL456TH3pMfIY+VdwI6PuGkC9f+85WO999k6MydEZY72/H2nIfBtydZ/rS5weuYxK9hdxDIuLUZ3HYF9QFVZnSzyDiECKd7gMkb5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lw0+B6C9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lw0+B6C9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04D21F00893;
	Tue, 13 Oct 2026 03:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791860555;
	bh=AY2ASlmt52O4WVZVbv2fDw2JQSCtI7hh1xXr12TluvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lw0+B6C9GCFKdteUBY2J7c3A6E2FNBP1L3SicT4RWOPG5MIzPDozAW+hy7/2O8t0a
	 6/MLJdmMgG02DZA6rRm7S0BL5MrgMZNtT65DDmsUnwKdSVVIBOeRE8p+8TBas8cu8A
	 O6YGT5+UrKhdxrEdyZc3qEg/YZ0uyMWus8FXbdrxBIVdcSPeywEm25PQJQJawAwvrE
	 yj2+ahdp9rZ+/Fo8oq/1NA/aJyZjIgexpkIZsAAXdXVrMiwYC6HkhkD78Mex6G3MnM
	 MLt8Vc+lopmmKe7yI+ciKYew10ywwH72TpzxxhKryn0VDnfH3Q5EJY+05Nw+CQg6Hf
	 mUJ2Jriz+y7dQ==
Message-ID: <sashiko-outbox-168884@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 1/3] usb: chipidea: Use %pe to print error
 pointers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Subasri S" <subasris1210@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013-usb-ptr_err_patchset-v2-1-f83351b3fc3d@gmail.com>
References: <20261013-usb-ptr_err_patchset-v2-0-f83351b3fc3d@gmail.com>
 <20261013-usb-ptr_err_patchset-v2-1-f83351b3fc3d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 03:02:35 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Use the %pe format specifier instead of %ld with PTR_ERR() for printing
> error pointers in imx_get_clks(), ci_hdrc_imx_probe(), and
> ci_get_platdata(). This prints symbolic error names (e.g. -ENOMEM)
> instead of errno numbers (e.g. -12), making error logs more readable.
>=20
> Fix coccinelle reported warning:
> WARNING: Consider using %pe to print PTR_ERR()
>=20
> Compile-tested only.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Subasri S <subasris1210@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-usb-ptr_er=
r_patchset-v2-0-f83351b3fc3d@gmail.com?part=3D1

