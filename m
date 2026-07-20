Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DB741611D;
	Mon, 20 Jul 2026 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556946; cv=none; b=Pmzzc68wZ0Tl5EgDs8DvwoBoPB58H2BrhwvibdbGfUc2GfWlJgALYye9KG0cX45Myq33tEt9FyIPHkgvuUZxyTVWmYwltqajxTScMCs9hMFUd78mNi+QoufdETn9OwWh9mIQPDrMpS9uSpmzLi72VshmWlFK6pJFp41pXmOaHxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556946; c=relaxed/simple;
	bh=Vo9YfVAqcLPi3fff4+KaDJBAq8a13ek3wMoxU7HbzWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVEkskpT3dU23svQpTC/K95eMPMkrXS4mWXuHPcLo/9VgcjoSRLl+DWGUszyE/H1zuRFYXj6pSV1i7aa44feFS+CeidhySJ7/XcBhKcbcmPZwSBr/7Z0u5wBHR88fOPmR5J0tqkCm/+X1642nDocw57VFm6TJlXQk495UJ9hyUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aL8C1VUi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aL8C1VUi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2501B1F000E9;
	Mon, 20 Jul 2026 14:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784556944;
	bh=eD5i4QNNnzvedjrcdpzfdZ9+ybpKsZoWyxLsaCuEmvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aL8C1VUizQgjfAIUWHElszolSYsHNlZIeecAMgvTaoMEnrAAKHur7jMPDt/UNfV9t
	 WrqdySg84e7OER4dk5QkrdQsw06z/7IzoJzDNS6Gc4Eky0lvu3WLNTSo5l0ilB1oBz
	 5y+RE2REmx7L3eUkd3K1+bZEY6h+wuOyH9JFbyp3MYTIp9HhUxwiAGsa53NMrucS+S
	 pcpriO2hOQ0fB7ATFhZQLxldd3wNVZDKPrNNFpoLjFhuNz6A+K8+x1ns5/TkdjTbym
	 cY3YTQzbh1RlTNPCmdLYSSGSeHNQzVZ2qrHLpNyYc/t52rWtju/M4KVf+lAnmF6KgM
	 ArOiJLdpxIz3A==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wlomU-00000008ok8-0RWv;
	Mon, 20 Jul 2026 16:15:42 +0200
Date: Mon, 20 Jul 2026 16:15:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add TDTECH MT5710-CN
Message-ID: <al4tjkfe3b9C9xSQ@hovoldconsulting.com>
References: <20260708100001.1662740-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708100001.1662740-1-amadeus@jmu.edu.cn>

On Wed, Jul 08, 2026 at 06:00:01PM +0800, Chukun Pan wrote:
> Add support for the TDTECH MT5710-CN (5G redcap) module.
> 
> T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=3466 ProdID=3301 Rev=ff.ff
> S:  Manufacturer=TD Tech Ltd.
> S:  Product=TDTECH MT571X
> S:  SerialNumber=0123456789ABCDEF
> C:* #Ifs= 6 Cfg#= 1 Atr=c0 MxPwr=  0mA
> A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=0d Prot=00
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0d Prot=00 Driver=cdc_ncm
> E:  Ad=82(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
> I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=01 Driver=cdc_ncm
> I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=01 Driver=cdc_ncm
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=06 Prot=13 Driver=option
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=06 Prot=12 Driver=option
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=06 Prot=1c Driver=option
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=06 Prot=14 Driver=option
> E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Interface: ECM / NCM + DIAG + AT + SERIAL + GPS
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Thanks for the patch, looks good.

Do you know which chipset these devices are based on?

Do all interfaces need (and accept) the
USB_CDC_REQ_SET_CONTROL_LINE_STATE request sent on open (unless
suppressed with NCTRL())?

As this looks like a new chipset perhaps we should add a dedicated
tdtech wwan driver for it rather than adding it to option (which has
become a bit of a dumping ground for most devices based on recent
Qualcomm chipsets).

Johan
