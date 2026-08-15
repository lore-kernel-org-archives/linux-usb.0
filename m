Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292291E5714;
	Sat, 15 Aug 2026 15:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786807940; cv=none; b=QsUQOati7TA/zgJMod53FajutxgOYAQvHeX1ODiZfVLIST/cSJIr7wXo5olLJYKLDoikEVrh7hEZfVYG21rHUJogahc70bNEUjXeH/Hhsmwxpq2Iuuo85t9dybv9BmKc5OUR8oA4Ji8Jh6KVBee4MMB5onlWsBKzgw7TmeaN6ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786807940; c=relaxed/simple;
	bh=Eji7ldzpRrkmsJeo9i6bWoKzxZLoL35fzJ/ptcA/YyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDdd2/ahd8Iy5qtxQCEhNYNEqM6+IIYGi/3a9kJw8a6o8tNXvb+e0pho8v2ghZCr8WZvMI8N1g8WAbfrAWiOyN9ASPRfoaxquRqajoZsU7MiMSB7J736vFwPSF9YgBnnM4JRH2gBs7abiPkUHUbxY2S10RitQTpQd+p17+OTwbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jNXAVCy0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jNXAVCy0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153231F000E9;
	Sat, 15 Aug 2026 15:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786807938;
	bh=athBiWXK7o/OUtPIjrPxy7jQNBNr8F8t4mbOUSOG6DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jNXAVCy0/AOb25WZ42wKIFvjMJ7z5ffhEy6CH+x+hULp5wjUSuksLjn+thje7+27J
	 x3GDnCf1B7ofMXPJFy2jJT5cQ+zVYtsXGDM7iAsAkb5rJ/55PtX42e66BVObhDqopS
	 /XtdinqQviw8G3ogNEvzJq8Gajr/FbdkxrWwdwko=
Date: Sun, 16 Aug 2026 00:30:41 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Subject: Re: [PATCH] usbip: vhci_hcd: move sysfs attribute setup into
 probe/remove
Message-ID: <2026081618-october-hungry-39a0@gregkh>
References: <20260815143427.19066-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815143427.19066-1-kartikey406@gmail.com>

On Sat, Aug 15, 2026 at 08:04:27PM +0530, Deepanshu Kartikey wrote:
> 
> The vhci sysfs attribute group is created in vhci_start() and removed in
> vhci_stop(), guarded by usb_hcd_is_primary_hcd(). Since vhci_start() and
> vhci_stop() run from usb_add_hcd()/usb_remove_hcd(), which are each called
> twice, the attach attribute is live while only one of the two hcds exists:
> it is created during the first usb_add_hcd() before vhci_hcd_ss is set,
> and it survives the first usb_put_hcd() during removal. A concurrent write
> to attach can therefore reach a NULL or freed vhci_hcd_ss.
> 
> Create the group at the end of vhci_hcd_probe(), after both hcds are
> added, and remove it at the start of vhci_hcd_remove(), before either
> reference is dropped. sysfs_remove_group() drains in-flight store
> callbacks, so no writer can be inside attach_store() once it returns.

If you are going to move the creation, please do so in a race-free way
and properly make the driver core control this by setting these up as
default attributes.

A huge hint that something is wrong in a driver is when it calls a
sysfs_*() function, like this.  That's not ok, so either it is doing
something out-of-the-ordinary and it requires it, or it's broken.

WHat has recently changed to make this start to fail now to require this
change?

thanks,

greg k-h
