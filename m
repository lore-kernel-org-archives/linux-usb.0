Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173274;
	b=kdvOtdttlMJTjjjpRWnrjwyyCi4IWg4+1eu3xNmQUJh2F4hKXG9AzXBhGdVIgGp0Xb7T
	 ZZFoV5PvsqVsAKeETCVIH6ITjDsQ23RMBTR0WU9E3zNp+4ToMTWoG580Ig/+1WZCZhJVs
	 Rc3PdFG5zSHIzLWBtuvF+1BxwA1ebB4zLGVr84dx2o5WpGcTz0cRVbDUPKK/lSLsuKRnP
	 f4TXjDT2DuMhST9JyiNQwKyQMQvnCpCBMTYy1Ti/qCoFStzJhYoHJHBZtRU+TQYA6628I
	 2C9YRcpBUW7fho0hj4C2BVdQXIDjCqq1eNl5RGNEkgDYwuUw0MFUakSMEElT36MXmbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173274;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GzCOakzgnQ0hFTDK1koQyl4ZK4S7xL3gLK1rpWvznZo=;
	b=IP6C12se1nJTVe7QJSAsQHSfaI+v+u8NwXY5LS4HKy3hYE41Ps3Rpl/rAmuwWmkSR+AW
	 JpcBqb12+xbVIrOCroKPMXeB3bspfx8/0xyZAkPmxYQWgkqWR+8ZkY/q3h9Lmd/Dg0Nfy
	 xttXnSGzNoR+YuRxDeXlO1wHb8MAHmS0ENKXgjGezjKlohDG/zv20aXfiKiGvPgyc/Jd/
	 S2QG+eMI/WgVoHfYmdm/TPxyGKHpHpa2f5vEdpT2k0AOH19g3Ago0Fiz2JW5K0QjCiehw
	 qDstxGlr8TB4WcF9XrtUwuQQ5KFA8BtNjR+aHIINxnhXQdcic2S2PDPHowa9I/uiWEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eP5Haql6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD2760A260D;
	Fri, 20 Nov 2026 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eP5Haql6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940C01F000F4;
	Fri, 20 Nov 2026 11:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795173274;
	bh=GzCOakzgnQ0hFTDK1koQyl4ZK4S7xL3gLK1rpWvznZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eP5Haql6IjfiZYiqgESCw/tT2qI9PsdwZDFMC9M+/rt49MqIhYynquTreCmZKCvkd
	 b1Nxg2MLDTUFAkyiTsjDhPQwj9E4ND2x7i6PwOykiCh2N1yiWtLjTRGBMODgPaRb54
	 it3ELpre/B04+ZCJsHxttmD8+dd2At/mGjEXe0R0=
Date: Fri, 20 Nov 2026 12:14:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haofeng Li <lihaofeng@kylinos.cn>
Cc: christophe.jaillet@wanadoo.fr, hataegu0826@gmail.com, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	13266079573@163.com
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix heap overflow in
 f_audio_out_ep_complete()
Message-ID: <2026112008-wildcat-pentagram-2ad6@gregkh>
References: <20260822194548.4151087-1-lihaofeng@kylinos.cn>
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
In-Reply-To: <20260822194548.4151087-1-lihaofeng@kylinos.cn>

On Sun, Aug 23, 2026 at 03:45:48AM +0800, Haofeng Li wrote:
> f_audio_out_ep_complete() queues the accumulation buffer for playback
> and allocates a fresh, audio_buf_size-byte one whenever an incoming
> request does not fit into the space left in the current buffer.  It then
> unconditionally copies req->actual bytes into copy_buf->buf.
> 
> audio_buf_size and req_buf_size are independent configfs attributes of
> the function and nothing makes the former cover the latter: a request
> buffer is req_buf_size bytes, req->actual is the size of the packet the
> USB host chose to send, and as soon as one packet exceeds audio_buf_size
> the memcpy() writes past the end of a kzalloc(audio_buf_size) object.
> 
> Attack chain (write access to the gadget's configfs attributes before
> the function is bound, plus control of the USB host side; no race
> needed):
> 
>     echo 1   > .../functions/uac1_legacy.0/audio_buf_size
>     echo 200 > .../functions/uac1_legacy.0/req_buf_size
>     bind the gadget, host sets the AS interface to altsetting 1
>       -> f_audio_set_alt(): 1-byte accumulation buffer allocated,
>          200-byte request buffers queued with req->length = 200
>     host sends a single 200-byte OUT audio packet
>       -> f_audio_complete() -> f_audio_out_ep_complete()
>       -> audio_buf_size - actual = 1 - 0 < 200: the empty buffer is
>          queued for playback and a new 1-byte buffer is allocated
>       -> memcpy(copy_buf->buf + 0, req->buf, 200)
>       -> 199-byte out-of-bounds heap write
> 
> The write is silent: FORTIFY cannot derive the size of the destination
> through the runtime offset buf + actual, and because the neighbouring
> slab objects stay addressable, generic KASAN reports nothing either.
> Reproduced on 7.2.0+ with KASAN and slub_debug=Z, where the injected
> 200-byte pattern lands entirely outside the 1-byte kmalloc-8 object and
> reaches the SLUB redzone; the resulting freelist corruption was observed
> to hang the machine (GPF in get_from_partial_node() during later device
> enumeration).

What does this paragraph mean?  Please rewrite this whole changelog in
your own words.

thanks,

greg k-h
