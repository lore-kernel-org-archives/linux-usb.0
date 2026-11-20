Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184864;
	b=0I0NYvp6U3ZTDp+cQKhMVI6riaADFKPaF8C5orgUDNQ5ifqs6/fr5j3aDe5LUA2F3q+R
	 oJy5cOL0JS7bT+acGlLBAde7OjENj79ujRX7R8TzfpVKvyDs9AcL8NJViCKAjNPNYAyxZ
	 R0FU4dt/xYMQSKEL61Vyn6qFMJMQ32rDNQx3uRes1k6L3kTuG/QKFtOSaM3nuTZdW9sqt
	 UWpbAwAkWdp3p82T5kOKd/0OH2gDsN+4ocR5551mLs4V6CiUDHueImear7h06wh/E2zuT
	 8C3g0cc/IePrhc2OB7Ilfn9oIORKgL3SPfTdrruRGTlz2dqVi8E16iW9jVgEyn13vdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184864;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BRvskfouByE/116ZZn9IhBSCnzOLg4F0zmCYcQjh7wQ=;
	b=uKLr6E+5ZRltcqAMnIHU3QQTRZ575AW/93gM1cUbda/V9P5w0FICGskFs8+m9sAQJ6km
	 RB3TnJeCdb8GL9GsMyPXN59zxOJMUZ/Yq18ArVwFy/C4cWGTGaRzZoQ/4XshxILsu+z6N
	 3gUXkSPDbWVcBrOy2THOz9d6BRml6RNM1RlFdmSUTWeb8r0lTEyJzGkJc4eb/g4pX50vm
	 WlYOlZf+Jirhdfj2H78RtHAhTL68s7UEsfuKxJVpccGM/AdzDCUdyJ7PiB2Is47BfLeQc
	 VaikAq3gkCOvOhEd6RElQKj8FgkIql92SBMA5k0cN5kTIKhUbZxf7t3RbESVfRJNm+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1X7pxuxz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD57606A320;
	Fri, 20 Nov 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1X7pxuxz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E14C1F000CA;
	Fri, 20 Nov 2026 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795184863;
	bh=BRvskfouByE/116ZZn9IhBSCnzOLg4F0zmCYcQjh7wQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1X7pxuxzKy8kxhxbRj3phvLgUKbOIMyU7jwcbEgaLSLdZnsEegdNUqC3OyzUB9+mV
	 cf98+3yJUFha9nN+UZnMix9vmTLlZUPQlkv7GUmsRPFIqtzC2VYFbaN474HfIoAPDH
	 SfnLSHd5awnLBbbFfg2qDB4S7+NJ6Uc3VKIBthnU=
Date: Fri, 20 Nov 2026 15:27:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Neill Kapron <nkapron@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_ecm: serialize notification state with a
 spinlock
Message-ID: <2026112031-shy-ethics-8879@gregkh>
References: <20261026060031.60582-1-yuz08559@gmail.com>
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
In-Reply-To: <20261026060031.60582-1-yuz08559@gmail.com>

On Mon, Oct 26, 2026 at 04:00:31PM +1000, Yu Zhang wrote:
> ecm_do_notify() guards re-entry only with an atomic_read() of
> notify_count, then fills ecm->notify_req, does atomic_inc() and
> usb_ep_queue().  This check-fill-inc-queue sequence is not atomic and
> runs from three contexts that share no lock: ecm_notify_complete(),
> ecm_open()/ecm_close() (netdev up/down via u_ether) and ecm_set_alt().
> 
> When the completion handler decrements notify_count to 0 and re-enters
> ecm_do_notify(), a concurrent ecm_close()/ecm_set_alt() can observe
> notify_count == 0 in the window between the atomic_dec() and the next
> atomic_inc(), and queue the same ecm->notify_req a second time.  The
> request is then added to the endpoint queue twice (list_add corruption),
> and notify_state is updated concurrently.
> 
> struct f_ecm has carried a FIXME about this missing locking.  The sibling
> f_ncm already serializes the identical state machine with a per-instance
> spinlock.  Do the same in f_ecm: take ecm->lock across the is_open update
> and ecm_notify() in open/close/set_alt and across the state update in
> ecm_notify_complete(), dropping it only around usb_ep_queue().
> 
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>
> ---
>  drivers/usb/gadget/function/f_ecm.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
> index e495bac..d699832 100644
> --- a/drivers/usb/gadget/function/f_ecm.c
> +++ b/drivers/usb/gadget/function/f_ecm.c
> @@ -59,9 +59,8 @@ struct f_ecm {
>  	atomic_t			notify_count;
>  	bool				is_open;
>  
> -	/* FIXME is_open needs some irq-ish locking
> -	 * ... possibly the same as port.ioport
> -	 */
> +	/* protects the notification state machine */
> +	spinlock_t			lock;
>  };
>  
>  static inline struct f_ecm *func_to_ecm(struct usb_function *f)
> @@ -414,7 +413,11 @@ static void ecm_do_notify(struct f_ecm *ecm)
>  	event->wIndex = cpu_to_le16(ecm->ctrl_id);
>  
>  	atomic_inc(&ecm->notify_count);
> +
> +	/* usb_ep_queue() can complete the request re-entrantly */
> +	spin_unlock(&ecm->lock);

Please use a guard()

