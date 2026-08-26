Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2D3C3F55;
	Wed, 26 Aug 2026 10:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739696; cv=none; b=EWXrinbFrThickm+03fQYop2cNzi5qaRt3uCt+ivSaVYPd9rP12saOlJSmzPkOt99lg96+R9RBtOwTIGpo1b/8LJcr0HKoKwpWIH4lxaIZKrF5x1HnZV8qbAMBzml+wu7gl70/Oc2SZKmQ26/m1J1XwlEtr4OIFSewzLxvGiIkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739696; c=relaxed/simple;
	bh=UVp4eEUa3OBsqN1sfCyvrXEitEdgeULWxm/3Io+S/y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIGk8ehm8GgyqF5gNucGZzM7YaS6YXL3Rbt1RaY4gOj9d8fm55XcEsiLXjE3/HaKLBWbc05o1RqdpS9pmCsWDqSZM2xD0PWfZlbvbkIIpU0eyc3VTH3DMyerlJXd74RBzvROncrV1mF9qWzrhmCqVeZnn6rZwFv3LH1c5Jyy//I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vnYdkGIp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vnYdkGIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B236B1F000E9;
	Wed, 26 Aug 2026 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787739695;
	bh=WY0Nhlgpz1kxGx3DszuZB0nWwfWoSsWiEzoOjFsfWlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vnYdkGIpADdbk6gK6LKIJP0howBcRzeHgwB7ssS79NtmgurmMb9BH04W8RlTOjNqz
	 jNLqrRy93dd3UoZiUiR1Ig0EKzlQLxS3Z+TYpM7K3TaHplXhR61KxpOuNKeAKdXjsD
	 jWQXud81FarOwuAaQeMRGBeuRqbe2o2SMLtGFAJg=
Date: Wed, 26 Aug 2026 11:25:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cheng Lingfei <chenglingfei@foxmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>,
	Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] usb: gadget: goku_udc: move debug output to
 debugfs
Message-ID: <2026082625-stoneware-trailside-ff19@gregkh>
References: <20260826-b4-fix-usb-v3-0-b28366e817f3@foxmail.com>
 <tencent_D7673CCE71B03F2C90CD60873AB4A245D808@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_D7673CCE71B03F2C90CD60873AB4A245D808@qq.com>

On Wed, Aug 26, 2026 at 05:15:06PM +0800, Cheng Lingfei wrote:
> goku_udc exposes diagnostic state through /proc/driver/udc. The single
> global proc entry collides when more than one controller is probed and
> triggers a proc registration warning.
> 
> The data is intended only for debugging and is not a userspace ABI. Move it
> under the USB debugfs root and use the PCI device name for a per-device
> directory. Create the file only after the UDC has been registered.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Link: https://lore.kernel.org/2026082616-glue-atlas-0cfd@gregkh
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
> ---
>  drivers/usb/gadget/udc/goku_udc.c | 47 +++++++++++++++++++++++++++------------
>  drivers/usb/gadget/udc/goku_udc.h |  5 ++++-
>  2 files changed, 37 insertions(+), 15 deletions(-)

Slow down please.  There's no rush here at all, and by flooding us with
new revisions it doesn't actually allow anyone to review previous ones,
AND it shows you are just pumping out LLM-generated stuff without all
that much thought.

Please wait a few days at the very least before doing new versions of
patch sets.

As pennance, please go and review some outstanding USB patches on the
mailing list, to reduce our review load :)

thanks,

greg k-h
