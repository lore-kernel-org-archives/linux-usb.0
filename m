Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182969;
	b=lDZtLmMqeBDDHYXi2qhUq4mRshg0pM0JNte5Zv/UZ3JjaltzAsr3tW7Uaao57yfAuwDf
	 0yLVaOnlbk9bwgrgrjsf3MgsqmW+iowkBBY5N6UD52Wd0/kvUbcXLHfrDEoDjhBhQ0/qX
	 3qiK3dzWhPgQBYKvjOVJgVNOYDVkmLJHPuhgdnPIYA1sED6+izuN0DFGjNVJ02c5l+3bO
	 7Mb/Cm3JdPPbCmQvrs0g7YzElCHzBMpv7B1sL4E7NiXWjw3K78AAW0NvWfpxPOR9558ib
	 oy+sN4AThhl4I2N9RmdYZRWYGITmoZCBy/ZG+rsJRyxnRvkai6FJBwebi7TJWoJD/7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182969;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2gJtzgRgKX9Ie5JnwyDsFXxf/XFdleZP/HUhupXzlDI=;
	b=10mJA7WjvasU7qQ4SKSGSZslCBEP0sSjrwfSdywv3zudz+1UvsJiFN/B57FJQuaqh8yI
	 WjIobW2dfbYZIcyKF9TPY58+JB7xTfIZf+V3Xu/h4hVkjSbVDbA2ZA3/F5oD4DQOifxtD
	 6++qald+rYMaesvJiYHlYGu5YiY5U334PpYiy2eS9FdSx72XoEq8az1Vv84SkzyvR08dP
	 1V0imeVT+HbwFeK1W+a2VGwVl2G0rsFzWG5LP36tCrLHrJ6CfHfDgXtj0EE+i+iTdxab/
	 w14z7KVqq697QVtaZewo7oOhNgYSGNHvAcxBRms9NCjobeAQ3WMttQM9d20gkwdllzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1dRS9WEs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC2606B9A5;
	Fri, 20 Nov 2026 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1dRS9WEs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2346B1F01801;
	Fri, 20 Nov 2026 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795182968;
	bh=2gJtzgRgKX9Ie5JnwyDsFXxf/XFdleZP/HUhupXzlDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1dRS9WEsRYDZUvdLDrr8hieTAoSPMoAxQyYytLZIComlcW6WN6yjnWuvK1zNqMWxa
	 j65ANIe3R4bG3knPQA00sOF4Q/kEgXKy0hYrYzmlH4vTFvoFLr2uIeli0TVI3MygPu
	 sbsUwKja8hYlmI7mZje3ryqfY0KLgaLLZD6EXTzQ=
Date: Fri, 20 Nov 2026 14:56:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: fabricioakio@gmail.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_serial: Dequeue the console request only
 when queued
Message-ID: <2026112047-tying-pep-8093@gregkh>
References: <20260928-u-serial-console-dequeue-v1-1-b44d68585632@gmail.com>
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
In-Reply-To: <20260928-u-serial-console-dequeue-v1-1-b44d68585632@gmail.com>

On Mon, Sep 28, 2026 at 03:18:18PM -0300, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> gs_console_disconnect() dequeues the console request even when it is
> idle, which dwc3 reports as "request ... was not queued" on every
> disconnect. Dequeue it only while req->length marks it as queued.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on a Motorola Moto X4 (XT1900-6, SDM630) with the sdm660-mainline
> 7.2.3 tree and the gadget serial console in use: "request ... was not
> queued to ep3in" is logged on every system suspend without this patch,
> and not over three consecutive cycles with it. The path where the
> request is still queued at disconnect was not exercised. Applies
> unchanged to next-20260928.
> ---
>  drivers/usb/gadget/function/u_serial.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Please address the issues found here:
	https://sashiko.dev/#/patchset/20260928-u-serial-console-dequeue-v1-1-b44d68585632@gmail.com
