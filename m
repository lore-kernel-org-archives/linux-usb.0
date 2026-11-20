Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162634;
	b=yv3mVirHiX8ldQ5yy06qStNYPw3u7QGO2kegTVjnLdUVolmzGTjjKzKDy6oLGFyTP43g
	 0jQ3UxUyOY/X5R1gc9dCgZAEup08TJia83lT9cV+etrl4gmFEpPWDIE618J86YmdDrnoJ
	 1EH6gp5DhO5gA5Gkv4F76PfGUApNhMAULNgHTTEdbIZEjsq0Ku0XDHTzTzqm28WOiJmvE
	 GD/Xtnu/oyFGkbZ/kdeLO2g7u0GnRMOtdFHPju/G0Ntx6yUnaK3fk2Qt6aZmbsyL3sQNH
	 Yg8WGC4KA306CkY/uwn/LJVTaFmKTjiCkae3XXF3E9dbjH3J7Evtro5inzZPm6Gd/TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162634;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jwFTtMFfvcVwzXF6nx1Da9qZEN/vmSO2J86DAeNP2u8=;
	b=hkP0Wlz1T06gD8382spKZ+eKGi3Nzw2LpWx0+IKFrAdDMLGw6ootK9ho7JYiCJ3/baMB
	 BkkMPbU4lTB1VI5XwKCHxiHVxKx/yZM9M/yCsSnVh/j+xz4zDSDmE+efAGaf9CHeR6sT/
	 jw52UHFpBdER2LCb3EwVY5vcZGVqpDQcLQ1UUXqzMi9AprpiAqRST0HuMjuwf33eviRR9
	 6BEojYFjLqK96Znf7AxXyBH4Hj+AcBdYwGDApqmABOaLP8Wf/dYfnacOOwh/mNFn4FsWl
	 /ZwbfdjnJBvmeFwPwqxcB+2R1u+ei+kMHEOxjz6nfpgNIrjf5TShN1HZSDMUNjWaISg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=cEdlTmmH;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nCKLOIvw;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D7D60A260A
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 08:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D7D60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=cEdlTmmH;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nCKLOIvw
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 96D571D0031A
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:17:12 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 20 Nov 2026 03:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1795162630; x=1795249030; bh=jwFTtMFfvc
	VwzXF6nx1Da9qZEN/vmSO2J86DAeNP2u8=; b=cEdlTmmHxEnHiI85tBQw1SRrF7
	CFl9VZGjes1s6KQARcG7DawjivqzuAJzyP8Pj/aQFiGEiukDkbMxt9j5zV9l/d5G
	17pcSo+78jYiW40OH082VPqINUAjQayZud2VAw4+bdaMYObDz1pYUA3DJcsBO5ov
	kEazcCL+s62lMkeN07gLELULna9jZ1x7Jaobii2ekgYzgk3jmFgEE8J+Z42Wj+iN
	lchTL40hJKVqeVY6UVuZzI/27QFu01XNGKCsWqNp8C8o8lDbc6D9eVgtdi+xyM8c
	bCaoDkip/884RoF2QYw6vJb4Y36oLwK4v46h+zCX9G7XAL32dExc+rRGxJKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795162630; x=1795249030; bh=jwFTtMFfvcVwzXF6nx1Da9qZEN/vmSO2J86
	DAeNP2u8=; b=nCKLOIvwxfZSvqErQRD9FfYoIAsmXKcj686TgzCojf/izKYMSoV
	eLSzYhu1ClW7N/jz34MLWhl/5AEshx5lAFBVvo+QTrItKF+zBo6c7/7ROs0Q7FaY
	0DZQK1wy3yqVjeL15B8deGmbU79BDcXc/lJamRW5gC0AcJ3+ajmMb7cjfrkJksF3
	VTPQZLFU5NG5nREOJ7rhjnMfuon8nYiD6pM128S7mfVMxHbJry6P3UI6lE+I7oI4
	BsKkOxk2ZwUBWIBh+FazBXeK8SIOX2gZ/b8uTUJuQNHfs6oCVDcL/FYgV0uxe2Ev
	F9iK4ECeW4tX8oJ4Tm2wmJx3dpQeREjOihQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795162630; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:Nla07sIZyv9Qj7XYgfyHcWTBlrHYNXldgolZu6nkEqbVCoQ
	rfY7RQNwuCKLuZ+jffmgx3hlfVMtSvduX/bWhUUnd+jdKo+uD5njsnPNoOT7hbi4
	eIpwhPj8TsILOLYn+LZplPY8f4HaWCnnpE80Ai1ZQBZtiLgU89YYVXGLA6FGdNUk
	lTbVmzokeW/FmVa5e+DxGkLcS6wyvZf4bYyXZnGm4G8Z+9Oudpj2jT1enCJbXtpF
	LFbRET5qvmJqSpMMFZ4/BK8IDfVbTTn6pwz4InIYpy0aBYD0oIf1CyU2GldxEYqn
	yutGt/Awtd3XGNxJjdCvUd8vY5amn1LVOhZd3Gw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GX5f8IQVvBa/luY/rOY2bKax6TBVGP42jGz1Isrqisg=:WFaABMt+2M9VQuY5/ka7NDvEJk47H7/082hXEpKLbFs=;
X-ME-Sender: <xms:BgIAa7bQjPK7h6KCyHZdv5wJdcDJW0w7-MUpDjTAQU6e7OTotMgfkg>
    <xme:BgIAa2zhIEY1Ji-yewbI0Zoudicq9ECN_ZXt-QEOePqq-hPl4-zYwdAbPygFWgcat
    RX4oCmW-PBKUvLCSd501Cg9n7wvb1dtVeo7L-UnR1OhzCgbN-w>
X-ME-Received: <xmr:BgIAayaU0iA9mcaZ1mqlJodZRPymUvv45nFe8bLMBpWhGwZOsIiz7l3H9obd6Olrsda36nl-ELzGO2A6E7GII_WRD-7zaoxK2RRMzJseqEQ>
X-ME-Proxy-Cause: dmFkZTFQ7DaCH96GS+eQ+DbvcQ6sPsqlIf+L00Ykku0I46uDDxi6HexIxb9TybVBL7Rc4K
    LF6I66PWAXS6RNIJpNbboMGZQYc8X4ASiz6bmeI1J1EtHYtxvEpy74xuYDulpAPIWXNECs
    81yxljtHzkcvvoeGnoyyGyTO/UV3W/i/Kjn5uPNS0jJOIY5mHPs6yR7YSYPiZm/eREVcYo
    K+OxlfbxFoNWadz9eeCLtLPpy5+MKlm2LoZ9vJD9JoIqksG9hfxJFFtr3gHSeufxBMq8Jn
    1Dg7o0DAwbZHtjzooFUzXq1337f5CiuA1GgjNJAmac8b0QYWeaI+5mEuPp9CRUPF/FXWUb
    TqTDvM0dUYOjv1mNXl2BmPxbh5z9CsSNBhiZxEaoNRS8KLWM3Ow0F6HUnrhw15cvGVXOos
    oDaBKwg8ddrhTP3cu53YxaIWlK+JQl8wOCHWNMGCfUwh+2RxNz90skJZbqJjd2FGOeQ+9O
    e27lG8YYHWPiZyZ+CWD1h5I4WqotOJXzElkeIazxImMRWkIn5ROIQR0QRIIWPgr4wkBIEB
    Fa8WcIFl5cCzW4MAoC+hIt+Ak88Nr9/EIrdesJIa8ViHZEuW83awuCuXhw4qjmVGQ3415n
    oC3v/5pHr9bTZVEnerG0T404At7CwxkbSGjCYWwNKg/xAEBTEiwwDkP3Zv6g
X-ME-Proxy: <xmx:BgIAa_xMADmTgtPoxpP021rF056i7cHHXvTMd5_VKsxhG02EDa3x8g>
    <xmx:BgIAazHPYbdnO4RQSzd1Cix4450KdL2uOaTnrtYMFyEOcvv4Y7vRDg>
    <xmx:BgIAa_xhXo97joRl6pqVPRK2xRTaCkz0QAHw-E0pr5PpH-RII1EuBA>
    <xmx:BgIAa2Mls0fBHZ5eggvspoX1L9RVtWYSxp8aN5m01KUh2Rxz-XIf6A>
    <xmx:BgIAaxO7ZioZWdikzasnlINF1D2Mkf8JdsSnpmK0SnQqecgtQDi0oyyy>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 03:17:09 -0500 (EST)
Date: Fri, 20 Nov 2026 09:17:07 +0100
From: Greg KH <greg@kroah.com>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: bryan.odonoghue@linaro.org, heikki.krogerus@linux.intel.com,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: qcom: Release connector fwnode after
 regulator lookup
Message-ID: <2026112052-unmapped-etching-4bca@gregkh>
References: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 10:18:36AM +0800, Xiangwu Lai wrote:
> pmic_typec_port_probe() looks up the "connector" child node with
> device_get_named_child_node(), which takes a reference on the
> returned fwnode.  The node is only used for the VBUS regulator lookup
> from the connector node and the reference is never dropped, so every
> probe leaks one fwnode reference.
> 
> Release the reference right after the regulator lookup, mirroring
> the parent driver which already manages its own reference on the
> same node.
> 
> Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the connector node")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 2 ++
>  1 file changed, 2 insertions(+)

I picked up an earlier version of this:
	 https://lore.kernel.org/r/20261025-typec-of-fix-v1-1-06bfc16a7846@ixit.cz

