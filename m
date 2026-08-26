Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8186393DEF;
	Wed, 26 Aug 2026 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787724763; cv=none; b=EA1Mdi0kDus6JJFa8fW0bur6hV1aj8MIa6yWqPHkIujDpLJ1ZEfNWAasPAlxMvId45OuGB7grrCTPfYS6SAxLOCttvYqk5v2xJWKXhqRIyKu2WwoTlad9LAKGf+fgdskauT81aM/vA6ncS5E8Eh8Us5rEf5SKk21OdlV2QBUP3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787724763; c=relaxed/simple;
	bh=2bioAY5z0ROLaaveBiRi3hJa524Ucai3iadKkmwZvDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfQPkx+MndiSH6ptlQiV4J5if5rseWUoC8NBuAWFZhMTdAWUSaePl3U7pUljlEYMHxRSPjDLQii2IZFqDFaa9o3tZohSDbR0zxVC46+dbfFVMt32Go2qQihN7VqcNt8n5KvDXOms8Z/L5vBOQ+BycR+25riv0CnsrhoskUHCoXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=keKhtRF/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="keKhtRF/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C2A1F000E9;
	Wed, 26 Aug 2026 06:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787724761;
	bh=gHhyNXONb2rsob/LcF6ETrv9CS1FZCNcPEOogta3fdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=keKhtRF/kBm6d7tozt3sjSBlF1ErdQGcRXMozP+lLqPtxxengSN/mdF9uYPbbNOkD
	 ddu/rAZIxj7eGJXRsLiBQBMUZXKsHBua6vn/LoGT3Q6lfGZHf0tfPPhmpEl/6/e8yv
	 sxmtkcUGdl27E4SygmhHG+a9DkDIdcHVfzfLpDUA=
Date: Wed, 26 Aug 2026 08:11:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cheng Lingfei <chenglingfei@foxmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>,
	Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: goku_udc: fix kobject warning on probe
 failure
Message-ID: <2026082616-glue-atlas-0cfd@gregkh>
References: <tencent_0AE8C419FE6042BA8081E98C88BA604FF00A@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_0AE8C419FE6042BA8081E98C88BA604FF00A@qq.com>

On Wed, Aug 26, 2026 at 11:35:58AM +0800, Cheng Lingfei wrote:
> goku_probe() calls goku_remove() when hardware initialization fails, but
> the gadget device is initialized only near the end of probe. As a result,
> goku_remove() calls usb_del_gadget_udc(), which drops a reference to an
> uninitialized gadget device and triggers a kobject warning.
> 
> Initialize the gadget device immediately after allocating the controller,
> but add it only after all hardware resources have been acquired. Track the
> gadget and proc entry registration state so goku_remove() can safely clean
> up both partial probe state and a fully initialized device.
> 
> Use the split gadget removal API and drop the final gadget reference only
> after all hardware resources have been released.
> 
> Also obtain the controller from the embedded gadget device in the release
> callback. Driver data is set on the PCI device rather than the gadget
> device, so using dev_get_drvdata() there fails to free the controller.
> 
> Use a per-device name for the debug proc entry so that multiple
> controllers can be registered without colliding on /proc/driver/udc.
> 
> Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
> Reported-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=06ec7624018233e17113
> Tested-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
> 
> Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>

No Assisted-by: line?

And do you see this happening in a real device and not just a fake one?

And why is this driver using proc at all, shouldn't that be in debugfs
instead?

thanks,

greg k-h
