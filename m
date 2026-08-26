Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7081F2D94BA;
	Wed, 26 Aug 2026 02:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787711396; cv=none; b=TtOZVU6sVIp+UudvhoVzdd/zdVCYxfosmH/hxLDo/BDXOGfaZdiru6oWb9tWHRbUKxPN+icAcpjBvhIkbimzZvRS0z+hvCQK129Gd42NWv2IPLHG5IuS4JR2Suz/24Fx1JjdkKdi5+LUJDo4k9CdFNKU6qwC9+k6Jz0DJ5V8+x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787711396; c=relaxed/simple;
	bh=X2ec9v8RPCMda8wVyRX/2lZAFeiR6yn8kMoM7ghLQwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvPbE2fRoAm7KdddTJFEbmZApDFBCVIRPN2cSLioXUrGhLzHMIFUhiG/vcqmVAQr89KhSlhN7dkpjLbqrhg2LK/ZKDKPPPFUHnhpdAiWUKfGUdkIkzXKH5WXZ0cRAtyNXV4dzLPhx6B5/4EyiROQp/e6HObpKEkN75ZsB4wsL84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfEFPMiG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfEFPMiG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A391F000E9;
	Wed, 26 Aug 2026 02:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787711395;
	bh=LvvSjxsE/3Zh4EU/6GDU0Z9Y1XZ0BSrpsU7F1TSPU/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SfEFPMiGzmfAwQZNZYEFtCQeSgPFehjKGNhNMga85Sm3S2LEtH3epm5/RbY5y/Fyu
	 ktyywc+gTMo2PCcPki8k8htkitJ3+h5ysJKTBpthrvKoSl7O6enBxjeQdYVr0hRR/G
	 heXr9tMW7GNwDBqABGmdmvjKSXKZX0W/OgzDnf/ku9s+eB/aSZLeiTo6tJzPryF6lQ
	 nt1WMlx12xTLnVefE4eHpZvGI1RE/jKqVrN9mf8SpcPFjXM9wjRr/NKzIYRybki2Kv
	 wtRHW8A7KOl3uwDykF/QvE1WcS1jE9uq0tUfyffBj5197hewEBQ3+RO62N/LeRdUWN
	 W9sQPs+SIBHYA==
Date: Tue, 25 Aug 2026 19:29:53 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: pawell@cadence.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: cdns3: Fix NULL pointer dereference in
 cdns3_pci_probe
Message-ID: <ao5PoUihfGkPGeSJ@hu-petche-lv.qualcomm.com>
References: <20260810023626.70669-1-dengjie03@kylinos.cn>
 <154cb7e0-f2ae-4ed4-b661-0904a12b9e06@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <154cb7e0-f2ae-4ed4-b661-0904a12b9e06@kylinos.cn>

On 26-08-25 14:50:55, Jie Deng wrote:
> Hi Peter,
> Thanks for the review.
> I've sent the v2 with the Fixes tag updated to 7733f6c32e36
> ("usb: cdns3: Add Cadence USB3 DRD Driver") and your Acked-by
> added, per your suggestion:
> 
>   v2 patch:
> https://lore.kernel.org/all/20260810023626.70669-1-dengjie03@kylinos.cn/
> 
> Could you please help pick it up when you get a chance?
> Thanks,
> 

Hi Jie,

Usually, Greg will queue it.

Peter
> 在 2026/8/10 10:36, Jie Deng 写道:
> > The Cadence USBSS controller is a two-function PCI device. The first
> > probed function allocates the driver data and stores it with
> > pci_set_drvdata(), while the second function reuses it via
> > pci_get_drvdata() when pci_is_enabled() reports that the first
> > function has already been probed.
> > 
> > When the second function is probed while the first one has been
> > enabled but has not yet set its driver data, pci_get_drvdata()
> > returns NULL, and the subsequent wrap->devfn assignment dereferences
> > a NULL pointer and crashes the kernel.
> > logs:
> > Call trace:
> >    cdns3_pci_probe+0xa4/0x300
> >    local_pci_probe+0x44/0xa8
> >    pci_call_probe+0x54/0x158
> >    pci_device_probe+0x84/0x100
> >    really_probe+0x184/0x3d0
> >    __driver_probe_device+0x80/0x178
> >    driver_probe_device+0x44/0xe8
> >    __driver_attach+0xec/0x1f8
> >    bus_for_each_dev+0x7c/0xe0
> >    driver_attach+0x28/0x38
> >    bus_add_driver+0x110/0x238
> >    driver_register+0x64/0x128
> >    __pci_register_driver+0x50/0x60
> >    cdns3_pci_driver_init+0x28/0x38
> >    do_one_initcall+0x5c/0x280
> >    do_initcalls+0x104/0x1d8
> >    kernel_init_freeable+0x140/0x218
> >    kernel_init+0x28/0x1f8
> >    ret_from_fork+0x10/0x20
> > 
> > Return -EPROBE_DEFER in this case so that probing is retried after
> > the first function has completed its probe.
> > 
> > Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
> > Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
> > Acked-by: Peter Chen <peter.chen@kernel.org>
> > ---
> > Changes in v2:
> > - Fix the wrong Fixes tag: 8bc1901ca7b0 was reverted, use 7733f6c32e36
> >    which introduced the driver in the current tree (per Peter Chen's review)
> > - Add Acked-by from Peter Chen
> > 
> >   drivers/usb/cdns3/cdns3-pci-wrap.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
> > index eb5760f75b9d..fd06a3d8e638 100644
> > --- a/drivers/usb/cdns3/cdns3-pci-wrap.c
> > +++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
> > @@ -96,6 +96,11 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
> >   	if (pci_is_enabled(func)) {
> >   		wrap = pci_get_drvdata(func);
> > +		if (!wrap) {
> > +			dev_err(&pdev->dev,
> > +				"second function not initialized, retrying\n");
> > +			return -EPROBE_DEFER;
> > +		}
> >   	} else {
> >   		wrap = kzalloc_obj(*wrap);
> >   		if (!wrap)

-- 

Thanks,
Peter Chen
