Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4111B3B811F
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342345; cv=none; b=pK6geaUsc/1oSVL3boBZGomPUCr2sQJY53iMBa6JAeuCfwu4R9Zj9PxSc1d9y9UJSSnQd78rNR4Ok47+NXOW6LVnI7YPRTOJ517trHli6QT1ucSIuILVYeYWlGL5tdAtwO3AJ4nKvD42dtkc34OrS80lHWbBG7oVI6FFa5Exf0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342345; c=relaxed/simple;
	bh=vv3WfFUQlMjSinYt3SMtCy3kHm1DjqsQjI19Zg1gpdE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tG6aCR39il3P1McyUTI7Ttk6cVYSj0wxQ3CWAvR/yVwOAR5rOsYaiZXJRS+9xQz/KV/yB19yppf1A/QifDCEaSc3gwOsSdDR+AdMja+CoV62gU5tdmzLDwvmn6ULpAi015yOjsBM9fxIyuDHL4WDiTaKaH92HM86hRP8NYbMhSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBQwCWOh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBQwCWOh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39891F0089B;
	Wed,  7 Oct 2026 03:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342344;
	bh=vv3WfFUQlMjSinYt3SMtCy3kHm1DjqsQjI19Zg1gpdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FBQwCWOh5WDC4jlg7fWgqWN+7H6Kkg+F//EKcBCA0/2rUOY136IUNzFVgol4GU5Py
	 sFOu5VZHErEBoFMHOr8LnkmDH+y3SY9zvi4OylNGHpj4DFOtjhd4UoeLX4yVCCAZOM
	 F63ALliraOOPBKZwQo9qqqKEPTUDLJpkHpDYPdlSNW7ZztTTllsbAPigHONCLZ25Me
	 pVG8Vef1AYc0EZlQioYlACF7x5bqhPRO8QpU8L+7ss927aw2bF9f1o2yENwoVoWqsk
	 d9RGN4fmHGSjM93GWBzZeRUbks3ZjCLyFuU66/MdtKveloQLc8JeulEjhCm/cxLKiq
	 +kPl3BytfLtWA==
Message-ID: <sashiko-outbox-162607@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 10/13] ax88179_178a: Add ethtool
 get_drvinfo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-10-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-10-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:43 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Add ax88179a_get_drvinfo() as implementation of get_drvinfo, in order
> to provide information about the device firmware.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D10

