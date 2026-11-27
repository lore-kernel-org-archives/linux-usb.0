Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785421;
	b=XxUnGkbkawmUHMtkjOatd9iQXhDcTkKPsZX2UjpoZ17x+gmmNNHUeaLj+9TGelCvZnR3
	 RSyhE5WLLAdy+W4rbpqQM/lMH30gnHptNe6SpQNfWcENI+ZrKUuY1bwfkFd3Smoq242gV
	 GI1jbcT8l7fsbCaMYmsseDdVELAyp5pf3dXq2MCUtM/XtSHtX/KwhNAO6IF0H7cTWTcmo
	 8ZQkumI6fWbJI24z4JNhMIAz9ACT96RNc7I2GtYhXYDcWjfyXpIVFYAP2yDXIiOAJH6Vt
	 ET9bMKO2OvbqRSLa4Xeey4fNda2PD3QOaMG+ripjBNCq4h5YBTO9ZjY2GzaK84hVn3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785421;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YzDQ2Pfo6reO38OqA82HnBHC67G3KMS9ToB1/mnPg1Y=;
	b=Vf/MjcSwzhs7nIHHHtVMjqK7hBgsQ0S/C9vPt5RF3Gl66I6rLIOKQpCXOdhMNo6VX04t
	 6C9eK7aYZ0VXB1HdXRHIp+8i091bfAeEj72Vf0W9nKF5EAtKKNVHQb4+11HPyvVh/UK/q
	 sjVf8eRJWCC3lgxzgXwX4ZYNbWNkQzUxUMyawq5sh28rO8fYtIRWmjFMl43TTBrjHYDvm
	 XxDnJ1y5RD2/kL+MCBlXbqbw9EyBUb1LSm4hoMgENfhJez8EjVq2GgFZZJ21GmOh6k5cL
	 zbJQtEeTZRXErkf0mVGSIY9M9ybdhVhv/jo8a+pZPoCVFdnz7R1m2XVzhPoDO3xnhOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zft16Opp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD637606A31C;
	Fri, 27 Nov 2026 13:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zft16Opp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B711F00893;
	Fri, 27 Nov 2026 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795785421;
	bh=YzDQ2Pfo6reO38OqA82HnBHC67G3KMS9ToB1/mnPg1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zft16OppquXaXQJHVpr+keW5x0IKhlOJU0HK97ypC36zD3/aF3Me5dtX9D8faXZCi
	 INc84CfCz2+gIiFE/japr6zuy+TrK7QaSCYR4DMF7NPFpl5xUs6fL01GUD7IO1HCDi
	 PIsuVALMJKiW5E2A2nvm9zL6fpZjps/DySy83tcpgp7xYyVb/LpYU7IIiBTXtKtOyz
	 4ZgudS6rOFgfhaWdG4Nc34yhax97HNeHI8H5CA83kQ/VKxeLeVd/3+IU0C6sXQluv+
	 DkMFkDIvWv4wDHJ2k3p+Neb5srz2mg/Ok96AMZjZbG1zXrItYVCB0IAu62pWVclge/
	 9Zy/pkPI0O2Pg==
Received: from johan by xi.lan with local (Exim 4.100.2)
	(envelope-from <johan@kernel.org>)
	id 1xWvox-000000024DQ-1A9B;
	Fri, 27 Nov 2026 14:16:59 +0100
Date: Fri, 27 Nov 2026 14:16:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: oti6858: restart polling after TX
 allocation failure
Message-ID: <awmCy4sEi04Mxk5-@hovoldconsulting.com>
References: <2274A9F7B5D45D06+20261113052738.1479779-1-tuhaowen@uniontech.com>
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
In-Reply-To: <2274A9F7B5D45D06+20261113052738.1479779-1-tuhaowen@uniontech.com>

On Fri, Nov 13, 2026 at 01:27:38PM +0800, Haowen Tu wrote:
> The status interrupt callback stops polling when it schedules send_data().
> The work function then sets write_urb_in_use before allocating a one-byte
> buffer for the transmit-buffer query. If that allocation fails, it returns
> without clearing the flag or resubmitting the status interrupt URB. With
> no write URB submitted either, nothing restarts polling and queued data
> can no longer make progress.
> 
> Use usb_control_msg_recv() to manage the DMA-safe query buffer. Allocation
> failures then follow the existing control-transfer error path, which
> leaves the FIFO untouched, clears write_urb_in_use and restarts polling.
> Adjust the return-value check for the helper's zero-on-success convention.
> 
> Fixes: d2126326bd71 ("USB: oti6858: fix DMA buffer on stack")
> Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>

Applied for -next, thanks.

Johan
