Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5523A1A55;
	Mon, 30 Mar 2026 14:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880599; cv=none; b=RBx97EYlYEECwDth4i76tWnmA0B0q9PqzhEW7wODrpQUFlSOvnp8EBLzJQDguHm7BCy5vFenWEJ0ziPwI3TBdu8TAMRYgOL9Jhg85+ERFsnKr7LoNWGBTAYNJG6KYclWv2lLqsx8gMSkfPv2PnsD/Z04qMBHFtkb/Eh5IAcbprw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880599; c=relaxed/simple;
	bh=QC+pTKlsj+pIL5hgPnFCbIm0LkCZd/Qv1iNv5xCBGZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImYgYfxTLfmqvxBPbTkUVXDVmlHqJGAwh4QE0tLN/YaODV1Zi7sya++/bYfTV4TZRb3N5W+ZeeCKepY4IYN/AQbwdXpreRWneW19q4l0H/F2M4ZbG6LLNfPgvxLbMQmDQBt6WsVpO1ljBwQIpmLyqP3XPPHXFJbB6rsuHLM96WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d2BHhW9J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d2BHhW9J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BB4C4CEF7;
	Mon, 30 Mar 2026 14:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774880599;
	bh=QC+pTKlsj+pIL5hgPnFCbIm0LkCZd/Qv1iNv5xCBGZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2BHhW9JCMuf57+665WmO1Oi2sW1rPSfgMklFMX/iiRd+yEiEEWxBl7srQYZjj/vP
	 zy28YoYgkt12AvGlsYwry1t2D7WrX4x0gFowYBD9n+jfu5skGeh6oTwTcA18rOJKxi
	 O/T3BmN2hDT5uoBq37aa9edimnuV1eHAzNhHuxJI=
Date: Mon, 30 Mar 2026 16:23:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v2] usb: gadget: rndis: validate query and set message
 buffers
Message-ID: <2026033008-jimmy-banknote-f4b4@gregkh>
References: <20260323080845.40045-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323080845.40045-1-pengpeng@iscas.ac.cn>

On Mon, Mar 23, 2026 at 04:08:45PM +0800, Pengpeng Hou wrote:
> rndis_set_response() already checks the host-controlled
> InformationBufferOffset/InformationBufferLength pair before using it,
> but the QUERY path still passes the same fields straight into
> gen_ndis_query_resp(). The parser also does not verify that MsgLength
> fits the actual EP0 request buffer before dispatching the message.
> 
> Pass the actual request size into rndis_msg_parser(), reject messages
> whose MsgLength exceeds the received buffer, and apply the same offset
> and length validation to QUERY and SET requests before dereferencing the
> embedded information buffer.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> v2:
> - add commit message context and fix rationale
> - no code changes

Have you tested this?  I remember lots of issues like this in the
protocol, so this might not be the only one in here.  I really just want
to delete this code entirely, but some people really like to talk to old
obsolete Windows systems :(

thanks,

greg k-h
