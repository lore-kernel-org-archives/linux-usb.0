Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184222;
	b=z7wt/8AsnSqb1NO8ywsZuC5KSHWIjJFZFjW4o1p3oaWsRIJIZS9Bg6v1JAOWGr7oZpQE
	 D6sDq3lG2ajAoYQnJqDlKC4xJP6nIk5vznmfxnLDttpEc9sx1qLWtYO2U4mTTjw0iXmCc
	 OOFPyN77x1RRXeuN27eVYaCEDazQDj23Etb37JkTocFjaMMwtTp+NHuykTW5DOwT+L5lp
	 feP0qkNBlrP3uxmRObPpn0p0LyTT9rsiJniTdb4O4n0DvJM4LTgBExdQksbSWKOPjqFcj
	 tCkvKrFAQeNVAZzOaD+d68D3L2Z0gKK5OoSSO7xak9qpLfavu4bJz+WjwgittPm5Ygg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184222;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YyZt9yeuVbjoTHrdgaNjjeu1ZmN+pS2ygE4HBH0Goy0=;
	b=g0bRE3qJlAIoAoRiUqRtAEoSq4p7RQuZhAXuBKLbG5KMI1Qy1giF6ySLtKWGh6IciUTx
	 Gvwc5JzSWgor6BHvK3Yfq2tDPqunOWIjhFZUmMig2z7CaCsnhXtDFagCtvGyeoKA6aqG6
	 pbc3/hSVtcVzAE0R05Qpu5rvOZ41aFv6xNavnFUrstR56w7CxZ42Z74w+FcxYeLNM0WmW
	 VrO9QEveMpfBJ8V8/romtJajjtsKnlRr767rEyNimIcKc+Cj825kwCCZdKpB1O3HN0xmB
	 ajHcTm16m28DidQSutYgH0iSj+CNYXXWfydBW1z4aVLi42OrIkk1t7WMP6ySCl0+5yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZuzruOWF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3305F606A326
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZuzruOWF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124EE1F000D3;
	Fri, 20 Nov 2026 14:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795184221;
	bh=YyZt9yeuVbjoTHrdgaNjjeu1ZmN+pS2ygE4HBH0Goy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZuzruOWF80XSzJ7eqQZ68ZC5rcmBTm3c7tbhdwQwGkQoJlf2qK1cLA84TwpyJjE0n
	 unktLYF/oVF4GWEzrn6MLKYZYPFy1rkA29GonMKk4st+i+VMT98IrTvAWvnz19OZPh
	 txe2B5cXtcFTCqJdVoLfUwiBB1ggegWkahmktHXk=
Date: Fri, 20 Nov 2026 15:16:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Neill Kapron <nkapron@google.com>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] usb: gadget: pxa25x_udc: Support combined PXA and IXP4xx
 builds
Message-ID: <2026112047-identical-dry-6296@gregkh>
References: <20261117-usb-pxa25x-udc-v1-1-fdfcec62d336@kernel.org>
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
In-Reply-To: <20261117-usb-pxa25x-udc-v1-1-fdfcec62d336@kernel.org>

On Tue, Nov 17, 2026 at 11:47:25AM +0100, Linus Walleij wrote:
> Allowing little-endian IXP4xx kernels makes it possible to enable both
> ARCH_IXP4XX and ARCH_PXA. The shared UDC driver still assumes that these
> platforms are mutually exclusive: it defines UDCCS_IO_ROF twice and stops
> the build with "Can't configure both IXP and PXA".
> 
> Select the controller quirks using the running CPU rather than the kernel
> configuration. Match both XScale CPU families and their supported
> revisions, and remember whether the controller belongs to IXP4xx. Use that
> flag to select the existing isochronous receive overflow bit and to keep
> the EP0 status workaround specific to PXA.
> 
> Remove the IXP4xx clock API overrides so that PXA clock control still
> works in a combined kernel. Leave the clock NULL on IXP4xx, which has no
> software-controlled UDC clock, and rely on the clock API's NULL handling.
> 
> Fixes: 2262f02ac2aa ("ARM: ixp4xx: Relax endianness")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611082010.e3nJgvr4-lkp@intel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Fix the build failure when PXA and IXP4xx are enabled together by
> selecting CPU quirks at runtime.
> 
> I guess I caused this problem by allowing for little endian IXP4xx.
> 
> Assisted by LLM.

Does not apply to the usb-testing branch at all :(
