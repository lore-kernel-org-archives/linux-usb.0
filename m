Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EFE31F9B9
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232555; cv=none; b=mrR/Y/luCTrcHVSDBF2JcvaZBVHZtVht+dx7oPX15GByN0DGkzmt1ATxKvuZyNE90E+beJI1TLUUbskPBtIyhi0I8llstEe1gTK8Bnxo8VkxMPwWBzkBNHms+9xkbLzNkeXVH4S6bQxc7SsnFehFhcPiO/lk8uWt3y6pLtw6Q2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232555; c=relaxed/simple;
	bh=bRH42KYXdwL1T2cf8rRdMe6bM4LlNCASgHS1XXC0voc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbHKw20tyUy4l1gIdJHewhHXRXBVGtaiKTCsbD2XgxbYbjJyGqHzVPUv+Tmgalmk/fRq+n2lRYXZDwsKwEzAnYwFFlI0e6TbpYXqDPPNlisxZxPKWmxkXt87rb5WAjwZ033hoC2QgCHmqkaGz55/yGafncZHX8sLTYpyGfzoMsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C8Wbagil; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C8Wbagil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31303C4CEF7;
	Wed, 11 Mar 2026 12:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773232554;
	bh=bRH42KYXdwL1T2cf8rRdMe6bM4LlNCASgHS1XXC0voc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C8WbagilqRbol7famfrOuNntPFiWCPgUh7FB8qWQzm9OTi2ZeejJMhDCLbx34fh1R
	 HrQFMjI8nwm1O8Fd+Z7xSCzVSS52cTaSd2+h3idsRSVpK/1xPATVo6uYvqNAhtStrv
	 A1VYfOe18qSmWFnfs9O3sRtz/xr207SWO6UR5LRU=
Date: Wed, 11 Mar 2026 13:35:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nils Reuter <nils.reuter@gmx.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: storage: UAS: ignore UAS on Realtek RTL9210B with
 firmware f0.01
Message-ID: <2026031146-acclimate-attic-d402@gregkh>
References: <151d1ec4-275a-43d6-bc06-26e013695b7b@gmx.net>
 <2026030817-cupping-reason-0bb9@gregkh>
 <1b015499-70b0-47c0-8600-4fb1555f9978@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b015499-70b0-47c0-8600-4fb1555f9978@gmx.net>

On Sun, Mar 08, 2026 at 08:37:28PM +0100, Nils Reuter wrote:
> Hi Greg,
> 
> Thanks for the feedback. As requested, here is the patch to add the UAS
> quirk for the Realtek RTL9210B (bcdDevice f0.01).
> 
> Regards,
> Nils
> 
> ---
> 
> From cb1f8118e802be51a06f4564bb01f91110a51b53 Mon Sep 17 00:00:00 2001
> From: Nils Reuter <nils.reuter@gmx.net>
> Date: Sun, 8 Mar 2026 19:39:21 +0100
> Subject: [PATCH] USB: storage: UAS: ignore UAS on Realtek RTL9210B with
>  firmware f0.01
> 
> The Realtek RTL9210B (0bda:9210) with firmware version f0.01 suffers
> from UAS protocol hangs under heavy I/O load, leading to device
> resets and read-only remounts. Disabling UAS via the IGNORE_UAS
> quirk stabilizes the connection.
> 
> Signed-off-by: Nils Reuter <nils.reuter@gmx.net>
> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 939a98c2d..f17469f8c 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -90,6 +90,13 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_LUNS),
>  
> +/* Reported-by: Nils Reuter <nils.reuter@gmx.net> */
> +UNUSUAL_DEV(0x0bda, 0x9210, 0xf001, 0xf001,
> +		"Realtek",
> +		"RTL9210B",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),

This is a VERY heavy hammer for this type of device.  You say that the
device just starts to time out, which implies it overheats or something
else?  Are you sure that slowing it down like this is the best overall
solution?  What does other operating systems do for this device?

thanks,

greg k-h
