Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17784137BA;
	Mon,  3 Aug 2026 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770569; cv=none; b=Jdel0VLY9rEb3PLfe60CmP98lkh8o2Skr8h9klujQ5cZ+MXTWxrHDso5krBCekMy7zhcVf+OuPV0Yd6y9RT9VgwvRUg3v8AbZcrrL/AedK1rDaWhP6iWv6d6eevWOTQMDIEUdfyMi7Oz1grYT+2k36tPMu96OKzbtxzLlLnHkc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770569; c=relaxed/simple;
	bh=hJ7e/2OX2apP0po0mwRLl6yQDnIwgVUVajxkVbQ6Gqw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t0WWgcO+ntWF3cey4NGuoVFp5tLujgfSRp1EByZXK41znFIN7++QCMTmLLZ2lGJVkUr+cud2STTmLGMBbx+cghKL7BWG90QbSh8fG6cQ7tZYM3n1dnhRsfTykeUHbb3X0OPQDdptrzcYHs+IzRVVS03/6jTjvJpKTwWtX+J/BVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id AD76C2008B9;
	Mon, 03 Aug 2026 17:22:40 +0200 (CEST)
Message-ID: <62323293f3b1f58871e6e078e2bbf5efbab62c09.camel@pengutronix.de>
Subject: Re: [PATCH] phy: sunplus: fix error handling in sp_uphy_init()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Felix Gu <ustc.gu@gmail.com>, Vincent Shih <vincent.sunplus@gmail.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 03 Aug 2026 17:22:40 +0200
In-Reply-To: <20260803-sunplus-usb3-v1-1-5a562524c869@gmail.com>
References: <20260803-sunplus-usb3-v1-1-5a562524c869@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mo, 2026-08-03 at 23:15 +0800, Felix Gu wrote:
> Fix the error paths of sp_uphy_init() to undo exactly what each stage
> did: return directly if clk_prepare_enable() fails, release only the cloc=
k
> if reset_control_deassert() fails, and jump to err_reset if
> update_disc_vol() fails so the clock and reset are not leaked.
>=20
> Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021"=
)
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
