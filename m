Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B213DE422;
	Fri, 17 Jul 2026 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281307; cv=none; b=j7vGwVTI37fdkODPt+7fOu6AiFtXK54nzvVeHW7g75iVouPMvm9tYSxvrmHNT2cNGFC45aX+CMfEIA/RxUlxspcSSmqR0Bf+PF9KCUykE0bMceBo9aUdIyQvv6REle2bc3efCEPJfo3uFe66V7QOD7HwAcN511nyONYwiyY2d/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281307; c=relaxed/simple;
	bh=GV0zviMoOu8Vm1gSwn+SpP2lAjWz6TnrvYNSO74hTaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFmMz+NU0Bp0ynWRQeLi7FOkOJ9rh3gTdRph5Zfb40KQsKARH0wXEGFOHCNQRYQz/TTN9Kwp4BJYmHfqTOmM6NvcBfNW6M0/KC1tH2Ux/I+wmk4+se9ud59c7BucQ1ENRtfqW1HmqORQfSmZ/UnnYDowEM3qoEPVOOmXV9YqwNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wq3K8De4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wq3K8De4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77001F000E9;
	Fri, 17 Jul 2026 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784281302;
	bh=guPbzmrU4iS3rprn5iaP2GTAPMra4tLZXicDrTJ2iSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wq3K8De4ZF5ZNXxn7loXDKQ00nFtu4k5gnp6xbseG2ldVvx8bScir4oPurp/CAKEf
	 jKi1HiLzPQfF86zkIywnmASBbwc7Cjgcw/rIar+C4N9X+xInHOeSz8dtwPzjl5cjSB
	 Vl7U/MziJQ4QEcioNSOfgEP2QHWliCuZVBrhwDCk=
Date: Fri, 17 Jul 2026 11:41:34 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Lucas Martins Alves <lucas.alves@lumal21.com.br>
Cc: "b-liu@ti.com" <b-liu@ti.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Message-ID: <2026071708-tamale-regroup-2a9a@gregkh>
References: <20260716142516.510574-1-lucas.alves@lumal21.com.br>
 <20260716170551.566933-1-lucas.alves@lumal21.com.br>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716170551.566933-1-lucas.alves@lumal21.com.br>

On Thu, Jul 16, 2026 at 05:05:54PM +0000, Lucas Martins Alves wrote:
> From: Lucas Martins Alves <lucas.alves@lumal21.com.br>
> 
> The DSPS glue layer (used on TI AM335x SoCs) was missing implementations
> for the vbus_status and set_vbus platform ops defined in struct
> musb_platform_ops.
> 
> Add dsps_musb_vbus_status() to report VBUS presence by reading the VBUS
> field of MUSB_DEVCTL, and dsps_musb_set_vbus() to drive the SESSION bit
> on MUSB_DEVCTL, enabling or disabling the USB session.
> 
> Register both callbacks in dsps_ops to allow the MUSB core to control
> VBUS on AM335x-based platforms. This enables the USB core to perform a
> VBUS power cycle as a recovery mechanism when a USB error condition is
> detected, and also allows userspace to control VBUS state via the
> standard USB sysfs interface.
> 
> Signed-off-by: Lucas Martins Alves <lucas.alves@lumal21.com.br>
> ---
> v1 -> v2:
> - remove musb_root_disconnect() from set_vbus path
> - adjust context->devctl copy/update handling
> 
> v2 -> v3:
> - fix patch description text
> - fix devctl usage in set_vbus path
> ---
>  drivers/usb/musb/musb_dsps.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

I'm confused, what about patch 2?

THis series is all intermixed, can you start a new thread, and send just
what you want reviewed/accepted here?  I'm lost...

thanks,

gre k-h
