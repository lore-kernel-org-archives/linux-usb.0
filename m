Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DAB421887;
	Thu,  4 Jun 2026 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573478; cv=none; b=GcGnwSUESiRWN9q13FEoTWtVJRP/dMbiIXf3MrvjOTK3oTUpuus0o8pcjFIMw877HJbNHL2DSeK1cU6BXMdxCH+aWIPIdUoQKx2++fNVIYn76V44/k3oGdCW7qqywncWQjigeGmZowJOv8FDxPlJCvdbFdQ6B+W1j06zEREopkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573478; c=relaxed/simple;
	bh=prKi2gbNzO+DXnBV0EhnY31ah2OH6+vP7Wcrf424xFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fd514u+vQ0O8ri0lb+VPFNQVqzUQ62feDlDf3mB/GSUwGlJoQkM3dFNX/T0BfpGWHcmb+JB2Ygu961Lsx6rUZYBJQKqe3ULB4PumfCtzf4KIYOBLLd8uaZMPvAbPKcLUjSoEC+S/IDBm6GdJ+5WEt8gkE43WWRrLo6kSOKzML+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNkL6aUw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNkL6aUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CF21F00893;
	Thu,  4 Jun 2026 11:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780573476;
	bh=wZvBS35TWVL3pbBcWZkpMfDAOBUsfCcJiYMislmVSY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TNkL6aUwZd7hBU6yvEbWmU6bn8wmH23J8fWnRYUHqwu9pk1QHNR4DIEaUTGckLRfO
	 eSGR/QX3VoWxwWeCB/nd9zrePPYOdEbzptC7qsD8dRROcolGCYLpmcKF0bvcquFMja
	 NuliQfDEn8ikpNwQ0BsXGgGd1hLHSvhteEDY5BEbhS26etfBp0aIjMjeFHLtN3u3hN
	 HCP+8X6Z1Cp7RmIh4Hyv8SrJdlRKk0T9T5/zapp7pBJze9P1jpGoZD57qtM153ENKY
	 uX5O1FrpecvJf5i/jYkmQ9IEhtK4SK0mDfj/nslBKUfK9xpe14umRVytsvhQdVV+Py
	 5IFrP+X1E+Qqw==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wV6V0-0000000BKlM-2qFC;
	Thu, 04 Jun 2026 13:44:34 +0200
Date: Thu, 4 Jun 2026 13:44:34 +0200
From: Johan Hovold <johan@kernel.org>
To: jackbb_wu@compal.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] USB: serial: option: add new usb-id for Dell Wireless
 DW5826e-m
Message-ID: <aiFlImelxdae6g4s@hovoldconsulting.com>
References: <20260604-dw5826e-option-driver-v3-1-413a2af11eee@compal.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-dw5826e-option-driver-v3-1-413a2af11eee@compal.com>

On Thu, Jun 04, 2026 at 06:30:10PM +0800, Jack Wu via B4 Relay wrote:
> From: Jack Wu <jackbb_wu@compal.com>
> 
> Add support for Dell DW5826e-m with USB-id 0x413c:0x81ea
> 
> T:  Bus=03 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#= 15 Spd=480  MxCh= 0
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
> I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:* If#=12 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#=13 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:* If#=13 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>

> ---
> v3:
>  - Blacklist interface #4 (ADB) using RSVD(4)
>  - Change DELL_PRODUCT_DW5826E_ESIM to DELL_PRODUCT_5826E_ESIM

You forgot to mention the missing comma that caused a build failure...

I added the missing RSVD(4) when applying v2 and noticed that it failed
to compile but assumed that I had messed when amending the patch (and 
fixed it up).

End result is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-linus&id=1938fb9fe38c4f04a3f30bea44f8071c80a63be4

Johan
