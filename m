Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171366;
	b=EdSL58Udgl+CoceL/EUdZX4q+7fxTyzkILMuFWU8SejHmw3+Z+kWkaTMlDQgXz2uvfIR
	 CK8T0IZiccbwM6Sqd+uBU1KqBl1duoHlEFbqf8g1JpgV6zqjA3ZRQk+1h3ofmJlzF9L4m
	 P1VxKLnUbADxPYOO27oCRkyPHAsxUDd7aUnit4EmZ0BIJKiU0TinQ3NM2HQFL44o0SjXH
	 uNK4pwr8TnFfW2TZ9ELJ3DHBXEK+EuPJc/1gB5dJMR24aAUYyW1T+1R0/U/5dxp5Pzz9h
	 yU2d9Vu6dT/zwXul5IoeXurNCD/vvN+0DAOHkhzn+caKUx+CJE69EVymgYZ/QHEGPdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171366;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=i27LfaNCo6L8lqdeZdS9ei4mCXE8bw98UFsYkeacv/E=;
	b=Yillojq01cBpLTb4I7uzwiY5OmtVIlPm+6wYFzTqxxvlzEkwZTSLLiNIFb7+m/1huRf8
	 PezQaOlPpy08AFmYTOApuTHu+HDxXQKBaKweCEcorHam2E4LMMj2dkRjMYVLywcNbafR6
	 RbHaWq0yasJYoXCwheE6NGVfgHURzv0kvlVeXA9YMqAHQxhs0wGui4dzi7Eu2bLzcMdZO
	 hnkD4xpsAil83M0mpdAJgxFJnrHwG2SyiCVkiCp0SBD8u9Cny3ch2c2NNQ/pkuqrXnrnv
	 agw0mCygvYW39IH1elzhsZEn2sgS9wTmjG0b87TQT7Je3EBO4nnmgeMJZ9o6up4iT8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yG7GqPDi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CD3606A320;
	Fri, 20 Nov 2026 10:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yG7GqPDi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96101F000C4;
	Fri, 20 Nov 2026 10:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795171365;
	bh=i27LfaNCo6L8lqdeZdS9ei4mCXE8bw98UFsYkeacv/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yG7GqPDi/h4aSGc7pQAc6VYvpp92r2mH7Wo/niEwhvOqRq0bLJSKykIm1O3bJ/ZmQ
	 EcrrkipTWiSH84gWq1XlDSHpXBuWSCj6WGfqXMaTWNajJkVcHdpNLc+mP5ZzhwYxSh
	 WRyhVqhYNv5R1w5ugWxaj9dpI5+oEB0LVvGBHiKY=
Date: Fri, 20 Nov 2026 11:42:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hui Peng <benquike@gmail.com>
Cc: Chris.Wulff@biamp.com, david.sands@biamp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: gadget: f_hid: don't call copy_from_user()
 under get_report_spinlock
Message-ID: <2026112029-headgear-shortcake-14b0@gregkh>
References: <2026091905-humbling-swooned-c371@gregkh>
 <20260919110050.3764064-1-benquike@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919110050.3764064-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 11:00:49AM +0000, Hui Peng wrote:
> f_hidg_get_report() already copies the incoming struct usb_hidg_report
> from userspace into the freshly allocated 'entry' before acquiring
> hidg->get_report_spinlock.
> 
> When a report with the same report_id is already present in
> hidg->report_list, the update path copies from userspace a second time,
> this time directly into ptr->report_data while the spinlock is held with
> interrupts disabled:
> 
> 	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
> 	ptr = f_hidg_search_for_report(hidg, report_id);
> 	if (ptr) {
> 		if (copy_from_user(&ptr->report_data, buffer,
> 				sizeof(struct usb_hidg_report))) {
> 
> copy_from_user() may fault and sleep, so this is a sleeping function
> called from atomic context, reported by CONFIG_DEBUG_ATOMIC_SLEEP as
> "BUG: sleeping function called from invalid context". Userspace can
> reach it at will by issuing GADGET_HID_WRITE_GET_REPORT twice with the
> same report_id on /dev/hidgN.
> 
> The second copy is also redundant: the same user buffer has already been
> copied into entry->report_data a few lines above, and report_id was
> derived from that copy. Assign from the already copied data instead,
> which removes the fault from the critical section and makes the update
> atomic with respect to the list lookup.
> 
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> v2: Add the Fixes: tag Greg asked for.
> 
>     f_hidg_get_report(), the spinlock and the copy_from_user() call under
>     it were all added together by a139c98f760e ("USB: gadget: f_hid: Add
>     GET_REPORT via userspace IOCTL"), first released in v6.12, so that is
>     where this starts. git blame on the removed lines agrees.
> 
> Found by inspection while investigating the use-after-free fixed in
> patch 2/2, and build tested only; I do not have HID gadget hardware,
> but the path is reachable from /dev/hidgN with dummy_hcd.
> 
>  drivers/usb/gadget/function/f_hid.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -668,13 +668,7 @@ static int f_hidg_get_report(struct file
>  
>  	if (ptr) {
>  		/* Report already exists in list - update it */
> -		if (copy_from_user(&ptr->report_data, buffer,
> -				sizeof(struct usb_hidg_report))) {
> -			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
> -			ERROR(cdev, "copy_from_user error\n");
> -			kfree(entry);
> -			return -EINVAL;
> -		}
> +		ptr->report_data = entry->report_data;
>  		kfree(entry);
>  	} else {
>  		/* Report does not exist in list - add it */
> -- 
> 2.43.0
> 

Series does not apply anymore, can you please rebase and resend?

thanks,

greg k-h
