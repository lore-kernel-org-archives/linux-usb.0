Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D847B427A06;
	Fri, 10 Jul 2026 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688516; cv=none; b=ldbVtcUpRYMZNMOHNdhAihzSwC6uf3NLbjq5B6SyKBtGuTF4YFS3E53Z+YYoJZ1tih2Ni4G1GhK0HjZkDJLcc7naO6eg2xvl/0lB9BQy9Rh5qi9pegezGxNoJxa3fHlVQ1P8IaAv2yEY2x6o1jf3F6XmtuSt1mD07o6F8HezoCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688516; c=relaxed/simple;
	bh=naBSgSsdNczJynwWDjCGA2KrYCLn/VkkMrlv+Fc11Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkCWHht/kfYsttt23vYaSX2aRf2rSmQFTCY1GBhnct8UGAeLsb3keQaYzje/shKb5oKUrdYBW3M13JU/8i4BwKDJG6HnC8ap93WHKyHJQXC+oRBlMsKHp1eQPJpVuD1qiWkjMUcv5M0A5reO447PYlxA5oIPKBaBffNIfXGPNEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zHodGhXk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zHodGhXk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B101F000E9;
	Fri, 10 Jul 2026 13:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783688515;
	bh=F1ZWnFOrXOxZxy3sJ43TmDMf7fwXM0kMBuFZxqj0plU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zHodGhXk4dTcgHwcs2w7kcHXUbDuiYaItk21FMcYWzZrrbabYuPGRcoqKeUFE3fhB
	 K76o4AVKbbEIbzTywHuphyb/dsjnXUKeFFd3e7NhEzfDYNxIE0EflJY9iq2FM0rppK
	 Fc7BBFKtjCptxCOMe3GClXL11z/H0zsXGC3AtAZc=
Date: Fri, 10 Jul 2026 15:01:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: Notify through uevent when not enough
 bandwidth available
Message-ID: <2026071031-chasing-booted-ecc2@gregkh>
References: <20260615-usb-notify-not-enough-bandwidth-v1-1-09ee5098b42d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615-usb-notify-not-enough-bandwidth-v1-1-09ee5098b42d@collabora.com>

On Mon, Jun 15, 2026 at 10:35:33AM -0400, Nícolas F. R. A. Prado wrote:
> Currently, when a new device is plugged in and the host controller can't
> find enough bandwidth for it, an error message is printed:
> 
>   usb 1-3: Not enough bandwidth for new device state.
> 
> In order to allow userspace to react to this and suggest the user to use
> a different host controller, send a uevent with
> 'USB_NOT_ENOUGH_BANDWIDTH=1' to the root hub device.

Where is this new user/kernel api now documented?  And what tool is
going to be looking for it?

thanks,

greg k-h
