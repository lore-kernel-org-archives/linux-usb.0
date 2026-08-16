Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B608A33AD8C;
	Sun, 16 Aug 2026 04:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786856221; cv=none; b=rvs0dMioXgoHvvS3lvHE4+Pejctm0a1NweMYvhDEqvW1FjnoZwSwMhCVM3uT3g59CDnoCPf111a9do9bvwo4hw6KAFbhdXgVmbkHCnGxvXYz9dk0zsJB28u+muMq4j4releFnc9XZz5ZFuL43+4369GTaYc0N/XBKkAUH3dEBfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786856221; c=relaxed/simple;
	bh=MhyNCzJaDkaNxHaDFGYahoV4Nz2Q2XhX6d3cUz0aEFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4ReMKQbGRUJWLrdRcDKvxTlTYZziptKwrJcTF/NYJXJYX/v4Qv02+1FgkkVnozQgDH9kDJXp62zE2g6L0HNtDljwDCzzvOQqUOEfF9TSwDEuWzHXBQEW0U051n/7CZ07qA/toE21CLAS8uFZrh9xRZ+n97vr6ctQJNiJjGF1vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bn/qUflr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bn/qUflr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC9D1F000E9;
	Sun, 16 Aug 2026 04:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786856218;
	bh=far8Zg33o6JShM1nER5ZOGNxMgUkURqqe/pQXx2vUR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bn/qUflrlPH013YdNzua8WQLdI0yU/0EUqBZCwDFOyeDrdnjeUTU80NGtdvR7Bw2D
	 5ukxHzqQU8RDinWV99C0ksCBbqarxoZWH/5xrjHk07yO1qh4+3ew0D8euoLbqTU6HB
	 iGAOQd7UyLoBcTKYKCO9UnbDvWfUhum04Uel2hGE=
Date: Sun, 16 Aug 2026 06:55:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	yuyang.du@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usbip: vhci_hcd: let the driver core manage the sysfs
 attributes
Message-ID: <2026081646-sixties-fade-1359@gregkh>
References: <20260816015051.13184-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816015051.13184-1-kartikey406@gmail.com>

On Sun, Aug 16, 2026 at 07:20:51AM +0530, Deepanshu Kartikey wrote:
> The vhci attribute group is created in vhci_start() and removed in
> vhci_stop(), guarded by usb_hcd_is_primary_hcd(). Both run from
> usb_add_hcd()/usb_remove_hcd(), which are called once per hcd, so the
> attach attribute is live while only one of the two hcds exists: it is
> created during the first usb_add_hcd() before vhci_hcd_ss is set, and it
> survives the first usb_put_hcd() on removal. A concurrent write to attach
> can therefore reach a NULL or freed vhci_hcd_ss.
> 
> Register the group as dev_groups on the platform driver instead, so the
> driver core creates the files before probe and removes them after remove
> returns, and drop the sysfs_create_group()/sysfs_remove_group() calls from
> the driver. The attributes have always been created only on vhci_hcd.0;
> an is_visible() callback keeps them there.
> 
> vhci_init_attr_group() is moved into vhci_hcd_init() ahead of
> platform_driver_register() so the group is populated before the core
> reads it. The attribute array is still built at runtime because the
> number of status attributes comes from CONFIG_USBIP_VHCI_NR_HCS and the
> preprocessor cannot emit a variable number of __ATTR() declarations. If
> statically declaring all 32 and hiding the unused ones with is_visible()
> is preferred, I can respin that way.
> 
> Reported-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=8753715f05759f1a10de
> Fixes: 1c9de5bf4286 ("usbip: vhci-hcd: Add USB3 SuperSpeed support")
> Link: https://lore.kernel.org/all/20260815143241.19047-1-kartikey406@gmail.com/T/ [v1]
> Tested-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v2:
>  - use dev_groups instead of moving sysfs_create_group() into probe (Greg)
>  - add is_visible() to keep the attributes on vhci_hcd.0 only
>  - move vhci_init_attr_group() into vhci_hcd_init()
> ---
>  drivers/usb/usbip/vhci.h       |  1 +
>  drivers/usb/usbip/vhci_hcd.c   | 37 ++++++++++------------------------
>  drivers/usb/usbip/vhci_sysfs.c | 19 +++++++++++++++++
>  3 files changed, 31 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
> index 5659dce1526e..844500e3b0ea 100644
> --- a/drivers/usb/usbip/vhci.h
> +++ b/drivers/usb/usbip/vhci.h
> @@ -121,6 +121,7 @@ struct vhci_hcd {
>  extern int vhci_num_controllers;
>  extern struct vhci *vhcis;
>  extern struct attribute_group vhci_attr_group;

Is this still needed here?  And can't it be static now?

> @@ -1565,9 +1546,12 @@ static int __init vhci_hcd_init(void)
>  
>  	return 0;
>  
> +

Extra line?

thanks,

greg k-h
