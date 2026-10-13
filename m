Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A9A370D5A
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 03:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860558; cv=none; b=ayGwFFAp9ipZstlCsFlE12yNLdirHZrVeuBo6f9hsrz76GF+zZY/geJhGUMvb6A7O98uQMT5hTrhaPPhVoLJUnnbcm6YGsYGXanBsAz3Gf37Kgl7JEfalZJR+KkyIX6mvVBFgOSne0SaQaXpzEb06XZrMofd0tc3qaiRRij3qxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860558; c=relaxed/simple;
	bh=BidHSlpXHRUPv8lZRqWqPH+SMnNY660E+3/YyH5axzU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nkIwY1zNKV0QNx9xGGukaY0nnRfppS5pbwQUB6zqtOEftZFrJzqSihNJ90pCOm58TZHjtr3+gEJCTtgGU4Jykmvq9pRMKVTU7Baf+KXSSsLS7HRIrH156mdxMdCTA7gkpdBhX+qe6TTcw4wLBPBzehnpOdvaDQfTxZwjb8TinB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUmY5a8X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUmY5a8X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D161F00898;
	Tue, 13 Oct 2026 03:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791860556;
	bh=BidHSlpXHRUPv8lZRqWqPH+SMnNY660E+3/YyH5axzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IUmY5a8XZjlOczybOVw0Kd9lhEg2f4gOTTPpH3zSZDbq0UURttdDjOWaWcBUXRup4
	 HxIKSGuJZ86H4trIU8UvY8EqFz7NImsOVQA3QEGmDlD5zD2MAOWtVZDiyGdxEGgntI
	 +0OLqEyza5Tfg5hrlmEnpRTHm0FyM/X7kr1e/XDlmDBBZUwjVVDSj3Bt5TDQAMbw4s
	 GSjysexPSoN0npyon+NdzakOfFhuBcgM1lq8ZfLjY+l5bAUzs8lbyMbsgctlVpu5WM
	 VBHKdhWhoUSldRmeVXMxFa6Zb8zvZPKLs+rN67K0BNaxFXQzqn7WQU47yOF+Bcwziw
	 B5jDYkXoJbKAg==
Message-ID: <sashiko-outbox-168885@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 3/3] usb: typec: Use %pe to print error
 pointers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Subasri S" <subasris1210@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013-usb-ptr_err_patchset-v2-3-f83351b3fc3d@gmail.com>
References: <20261013-usb-ptr_err_patchset-v2-0-f83351b3fc3d@gmail.com>
 <20261013-usb-ptr_err_patchset-v2-3-f83351b3fc3d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 03:02:36 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Use the %pe format specifier instead of %ld with PTR_ERR() for printing
> error pointers in various typec drivers. This prints symbolic
> error names (e.g.-ENOMEM) instead of errno numbers (e.g. -12),
> making error logs more readable.
>=20
> Fix coccinelle reported warning:
> WARNING: Consider using %pe to print PTR_ERR()
>=20
> Compile tested only.
>=20
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Subasri S <subasris1210@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-usb-ptr_er=
r_patchset-v2-0-f83351b3fc3d@gmail.com?part=3D3

