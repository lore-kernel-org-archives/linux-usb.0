Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D6E3546FC;
	Fri, 21 Aug 2026 15:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324772; cv=none; b=JrFHh8Z4m11Xrtk6mFGDadVdoZdCkYW/vFaG0DIQN5Y1KLZ1ZybZVi9BxkeJqamaRy1Mg9HuQfCeLvPxr6UDJXVzmqPhj9eQ+kZoF4ez7oN0RVyxLWP1YK4m2vmN6dgROamASo3HkmHT08I6iq9xOO/76iuCpZi0brFz4ecuCi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324772; c=relaxed/simple;
	bh=ATqsCn8CIyieafKlPL7SKQxY6LSdQzvLK4x4fwN/ARc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPNAfiyh09he1CVj7G1iZ4B3fNXOBTolS0eBbX3PUZsK9Yo8ePUzRI0U2O1pZUpBPsMrxJWXPVFAch11HK7wI7ch8b9YIlAr9ZA3XjOxDtwVjM4BLiReIPGvPj/Jpd/khwiMe49eoe/5rp+ktVW+hvG5x2TIJL6oodbhnAvljC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AI8x2g3+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AI8x2g3+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030A11F00A3A;
	Fri, 21 Aug 2026 15:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787324770;
	bh=9gIcBI9ruMhnKGGGZHlRpIBn4//yPplIM159n1p9u8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AI8x2g3+DXtYW6/PZIS9bsgcnB/pTgXSHxbvPx8GEJGzAREhadyHSglWF4SKMOUsz
	 Z/1FOlhNOjRVhcb03i9xgscPvUUX5bc72/3MVK0Sb3uZTx/QdBr/Gr6WKeMmZOg7tl
	 mGzQeTp149PP6kSG0qir3V1iJpqTsIB290oFyG90=
Date: Fri, 21 Aug 2026 17:06:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: heikki.krogerus@linux.intel.com, pooja.katiyar@intel.com,
	johan@kernel.org, pmenzel@molgen.mpg.de, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+23cf45a9fce78e4e0dc1@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: typec: ucsi_acpi: fix NULL pointer dereference in
 ucsi_acpi_probe()
Message-ID: <2026082119-footless-morbidly-8bba@gregkh>
References: <20260821121909.13556-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821121909.13556-1-kartikey406@gmail.com>

On Fri, Aug 21, 2026 at 05:49:09PM +0530, Deepanshu Kartikey wrote:
> ucsi_acpi_probe() dereferences the ACPI companion device pointer
> returned by ACPI_COMPANION() without checking it for NULL. While
> this driver is normally probed through ACPI device enumeration
> where a companion is always present, a platform_device can also be
> manually bound to any platform driver via the sysfs 'bind' file
> (bind_store() -> bus_find_device() -> driver_attach_device()),
> which matches purely on device name and bypasses ACPI matching.

Again, if someone does a manual bind, they get to keep the pieces that
break if something goes wrong.

I should just add a taint-flag to the kernel for this.  Well, maybe just
for unbind.  But really, don't do this on random drivers, bad things,
like this, can happen, and are in fact, guaranteed :)

thanks,

greg k-h
