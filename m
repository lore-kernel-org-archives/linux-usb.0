Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA71F2853F3
	for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 06:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765248; cv=none; b=GB1DMuAZtP4ZV0PxgMHV5FmhabgLPz3kCr3sxWyRz0CN4PBPK/FuAeFqt2GUuMJ60K6T8IjvpO4/z9bg4yqlx1yzEwVtl+0q1WqTsWBjffffXpol9YuakNcnsxomqBO5D1k5qKfL27z9GxhDZvaI1GHPiyPlI1oE9z7C0gcbgzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765248; c=relaxed/simple;
	bh=+ZDIQ7toqSPOBywLh2EuLMWbCnXXYWC/quMQX0SSJhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew6d7xa1Zwp6xSQzvmseXRjp852H/LP8osxR5eW8Aa3OPr0GF5OD+fWV4bhqgbEn448eDciIaHyAM14jG8EvyBWr6PytkRr+p9derXkKJ0yYx7Ul3A+gs8oVxs0nIuAYSDaw2woLNKZjmArBBuRtH1lMKj0z2VPnta3cAkE9JGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TnArtNzk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TnArtNzk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E4FC19424;
	Sun, 29 Mar 2026 06:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774765248;
	bh=+ZDIQ7toqSPOBywLh2EuLMWbCnXXYWC/quMQX0SSJhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnArtNzkML5euVnvo+y4Sz0FTpbo9CJt52SYFcjdVVonlHdkuQ8rvM6iujUKFW1IK
	 5yfvgy+3h6qZ63WSJhikKuU0CbfT4ZIqN90SOlVOVj/Vt+gzuOLwZdP0gdtYb8hi8T
	 4wcL2xJZ1LW5hFI4KNGvwCbsWDWyN5OLuq5QCGi0=
Date: Sun, 29 Mar 2026 08:20:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?Q?Stanis=C5=82aw?= Maciej Molsa <stanislawmolsa@gmail.com>
Cc: peter.chen@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: common: fix all alignment warnings in usb-otg-fsm.c
Message-ID: <2026032944-relic-attach-0786@gregkh>
References: <acgQzzfSTX-5foU-@stanislaw-QEMU-Virtual-Machine>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acgQzzfSTX-5foU-@stanislaw-QEMU-Virtual-Machine>

On Sat, Mar 28, 2026 at 05:33:03PM +0000, Stanisław Maciej Molsa wrote:
> Hi Peter,
> 
> This is my first small contribution to the USB subsystem.

No need for this here.

> 
> Fixed all "Alignment should match open parenthesis" warnings in
> usb-otg-fsm.c, as
> reported by checkpatch.pl
> 
> Signed-off-by: Stanisław Maciej Molsa <stanislawmolsa@gmail.com>
> ---
>  drivers/usb/common/usb-otg-fsm.c | 42 ++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/usb/common/usb-otg-fsm.c b/drivers/usb/common/usb-otg-fsm.c
> index e11803225775..5dcaa6c2057f 100644
> --- a/drivers/usb/common/usb-otg-fsm.c
> +++ b/drivers/usb/common/usb-otg-fsm.c
> @@ -32,7 +32,7 @@ static int otg_set_protocol(struct otg_fsm *fsm, int protocol)
>  
>  	if (fsm->protocol != protocol) {
>  		VDBG("Changing role fsm->protocol= %d; new protocol= %d\n",
> -			fsm->protocol, protocol);
> +		     fsm->protocol, protocol);

Please do not do coding style changes EXCEPT in subsystems that
specifically ask for them to be done in (like drivers/staging/),
otherwise there will be nothing but constant churn in the kernel tree.

thanks,

greg k-h
