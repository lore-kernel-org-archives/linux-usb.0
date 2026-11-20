Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171688;
	b=p6B4vGO3Hms7CtZeSGzV4xjRgbsOkUk0/RT0D9z/cofXpxjyzXqb/7H0RcBB//gv3ruB
	 I4JNBJYzaW2SfmFDgs610EaSPzSSq/euXiNg3E7bTnrFt1hbUOrff4oB7dUE15nagR+jp
	 JREgG9jpugF6ZbRBx9jjhG2BMz4L22l0ZO5bhyPhtCYGbHzMELSwLHJcurx43GUM7nBBM
	 z3X+DFqx2uyDRlS/voxKXAzbZuPZm/dpab6LZKEmiMybq56pE59VodaIcy+4KPt3+Fo3F
	 OeSZAimpQ086TRUBJIei6DLi7QprK9Z2TBFeYB+c6r4hGRe+P1KYjEGS//HaPXcC4Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171688;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vK6yaBpwpgHFEhpQXiGAYAvkirAzsjkLJlEInwtsnPE=;
	b=3kype6vQTWmCrBga0EsYqOp4qf70JoUgEm+q4ydqOb5QIo7vbngq6tQ27Cnwd92WYqTR
	 HDd+PEdTsqT3kdN2Nx6krSc2soY34ls0k3vgo0P0hf4LJTFlYs5v2k/hrhVY3Hcs0ucfj
	 MDnVmhkyrb+1bktESTDbzxP+GZ2ddn1r4IDOxUrda95CfJIwOwu2lvQFitgKr/mTpRnKw
	 XAUY7B83RzJN4DKE0+MAEWO44M16yLsquFJuPJDFZC1bsnw1owdX7hCUKfwYpOMG13A6M
	 yIfn/IKa8wHXpG+8gvqFkD6uBy1+7vlp3SAusLq96zzp4ASndNUIzRgnNLDNLHTf+Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vV0+EMMl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2135606A320;
	Fri, 20 Nov 2026 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vV0+EMMl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15B01F000CA;
	Fri, 20 Nov 2026 10:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795171688;
	bh=vK6yaBpwpgHFEhpQXiGAYAvkirAzsjkLJlEInwtsnPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vV0+EMMlgKpM150mscPuPefS2boDVxSaBj27Qjob23IU1i6ThJ66cvX4VB4tfDq9/
	 oHwYYwEYAfUSMMXomNdeb887AOVIaSG61AQdrKMrnctiaRRVTXwHMLj4DcXcCBwC2T
	 Mdi8VVWS+grNgKMKTnr5ywRk0Jn0QUkfpkectLQo=
Date: Fri, 20 Nov 2026 11:48:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haofeng Li <lihaofeng@kylinos.cn>
Cc: kees@kernel.org, mlbnkm1@gmail.com, christophe.jaillet@wanadoo.fr,
	raoxu@uniontech.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, 13266079573@163.com
Subject: Re: [PATCH v2] usb: gadget: f_printer: prevent OOB write in
 GET_DEVICE_ID
Message-ID: <2026112055-reflector-knoll-e9d8@gregkh>
References: <2026082154-estrogen-spoon-0a9e@gregkh>
 <20260821160517.3439548-1-lihaofeng@kylinos.cn>
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
In-Reply-To: <20260821160517.3439548-1-lihaofeng@kylinos.cn>

On Sat, Aug 22, 2026 at 12:05:17AM +0800, Haofeng Li wrote:
> printer_func_setup() services the Printer Class GET_DEVICE_ID request
> by echoing the PnP string previously stored in the gadget's configfs
> pnp_string attribute:
> 
> 	value = strlen(*dev->pnp_string);
> 	buf[0] = (value >> 8) & 0xFF;
> 	buf[1] = value & 0xFF;
> 	memcpy(buf + 2, *dev->pnp_string, value);
> 
> The EP0 response buffer is exactly USB_COMP_EP0_BUFSIZ (4096) bytes,
> allocated once by composite_dev_prepare():
> 
> 	cdev->req->buf = kzalloc(USB_COMP_EP0_BUFSIZ, GFP_KERNEL);
> 
> The two-byte length prefix plus the string body must therefore fit
> into 4096 bytes.  pnp_string is stored via kstrndup(page, len,
> GFP_KERNEL) in f_printer_opts_pnp_string_store(); configfs passes at
> most PAGE_SIZE - 1 (4095) bytes down to the store callback, so a
> 4095-byte string combined with the 2-byte length field makes the
> memcpy() write buf[2..4096], one byte past the end of the allocation.
> 
> Attack chain (USB Printer gadget on the victim device):
> 
>   1. pnp_string is set to a 4095-byte value through the gadget's
>      configfs attribute
>      (~/config/usb_gadget/<gadget>/functions/printer.usb0/pnp_string);
>      configfs accepts up to PAGE_SIZE - 1 bytes (fs/configfs/file.c).
>   2. The printer function is enabled and the gadget is bound to its
>      UDC.  An attacker in control of the connecting USB host sends a
>      Printer Class GET_DEVICE_ID request (bmRequestType=0xA1,
>      bRequest=0x00, wIndex pointing at the printer interface); the
>      usblp host driver also issues this request on enumeration.
>   3. composite_setup() -> printer_func_setup() -> memcpy(buf + 2,
>      pnp_string, 4095) performs a 4097-byte write into the 4096-byte
>      EP0 response buffer, overflowing the heap object by one byte and
>      potentially corrupting adjacent slab objects or allocator
>      metadata (CWE-787).
> 
> With KASAN enabled the overflow is reliably reported (this is
> reproducible end to end with a configfs gadget + dummy_hcd):
> 
> 	BUG: KASAN: slab-out-of-bounds in printer_func_setup+0x2ec/0x3c0
> 	Write of size 4095 at addr ffff88818e461002
> 
> Fix it at both ends:
> 
>   - clamp the string length to USB_COMP_EP0_BUFSIZ - 2 in
>     printer_func_setup() so the copy can never exceed the EP0 buffer,
>     and
>   - reject pnp_string values longer than USB_COMP_EP0_BUFSIZ - 2 in
>     f_printer_opts_pnp_string_store() so an oversized string is never
>     stored in the first place.
> 
> ---

You need a signed-off-by above this line.
