Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793585211;
	b=TC/fM0uUYGMbOVnkT/uz2+v7cvGe2GYcobABgepOIRAnT0faxV9uvaT2iTXlI4dE9pNW
	 0EUBE77/bsaY57aIkV1IitqC3Zz7rXtzGsi9SffvFRzyhtAnXx30054ZjH2zm4P1998hL
	 /qQJmKW7yZbbMjIWlSBXAYcLIW7yxHoglS5JkrpzqTuM8DN7WW0z09+SLm/gHRITp7y8f
	 LPW+IYo3Ie1dovqtDNmm6xpEztJUiOWceBc1WvzCdDR09lhcTGpGDzTj3T0ngwqZpgjCs
	 9u0usK0MAXsKhxuS6oGDs6DVt5EZr3IbWF0+fI7yq2gkjx1o+/CXIqgpKJmhxMfBukw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dcFBFWUE+FcI5MXNPVjGcIjPvakXuwpZdE8kWcsdxrU=;
	b=mKFGDRvksZg+4tNi3TIL89Iur61Ue7+HF7Lc3lbbUx/0iFqIEnrkT0SxWPQJeLpTO4jI
	 8drrWVIsWw/lHrl3WDJfY3qQ56nZVc6mBvM3GYG7Htrp8+Ay+whVUkb4C12Dn/+IioPfp
	 1Kn6Kb/uJpjGMZT37qB+gWS1+KHPA9FKXGhKqvM6xZHY+ZVmcBcqwZN5nMW4Zq7TgYAod
	 kSP+KGxorm0PZ7x8wpI3fX486daJfz3fFoR7wBGG5HefEwNcLkmggwU9J6ugPIyoxqqRc
	 BKxWgOXDxz8f5DdV+KELJl8U1nTvSguNHX7lb3gjlcaowyYp+LPinIA1VTTnPzS9+rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eI1I54pP;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB84F606A326
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 02:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB84F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eI1I54pP
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c79f306e9so29994146d6.3
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 18:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793585210; x=1794190010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcFBFWUE+FcI5MXNPVjGcIjPvakXuwpZdE8kWcsdxrU=;
        b=eI1I54pP4sNRU18kmigYVKdzA2j7INmfP0pOhyIJWUWyn9HdGjuny2p01+EFx3KVIP
         OlJzSU3Bc2Z1OHFSXrFpt8z/SVF3c3RAdiOl9neXox4aRXrCKmqbBF5eP1kA+N7T036V
         6neDfF9UZcv7j65OJmRtRESZ7YS7+rod7BKwV6Wj9zYcF/eVzxizLT4BDwRltIXJFWcS
         cgaQYjDk7VzmrQ0gsomdizXfiblBjmxcoK3vWhDzkSo5p1GcOZTuwnNaQeC5QywTB2z6
         uxbqPZwHqL04oSubPrJPjJw/ZKPE7OolOMj3YCNsh0g4czSaxTjlTc5K8HL26r8s9VAI
         DsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793585210; x=1794190010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcFBFWUE+FcI5MXNPVjGcIjPvakXuwpZdE8kWcsdxrU=;
        b=A6fT4LdPry+9IZZhM5AezrZgLAksT3qcnxA/cdbt5LysNgI76Q2STqIoBc/Z4epB93
         H6I48ewA8ry4t4ok0WrKpaijClI2sxgZPxQRTjvwvTg5sjgQVkaxusoPJOcGRt4otXuL
         kBzhk1NRxZ+G39BGAFAhzQZ1OSG2GrXVcgu9scw6X83QiYY+Kcfa0ToEiHjlZEEVyLJL
         o1eIHKZy1dI9q11xDVdeRohCMz7jEC9OOWssemE4fGCG9FM5G6rtsFW/elOHlKrjlrh/
         M9ggyGeYpVFmQhjllEr19OoHnF8rXMn9uY0Op3Gn+jKO7HBpvECuravqrMDQ/tw6ynDS
         zfCA==
X-Forwarded-Encrypted: i=1; AKwUvBzGqY7FBo2EFf3KJRm2iViQ4ImUtpeLVQn1EWP4aqw7zLqF8in2IHJ9K11WUpE3CrKEl5OVAvOqr3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfAQhcl4C9TLN732QfdIVzuWu4VIClmFQufI40PH3JUFdj7KBq
	QfPt9/YFUMG5BPhF1eCVFNnKXtbPj47PJhJr8o1PGbL1SotwLnoF1LfJTaxpTvO5UA==
X-Gm-Gg: AYBFou3U3Swhd+0C2pjnd/2wlK4+Z1ei36sHhuWLYFeCUk9AMYnWO42C8OqqEGen1tV
	DwcWuI9dZ3Ol+yQ0rnVwxpVmzlNVVHPR7c2AUsatBdRBtsFuAFvhaWLRMcVuJLwcoyAhONveDXe
	fc47AtAuqz6a8CoF743O8Pi07PbwG0U1Q3LgPhQdCwoDb2hWdpPWMxzCjheQvVMeZzhWb8BgrEO
	3PqLnToWn3htUB9fFWoOOJoEdUsPz3JjYK1SwFV8x/kJDbNZ/FFmtfcw8IK+/XWezipfjskxlnI
	i33kHBLy5y+pPIkPijefW/vwb96h6ZyJPdHhWpN5lcCzw+nxjx1E7Bm+40CYEuXY1u50WzPYLSv
	33pmoZCSD8zIQjzBipUJsaPilNz6IrxOK+40nxVlBK+tp/ulGETQ9IuTMqndQA2GT/QreVwJoz1
	T5AxyzlQXsWhtwAOctZJLCuekdWgdYOJ7NQ+NUneysKGBD6jjGni6ivkCkYvcIY+mqcJffMYMkS
	YVmRRqEb2aqp+PMeAWayDuQFr9swmR96L9acXyutRLVVteznRFecelHsqCMd3WWKa+HetEm7jZk
	sJ0UeuQDLzCYc2wclbvYBOM99J6W5A==
X-Received: by 2002:a05:6214:240a:b0:91c:a1a9:44e0 with SMTP id 6a1803df08f44-91ca4b1bbd2mr149665266d6.28.1793585209484;
        Sun, 01 Nov 2026 18:06:49 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f254a1sm78503786d6.7.2026.11.01.18.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:06:48 -0800 (PST)
Date: Sun, 1 Nov 2026 21:06:46 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Bram van den Heuvel <bram@vandenheuvel.online>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] USB: quirks: add NO_LPM for Kingston DataTraveler Duo
Message-ID: <da413fa5-0563-481d-9f14-e156a13f5ac3@rowland.harvard.edu>
References: <20261101172944.59384-1-bram@vandenheuvel.online>
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
In-Reply-To: <20261101172944.59384-1-bram@vandenheuvel.online>

On Sun, Nov 01, 2026 at 06:29:44PM +0100, Bram van den Heuvel wrote:
> The Kingston DataTraveler Duo (0951:173c) repeatedly disconnects and
> reconnects when attached to a SuperSpeed root-hub port with USB 3 Link
> Power Management enabled. The kernel logs only a plain "USB disconnect",
> with no I/O errors or resets, and the drive re-enumerates about 0.25 s
> later. On a Framework 13 (Tiger Lake TCSS xHCI, 8086:9a13) running
> 7.2.11, one drive re-enumerated 72 times in about 5.5 minutes. The same
> drive also disconnects repeatedly on a Dell XPS from around 2016 with
> older kernels, so the problem is not tied to one host controller.
> Several drives of this model show the same behaviour.
> 
> The disconnects happen about 0.45 s after the host sends a command to
> an idle drive, such as the first INQUIRY after enumeration or the
> periodic media-change poll. Sustained reads are unaffected. This points
> to the drive failing to exit U1/U2.
> 
> Disabling LPM with usbcore.quirks=0951:173c:k stops the disconnects
> completely, including during a 497 MB read and accesses after idle
> periods.
> 
> Another owner of this drive reported the same problem in 2021
> (linked below).
> 
> The Kingston DataTraveler 3.0 (0951:1666) had the same symptom and
> already has this quirk, added in commit afaa2e745a24 ("USB: Add NO_LPM
> quirk for Kingston flash drive") after bugzilla #208257.
> 
> Link: https://community.frame.work/t/device-incompatibility-kingston-datatraveler-duo/11477
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222222
> Cc: stable@vger.kernel.org
> Signed-off-by: Bram van den Heuvel <bram@vandenheuvel.online>
> ---
> Not boot-tested with this patch applied. I tested the same quirk at
> runtime with usbcore.quirks=0951:173c:k, both on the kernel command
> line and through /sys/module/usbcore/parameters/quirks.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index a4bcbe9..5ac44fe 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -425,6 +425,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* Kingston DataTraveler 3.0 */
>  	{ USB_DEVICE(0x0951, 0x1666), .driver_info = USB_QUIRK_NO_LPM },
>  
> +	/* Kingston DataTraveler Duo */
> +	{ USB_DEVICE(0x0951, 0x173c), .driver_info = USB_QUIRK_NO_LPM },
> +
>  	/* TOSHIBA TransMemory-Mx */
>  	{ USB_DEVICE(0x0930, 0x1408), .driver_info = USB_QUIRK_NO_LPM },
>  
> -- 
> 2.56.0
> 
