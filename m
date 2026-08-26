Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862963B6C0A;
	Wed, 26 Aug 2026 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733214; cv=none; b=J09u6Gn7OaE3nEWJKgehLIoBczaBYMZywTJXLQapLRvw98GuRqmDGSQJm0I+g8/UELauKTFBVYQJAq2/xF1MfS+iO3vRTNbhwGrS83minjRgvnsM+8GGwGpBi7JnmcvHDFRWaZ8nJf2xPqAYoRHecgzlsIorhpDBZtHV/MNAkk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733214; c=relaxed/simple;
	bh=zAlIzAqVIX03YrKLpCWLfGzv6vRqn5t5yPiUo1ShnOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C38ON0CgVELc+/qjOobo5muazxYsXVi1zBYnL34v+SVVKXfwyRt497GhM0/6es/W4ztbv6K1Rg9bsjEXoo5xaTZxIom518Mi/V3xjjVMskHoqrg1q9kWUHYBUT6n+LN/uGxHX5tHYCUWQavXgRcSNel+6TLzJSOmmGCZmwj2z2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1co3nMIC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1co3nMIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F2B1F00A3A;
	Wed, 26 Aug 2026 08:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787733213;
	bh=BNaj47/TklShXqL/neG/ZVshP4y3Q8obXi+VIhV2lxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1co3nMICbZgU/G2NLhQbWRLLiZzg6SA5tpsX9AcOmv9/VxAVPlwB4zvbDv0vtniFm
	 vb36C5NNuu/Tv88sbiFZTyFDWWViu8uiLpGTQp76W/stUvwBbWx3nTACcwRoMODcAd
	 pdugf8KWPXeDm08cGAl7leT6Ye6YJa1NrL7Ms2cU=
Date: Wed, 26 Aug 2026 10:33:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cheng Lingfei <chenglingfei@foxmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>,
	Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb: gadget: goku_udc: fix kobject warning on probe
 failure
Message-ID: <2026082606-stilt-swan-28cb@gregkh>
References: <tencent_C241874A5406FB9AE72DCEEB8717B208EC05@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_C241874A5406FB9AE72DCEEB8717B208EC05@qq.com>

On Wed, Aug 26, 2026 at 04:26:47PM +0800, Cheng Lingfei wrote:
> goku_probe() calls goku_remove() when hardware initialization fails, but
> the gadget device is initialized only near the end of probe. As a result,
> goku_remove() calls usb_del_gadget_udc(), which drops a reference to an
> uninitialized gadget device and triggers a kobject warning.
> 
> Initialize the gadget device immediately after allocating the controller,
> but add it only after all hardware resources have been acquired. Track the
> gadget registration state so goku_remove() can safely clean up both partial
> probe state and a fully initialized device.
> 
> Use the split gadget removal API and drop the final gadget reference only
> after all hardware resources have been released. Obtain the controller from
> the embedded gadget device in the release callback because driver data is
> set on the PCI device rather than the gadget device.
> 
> The legacy diagnostic proc entry uses a single global name. This causes a
> collision when more than one controller is probed. Replace it with a
> per-device debugfs entry.
> 
> Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
> Reported-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=06ec7624018233e17113
> Tested-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Link: https://lore.kernel.org/2026082616-glue-atlas-0cfd@gregkh
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
> ---
> Changes in v2:
> - Replace legacy procfs with per-device debugfs entries.

debugfs changes should be a separate change, please make this a patch
series.

thanks,

greg k-h
