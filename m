Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9CD3C3C0E;
	Fri, 14 Aug 2026 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709060; cv=none; b=ddCPay0XMOkD5DST+KWOMfvcmQju49u2fBhGAI2jT1XxpnwojOyw5S/ThMy5A6rm5kmXOIv54YVrrNBtTF+LfykAwF7sEzaUjYLKNdifJoaUVvqu5HnMlyDI2udVUNWakMuupWF2tAbUGNTp+jFaCnZaY3ymTS03yM0nGX8WpOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709060; c=relaxed/simple;
	bh=C4mJ9LgpVpEWinY9QRW7zW3XibIvpVSDw57m9Rgw7k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5RBVagcyPnkk7AFaGd58/ogYFeAdSwHafIZR/WyPtLRSCbQWhIe3RdF1fZ5wmybwdM+zRKtIhvXKAmb0/QhxKaCBkmTGgNvF2FdBgiVvEdG5phhT6Cf5PmRBsGsDv9XCAbDihjdhzuChUPIGKZFR+mcloge29vEjP+iSL1+Imo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1ol5zunH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1ol5zunH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834C01F000E9;
	Fri, 14 Aug 2026 12:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786709058;
	bh=HnBdQjz+MlWjhTqSk9p3Cz+Yfs2UxMFsvIBgquZBk0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1ol5zunHfbeU9f0Vt2elv27UnADJONKp60o8KZZhy/DxZOfITZ+yBbTWtf3IT/bTT
	 Jom7aJrytfoF/XoKGnE+3Er8pC7gOkPwLvxs5IWq31+VKkI8IRICY03XpsPHGQTHxm
	 5Y4DqZLSl4eD8cvGb9HooC7r6zhqeqYJJ8CSkYQE=
Date: Fri, 14 Aug 2026 21:02:43 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhao Dongdong <winter91@foxmail.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: Re: [PATCH] USB: serial: option: add support for SIMCom SIM8260C
Message-ID: <2026081427-overcast-silk-8fe2@gregkh>
References: <tencent_CDB9F0B44FDD051447DCF48862B8E764E80A@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_CDB9F0B44FDD051447DCF48862B8E764E80A@qq.com>

On Fri, Aug 14, 2026 at 05:01:15PM +0800, Zhao Dongdong wrote:
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
> E:  Ad=89(I) Atr=0d(Isoc) MxPS=  34 Ivl=1ms
> 
> Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
> ---
>  drivers/usb/serial/option.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 580f06f5ce5e..9c1444af2c61 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2165,6 +2165,8 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE_AND_INTERFACE_INFO(ALINK_VENDOR_ID, ALINK_PRODUCT_3GU, 0xff, 0xff, 0xff) },
>  	{ USB_DEVICE(ALINK_VENDOR_ID, SIMCOM_PRODUCT_SIM7100E),
>  	  .driver_info = RSVD(5) | RSVD(6) },
> +	{ USB_DEVICE(0x1e0e, 0x902b),
> +	  .driver_info = RSVD(4) | RSVD(5) | RSVD(6) },
>  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9003, 0xff) },	/* Simcom SIM7500/SIM7600 MBIM mode */
>  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9011, 0xff),	/* Simcom SIM7500/SIM7600 RNDIS mode */
>  	  .driver_info = RSVD(7) },

Shouldn't this be in sorted order?

thanks,

greg k-h
