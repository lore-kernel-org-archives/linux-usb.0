Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042B21A294
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 06:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775198299; cv=none; b=pYMR4j89DTn+6wJQPVyBvDE1mN4ZJUW1RVh7FVZebCKEQ5f7CXgYO3hMD82EMS/Tj9N0t8RaE6YL7FSQRwsweBMqb8UKtXMvCqC+2UAyjuNJjTVABu9nz2Eo4+BoSJ9/Bea+PfmGVFioXTidMICI4Jsg1+tokKQuy9jlmj19wlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775198299; c=relaxed/simple;
	bh=5OVq/IdFI9V/D93LbYYatxZeTE7xlGqaJRoluzNMdOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rr0wv6AvjIxDYryn9i3nkMfVUNunkBYQ28PPc7ZxC+SKUP6CLzQRcA1Bb/h/wCk0THdttQUrkgVhVQbSKTcVay5R3MQFA0nicEQOkHnS9VnMEXNc57SrqCGCdpHHL5V1UIbjIMMQ+E4htJ9QM7LnaAcwmKaHjcLBt4uO50KNATc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mHfefxwL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mHfefxwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FAFC4CEF7;
	Fri,  3 Apr 2026 06:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775198298;
	bh=5OVq/IdFI9V/D93LbYYatxZeTE7xlGqaJRoluzNMdOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mHfefxwLsFqdGRHlyXpSNKbQukiTjqN6/FJnCv5/lyzvgbzXpN+Vfn6maBdToT72x
	 qOg+Shb3y0xCTW5LPF4KaeQ+h1rGHAB30yBUaUE3tIeewrrev7WkJrfc+XICTkwHQa
	 DbgcF7IXtc1yI2b3+gnp2WFbWg2Xa64AjGTj+nYI=
Date: Fri, 3 Apr 2026 08:37:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing] BUILD SUCCESS WITH UNVERIFIED WARNING
 25e531b422dc2ac90cdae3b6e74b5cdeb081440d
Message-ID: <2026040343-gnat-aqueduct-753c@gregkh>
References: <202604031342.WrjEctjz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604031342.WrjEctjz-lkp@intel.com>

On Fri, Apr 03, 2026 at 01:18:52PM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> branch HEAD: 25e531b422dc2ac90cdae3b6e74b5cdeb081440d  usb: xhci: Make usb_host_endpoint.hcpriv survive endpoint_disable()
> 
> Unverified Warning (likely false positive, kindly check if interested):
> 
>     drivers/usb/typec/tcpm/fusb302.c:1790 fusb302_probe() warn: 'chip->gpio_int_n_irq' from request_threaded_irq() not released on lines: 1779.

Nice, this is an older issue, good catch!  But not directly related to
the change that is currently in this tree at the moment.

thanks,

greg k-h
