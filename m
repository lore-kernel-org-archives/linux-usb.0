Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB873BD62C;
	Thu,  4 Jun 2026 07:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556953; cv=none; b=LtVI6JZ/W3214yCfmtVk1Io0ajWrLht41+lKWhur24bj6yhxASVOq0EI6Zo1iY709xc95jFQzx0+Ix/uwm8OKh/96luQV+Y6eGDRzeyt6VwXI9AftU3avTTmFFJhmlI4wpwhKywpYyre5paHAHKzu0CsvmWSIPAS0W6TVs2gp/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556953; c=relaxed/simple;
	bh=e/UaONQ3CUoWW8kR6/gUg/9PF6N2Egr4qSEF7y4dgWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLGS1ldgHD+KTS8dyRUGhJxbMW1KmXPgYR32nO/n27Qau2xbDrM0XvtGkDblgEu1yZ/b4lXobQKgE1jjMRC6+ZfdamNBXPyksrzIP/WomjfAutVSGtBEObb0J0zzxYiEyQJA7gI8dmjVvIGZxGAORlvh2E4MV6E4Lt+rNIBGmoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Js51IYBj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Js51IYBj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C654B1F00893;
	Thu,  4 Jun 2026 07:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780556951;
	bh=ohMA5jpLLBNyLmqHf3tk8YLYBSYSOjQ/Bp1XsvCAZp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Js51IYBjx+Vo9kSoM2dJBKVzJ2D7RS6kazHtZLr/N51mr0ZN0ZMtjqpBqjddmzZwx
	 oG3tVWEcPzsH3nAC3z+Duyi3vC9UlgKwfT+8E56Ax/AL8nxtZOURKCHANWHGCJwCze
	 Sg0a9RWU77iSbdya/DawfBEukCg2Xt7C6UIClLDDaLtXzYKxUplr3DRodsoLmgz0qg
	 cqVsRxIrWik7BUH9JtsldOK4OTvhROGSeVsw5uVAAFKxYWLqy9IIWdbZKkxSF5Aspb
	 pNy0KpbWZWDYC0WmSOLihwVY+VsqUoSUTzLvojsDsTeQPiHZ0+4MEulifZahhpqXmA
	 uVX5ps1Q0RL7g==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wV2CT-0000000AvaQ-3Gga;
	Thu, 04 Jun 2026 09:09:09 +0200
Date: Thu, 4 Jun 2026 09:09:09 +0200
From: Johan Hovold <johan@kernel.org>
To: jackbb_wu@compal.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: option: add new usb-id for Dell Wireless
 DW5826e-m
Message-ID: <aiEklcHp5m6H70T2@hovoldconsulting.com>
References: <20260604-dw5826e-option-driver-v2-1-00609f65f5ae@compal.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-dw5826e-option-driver-v2-1-00609f65f5ae@compal.com>

On Thu, Jun 04, 2026 at 10:04:40AM +0800, Jack Wu via B4 Relay wrote:
> From: Jack Wu <jackbb_wu@compal.com>
> 
> Add support for Dell DW5826e-m with USB-id 0x413c:0x81ea
> 
> T:  Bus=03 Lev=01 Prnt=01 Port=04 Cnt=01 Dev#=  8 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=413c ProdID=81ea Rev= 5.04
> S:  Manufacturer=DELL
> S:  Product=DW5826e-m Qualcomm Snapdragon X12 Global LTE-A
> S:  SerialNumber=358988870177734
> C:* #Ifs= 7 Cfg#= 1 Atr=a0 MxPwr=500mA
> A:  FirstIf#=12 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

> I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=32ms

The driver should not bind to this interface either.

> I:* If#=12 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#=13 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:* If#=13 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
> - Link to v1: https://patch.msgid.link/20260601-dw5826e-option-driver-v1-1-e0a0a72cfe1b@compal.com
> 
> To: Johan Hovold <johan@kernel.org>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> v2:
>  - Blacklist interface #1 (ADB) using RSVD(1)
> ---
> ---
>  drivers/usb/serial/option.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 48ae0188f2e9..070e0c553d7a 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -203,6 +203,8 @@ static void option_instat_callback(struct urb *urb);
>  #define DELL_PRODUCT_5829E_ESIM			0x81e4
>  #define DELL_PRODUCT_5829E			0x81e6
>  
> +#define DELL_PRODUCT_DW5826E_ESIM	0x81ea

I fixed that up and dropped "DW" from the define to match the existing
entries when applying.

Johan
