Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15EC220698;
	Tue, 11 Aug 2026 02:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786414925; cv=none; b=LTxWLTnX0LEIIMhSR7N8WlZ/3D5OCOgECFrUMfXxpSWXfSrYJuoTRytCQK1nCSIuLQH1+5YuiiJuRzw5RXKDZIscymLoGI5yoX9iZj+QdEm5WnRRgJ1ff1E2jt9mZY7j8qlzJ+o8rua6m6S2jun4H4hGE/GR47cvFfTYMZ5w/+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786414925; c=relaxed/simple;
	bh=SpM+m99CaNYh4vIMcCDPVqCu6rTpOSPaE7v/Z68Zk5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geV6kwCZBaNv01ofhiRbeeGy8wxqyg299SYSNS/do6uTBMly8ktu76Z1AoeL5iRkT7bW5LeLxu3r9iX93xSNeEXgLJHe1K64cjfcvTam1gE1AMxELrp4BmMsMIoluGN3VvwE6yTnkKrlPnd9OMewrVoOEFFXDWa/3nCsYbY9R0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=o93ZDBs7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jxw5qBCQ; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="o93ZDBs7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jxw5qBCQ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id A87151D00051;
	Mon, 10 Aug 2026 22:22:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 10 Aug 2026 22:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1786414922; x=1786501322; bh=dn9VZdwqI8
	K7l0CgMBVAyijf+5IoyY2Ed8pMTMLHH3E=; b=o93ZDBs7hmctoqpGX160IfD/Xt
	yJuKph5hEwtYH63eAZTrmhm6wjI/weOJSwbx0DkE60gYQf86SIaho2je6Wbq1B0g
	NQQmpjTH/Jz8fv4sEGJ33pH6e5XLf9ioqN+hp6rTF7YPfJNuoGDaN7UVtCHCOtQg
	4LpMJiFp9Q3t7CV9F6aOcEOn9++x1l2qpFWBbzjhTNuq5JydzgWEHVXGsvY2UlWD
	gjxoXrL8jqAr2TFPMOdY7co+IfoPQ5mxS4mNOkBlUHSO/Wwd2nLRbg8FqzvXrofp
	yWzwDNKOvdCAjmIktekC3s9m4lZ3IQ2c+sIUnaj/e37f5iONS86Vkb/kDlYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786414922; x=1786501322; bh=dn9VZdwqI8K7l0CgMBVAyijf+5IoyY2Ed8p
	MTMLHH3E=; b=Jxw5qBCQvZ6dkPFLVEf0qjtPO14HSfX311lXTWrS64gTFxFsdCu
	tYsZQLS+XWnB5VzJDX/C9jP1W157wEjuZy5Arq7nLqfBaNXtjIx14pXPCLqyXPwO
	j8P9hUJDdvV2pKhRxW8rQcAwblYnUInjBhvN+/aK6PYh3xg4Lqm7BBcZKI9cFz0Z
	gj+nuugAxkdyoKlaHPWMOPgPP7TtkLH4R/kfnSZjcyUM9eBYUxttApOq286jAF8a
	znozNbfKxK4x1d3ud5dW12Ly8AeyxSnpXr4PEFn1uvWkyuNfk5cAoN08hK+3S0bP
	OVMJWk1YMKXPns9kQQ/1VS6OdVCOVxr7VOg==
X-ME-Sender: <xms:Sod6avAJq5470ywbhwN05PDc1vyE5qiQD__iTeoPQMaeH3SKjEB5kQ>
    <xme:Sod6ar5Za9URb4rE5PQYfsocBVt50--2y5BLV5sgYWnuLpA6lnCs_6CUTftoH6v7L
    FD93u1xUTn3qZcUBzXRQQwiXTzFUuwZ4Fj1RLW4gZ7YZujZoIQ>
X-ME-Received: <xmr:Sod6am0Lbk38OHbDRVJRvEjzTojzmET0Jyqm4rrbL2gfnaRL77DJYEI>
X-ME-Proxy-Cause: dmFkZTE6Be3XxPwTkh8tO6KlN5fGgU9jBmkVejpeLUez+V0iyHTfMFESBxDaZF/WOrKCrA
    aYgpBb4H8VF+U0in0YsaJsp6rD0+2jMY4aBGCd7gjuCdmc+sthJvCpwNN55Fvi++L89KUl
    jccwj/btFMfTLL3EiKxtncBUY6sDkEkleRgJvdtYPHUgi58CVZjAgwkrXGtHDwYz2m7+Ag
    1gnT6xMOp8D5AekK36YF5mYPi9JDpo+0rjqK6dcFYh+4KbePZyHCXU4/dW2WJMOn37vUoa
    pf19QSWclZ9N7vRbDbV8c8Qg40oABe25LqWbuc5SceGEvHgBfm6SNiYTV6dPA4PGVwN9M0
    GqSngLti+9ZOmalsBUoKOLwfEzc0wEOHjkn0DeFOrnX8u2ZEWGrw69NV3K96LyVrlJ0yvm
    lfZ4FXaiNZ5DGGWOdbkW6RB94kEya2ZnZ3dJ6/751tnmlrp4D18oBWw4DIhk7p2Yq2O0bt
    cqou80HRbvGClvHSngHmm3OBel45mw9JlYC4eHAuIvfvZel1wneMaAyrKWEDCl+7bptGpA
    8Jrj0E4u7TpbdXLIyuI3SgmwXDS3KTUlK/kmRCkZTlOhlEjxi1iOKJGPnk+v2uN4bfPrzW
    OX7nU+uFQ8LRSWWG1p80IIyerfhvwfcpQFobZYhB0Bl3ugPLOesUdEa2tJKA
X-ME-Proxy: <xmx:Sod6avlqCErKKhkn3uwDl_83Qv1f0AIBW_qY7toT20Oo8jLiehKEwg>
    <xmx:Sod6as5MJzrn8j0wXudZS4AhLld0vHdn_XzVuz147J9dXyKJ_Nc2wA>
    <xmx:Sod6aqkTT5GAVbnZ_gLOqjivpbNfR6EQ9PcmmGBWxrJgJNVpF_DnZg>
    <xmx:Sod6avUXDxKan_n1JlwYdIeKH-ZGnkKo1mSKqaRKtW1KdbPzXO-wSw>
    <xmx:Sod6akn2Rm1dUmvKxyplBOVrhFDgU38osLR-x2H_2mpA1Fn1PjG1vtfy>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Aug 2026 22:22:01 -0400 (EDT)
Date: Tue, 11 Aug 2026 11:20:28 +0900
From: Greg KH <greg@kroah.com>
To: Jason <jasoncola1@gmail.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usbip: make remote list honor parsable output
Message-ID: <2026081147-referable-rectangle-a7c2@gregkh>
References: <CA+Z0x2KjiCjzTzNQVYRk3Zs6YoNsZLs_t+5YNj84AvDqqDjr+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Z0x2KjiCjzTzNQVYRk3Zs6YoNsZLs_t+5YNj84AvDqqDjr+Q@mail.gmail.com>

On Mon, Aug 10, 2026 at 07:13:44PM -0400, Jason wrote:
> The -p option only affects local devices and gadgets. Remote lists still
> print their human-readable headings and details, so scripts cannot parse
> them using the documented option.
> 
> Pass the parsable flag through the remote listing path. Emit the same busid
> and usbid record used for local devices while continuing to consume every
> interface record from the server.
> 
> Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219502
> Assisted-by: Codex:gpt-5
> Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>

Does not match your From: line :(

Also, no cc: stable, why?

thanks,

greg k-h
