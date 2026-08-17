Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31B132B989;
	Mon, 17 Aug 2026 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786948852; cv=none; b=gSvKgqOchwtJZ2055W1Sg4PkpNKkhUmesJwZRdsAZwh/RyVjSnPunVsWoLTfyv407NTjAByxl7nxn/ENZA/MWVTOnmZ6UnOFQmfpE7bYq4eoreQY4JphzJuP/4buqZQPeUwUwmzyXAXCjFsi50PkVRU6TbsHWvWqrB4JNyxaOqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786948852; c=relaxed/simple;
	bh=4j/v5/Hp86KHdapr3BhHAsGoS7i5Yr6+pCwyKIuBN9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqjwsT/roLJN+insnzigBx9/a6mL4eYe22DSzRgzIfk8LqBHFZlFHttU1nq++NRem879dcgNkC48vQ3CRW8lEkwxIiRUrgjBUAXbyPPgeIeOH3HFNlm4gqWBiUrQMpSoofyV+hXQsjISZv9C7ntq5WJ421hOIxUbvCg0hjuIzYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpU6NuKX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpU6NuKX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EF51F000E9;
	Mon, 17 Aug 2026 06:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786948850;
	bh=RYAHontpqWswp91SVMaVcemLbV6WgNfatqwvRzXxMA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OpU6NuKXy0UwUS3lLW1huKiAdsU3M3TXOSYz/M++pneYOfUaFnp/7iEKDUWM5M0nv
	 tCgy3OhGH79JcTK5HOFjMlJ/uJCh7GH5c94nTpM6o6TWplb+rCaFgx+ZVSQ7jM2gv9
	 6TWNDT+pC2XxkIbq5cPvSJr3dYQ3j9mVimZPgc2D9dByV94q+U2P515uPhblOiKpCp
	 RYFvty6HjrmstRs/t5q51Q9giU4hmC66RYpdX4BzVt6nzDkj0BpNSJcxkEQb0iMaTg
	 2diZkGJAFT+iq1iOT4pLnbPjrTURcOC1MBh/4UkhHtc++spueZ7CCcdrkL0Gocf5oq
	 u6N+Igf4F2c7w==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wvr1c-00000000ZwM-05Rc;
	Mon, 17 Aug 2026 08:40:48 +0200
Date: Mon, 17 Aug 2026 08:40:48 +0200
From: Johan Hovold <johan@kernel.org>
To: Zhao Dongdong <winter91@foxmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: Re: [PATCH v2] USB: serial: option: add support for SIMCom SIM8260C
Message-ID: <aoKs8BwgS-rTZPpD@hovoldconsulting.com>
References: <tencent_E58647B4DE1D2583D785AFDDE58EB278FD05@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_E58647B4DE1D2583D785AFDDE58EB278FD05@qq.com>

On Mon, Aug 17, 2026 at 09:40:05AM +0800, Zhao Dongdong wrote:
> From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> 
> Add support for SIMCom SIM8260C (1e0e:902b).
> 
> T:  Bus=08 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
> D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> P:  Vendor=1e0e ProdID=902b Rev= 5.04
> S:  Manufacturer=SIMCOM
> S:  Product=SDXLEMUR-LITE-MTP _SN:120696AB
> S:  SerialNumber=0123456789ABCDEF
> C:* #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=896mA
> A:  FirstIf#= 5 IfCount= 3 Cls=01(audio) Sub=00 Prot=20
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan_simcom
> E:  Ad=88(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 0 Cls=01(audio) Sub=01 Prot=20 Driver=snd-usb-audio
> I:* If#= 6 Alt= 0 #EPs= 0 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
> I:  If#= 6 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
> E:  Ad=05(O) Atr=0d(Isoc) MxPS=  34 Ivl=1ms
> I:* If#= 7 Alt= 0 #EPs= 0 Cls=01(audio) Sub=02 Prot=20 Driver=option
> I:  If#= 7 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=option

As you can see here, you should only match on vendor class interfaces to
avoid probing the audio interfaces.

> E:  Ad=89(I) Atr=0d(Isoc) MxPS=  34 Ivl=1ms
> 
> Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
> ---
> v2: Modify the order.
> v1: https://lore.kernel.org/all/tencent_CDB9F0B44FDD051447DCF48862B8E764E80A@qq.com/
> ---
> ---
>  drivers/usb/serial/option.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 580f06f5ce5e..e52f3fe6ccd9 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2168,6 +2168,8 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9003, 0xff) },	/* Simcom SIM7500/SIM7600 MBIM mode */
>  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9011, 0xff),	/* Simcom SIM7500/SIM7600 RNDIS mode */
>  	  .driver_info = RSVD(7) },
> +	{ USB_DEVICE(0x1e0e, 0x902b),
> +	  .driver_info = RSVD(4) | RSVD(5) | RSVD(6) },

That is, use USB_DEVICE_INTERFACE_CLASS() here and only reserve
interface 4.

>  	{ USB_DEVICE(0x1e0e, 0x9071),				/* Simcom SIM8230 RMNET mode */
>  	  .driver_info = RSVD(3) | RSVD(4) },
>  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9078, 0xff),	/* Simcom SIM8230 ECM mode */

Johan
