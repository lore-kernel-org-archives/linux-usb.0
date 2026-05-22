Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00983B2FE5;
	Fri, 22 May 2026 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440414; cv=none; b=Un6yKHX+go8YvataB16C9BsOqYXCeIun8iCQVQScG6X5tY07zmHhhcTt4dT2/3oZsR3cRmzRkdgWvETcVIPmq5b6DKgIMRsxeDFLZEBe0lNSBg46yZXFs6EchzJyuYZYDmhhrZ9hgfhhhPMxm4x0G8asXqRgOC33KJY5A7ZrxdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440414; c=relaxed/simple;
	bh=k/CoVrJV02wLWSyejI6Y0Z+P5UwJLjO557+rASZQns4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/rFnRnYJLXYXfu4WlUh7RhT5pkgyVNpMb3XhgNMKSuc23NFToh3xwTYSqZKbYOHgJK8BiBiN8/l2ZDJtCEi7UCDbH/jCa/0YUJSiSAw1edLat149d6FEhOziZw2MSLrTsq/8Jf9bzhv93HeD6XEcCNpChkB7352tahUGQ07hKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7l4MAE1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7l4MAE1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4C91F000E9;
	Fri, 22 May 2026 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779440411;
	bh=lSkv/lz7KzchkdjiWax8l4W0knSZO9RgQ1A/r2M7HcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E7l4MAE1Z7DRn+0Zd6ELeXTxBh3dWX0UxuJ7H00KraF7km+5T92vaoH1xHE0L2JHQ
	 hHdx/D+72K4tcSSfTRZl2GstORofiG3YEFPM5UsUTa3lE9gsunM1ltbhPUyxMnSM0Y
	 DsNLKRYNghn+/MyMONnCH/rPUIdSEulentwYyiwqAZEsLazoZymU0YdTsKr7YOSTt+
	 2NtWFheY+tXPkmGcklEsroEpEAtc5mSxLkzi3YKd9lHHOEmEEBGK8+BejXaUbIGPGe
	 M51lIcy2GpB7ncaY/GyLKeZxMOH5gfVZzTtjbzp1YBgxkPDvVn0amoTiLuU7eArvkA
	 DL9CMIQw2Z/gA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wQLjk-00000003ltC-3Lav;
	Fri, 22 May 2026 11:00:08 +0200
Date: Fri, 22 May 2026 11:00:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Zhang Cen <rollkingzzc@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com, 2045gemini@gmail.com
Subject: Re: [PATCH] USB: serial: cypress_m8: validate interrupt packet
 headers
Message-ID: <ahAbGBT0nbDODXIq@hovoldconsulting.com>
References: <20260521161117.3501317-1-rollkingzzc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521161117.3501317-1-rollkingzzc@gmail.com>

On Fri, May 22, 2026 at 12:11:17AM +0800, Zhang Cen wrote:
> cypress_read_int_callback() parses the interrupt-in buffer according to
> the selected Cypress packet format. Format 1 has a two-byte status/count
> header and format 2 has a one-byte combined status/count header. The
> usb-serial core sizes the interrupt-in buffer from the endpoint
> descriptor's wMaxPacketSize, and successful interrupt transfers can
> complete short when URB_SHORT_NOT_OK is not set.
> 
> Check that both the allocated URB buffer and completed packet contain the
> selected header before reading it. Malformed short reports are ignored and
> the interrupt URB is resubmitted through the existing retry path,
> preventing out-of-bounds and stale header-byte reads.

Good catch.

> KASAN report as below:
> KASAN slab-out-of-bounds in cypress_read_int_callback+0x240/0x7f0
> RIP: 0010:kasan_check_range+0x67/0x1b0
> Read of size 1
> Call trace:
>   dump_stack_lvl+0x66/0xa0 (?:?)
>   print_report+0xce/0x630 (?:?)
>   cypress_read_int_callback() (drivers/usb/serial/cypress_m8.c:1009)
>   srso_alias_return_thunk+0x5/0xfbef5 (?:?)
>   __virt_addr_valid+0x188/0x320 (?:?)
>   kasan_report+0xe0/0x110 (?:?)
>   __usb_hcd_giveback_urb+0x103/0x1d0 (?:?)
>   __usb_hcd_giveback_urb+0xf3/0x1d0 (?:?)
>   __usb_hcd_giveback_urb+0x112/0x1d0 (?:?)
>   dummy_timer+0xaaa/0x19a0 (?:?)

You can trim call traces like this one from here (dummy_timer).

>   mark_held_locks+0x40/0x70 (?:?)
>   _raw_spin_unlock_irqrestore+0x44/0x60 (?:?)
>   lockdep_hardirqs_on_prepare+0xb7/0x1a0 (?:?)
>   __hrtimer_run_queues+0x102/0x510 (?:?)
>   hrtimer_run_softirq+0xd0/0x130 (?:?)
>   handle_softirqs+0x155/0x650 (?:?)
>   __irq_exit_rcu+0xc4/0x160 (?:?)
>   irq_exit_rcu+0xe/0x20 (?:?)
>   sysvec_apic_timer_interrupt+0x6c/0x80 (?:?)
>   asm_sysvec_apic_timer_interrupt+0x1a/0x20 (?:?)
> 
> Fixes: 3416eaa1f8f8 ("USB: cypress_m8: Packet format is separate from characteristic size")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
> ---
>  drivers/usb/serial/cypress_m8.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
> index afff1a0f4298b..50c6abc69e756 100644
> --- a/drivers/usb/serial/cypress_m8.c
> +++ b/drivers/usb/serial/cypress_m8.c
> @@ -1016,6 +1016,7 @@ static void cypress_read_int_callback(struct urb *urb)
>  	unsigned long flags;
>  	char tty_flag = TTY_NORMAL;
>  	int bytes = 0;
> +	int header_size = 0;
>  	int result;
>  	int i = 0;
>  	int status = urb->status;
> @@ -1060,18 +1061,32 @@ static void cypress_read_int_callback(struct urb *urb)
>  	default:
>  	case packet_format_1:
>  		/* This is for the CY7C64013... */
> +		header_size = 2;
> +		if (result < header_size ||
> +		    urb->transfer_buffer_length < header_size)

As with you previous patch, there is no need to check the
transfer_buffer_length (here or below).

> +			break;
>  		priv->current_status = data[0] & 0xF8;
>  		bytes = data[1] + 2;
>  		i = 2;

The variable i already holds the header size, so even if it's not
very well named you should reuse that one after moving the assignment.

>  		break;
>  	case packet_format_2:
>  		/* This is for the CY7C63743... */
> +		header_size = 1;
> +		if (result < header_size ||
> +		    urb->transfer_buffer_length < header_size)
> +			break;
>  		priv->current_status = data[0] & 0xF8;
>  		bytes = (data[0] & 0x07) + 1;
>  		i = 1;
>  		break;
>  	}
>  	spin_unlock_irqrestore(&priv->lock, flags);
> +	if (result < header_size || urb->transfer_buffer_length < header_size) {
> +		dev_dbg(dev,
> +			"%s - short packet header - received %d bytes but buffer has %d bytes\n",
> +			__func__, result, urb->transfer_buffer_length);

Just say "short packet received" and possibly include result.

> +		goto continue_read;
> +	}
>  	if (result < bytes) {
>  		dev_dbg(dev,
>  			"%s - wrong packet size - received %d bytes but packet said %d bytes\n",

Johan
