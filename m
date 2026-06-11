Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08523655F6;
	Thu, 11 Jun 2026 05:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154424; cv=none; b=usaofGdPSNO0+cooEYO1kmnqdJ7bg5sJis5zZjLElLjYVbR52aA2v2PxSxu8GpRCWZuTL81URc+eZ/wqfjlKmaIbUkddrNHC8VouYDVw+Cx+KjklKaL/S1dlEsUNJHL3f0DlrjCUEMwMJfcJAmgYhPyoDyK9V4AqA1DMfhH5AdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154424; c=relaxed/simple;
	bh=GyRbe+8t9Qx3vOYKAfgP9Hg3BnwoylvXSDWp38DlcgQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EMaxBEqDlJ60jik/ibXMhQ1GpalKHdJnrECaAJNd7TR8TUDJspeGkCAFwIXLgGCpwhy6BMZIvl3blnU1xGf2KOfjVbQJHESRGdPMQUtzhO+1reSD1zIuIsazLBXzBYPCLOFmnpr2HddKIlEZ/Q4UXuOUVCpQM8Aoz1pyVOclaNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=lClyaaPM; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="lClyaaPM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781154415;
	bh=GyRbe+8t9Qx3vOYKAfgP9Hg3BnwoylvXSDWp38DlcgQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lClyaaPM5lDcE3g5Glq3XQLIx86iO6NcjaNXhDeR5Z5LYRMPRMwIcEx4GxUaMuj6u
	 C8SK6XqZ7engUuff59cS8Gx48DxyEVjtdLBpTeviDDeYDK1BTwn7FkfbgivHbKCYvT
	 wJqF38FTY5slwLr/A6GL+zqmog22WNjamQYPuxfH/8u+ZpucqJ9ubXB8razfCTNUmx
	 mjkw7RY6YxsoPLPRaDa2O5tRWb627uslqGlZTj+DR5C4lt6YbUHmtkXPj1Y82DNSPY
	 NRzgnHu+7HaCDMjRi+zJNos3TU6q8CSN0/M8dyCkdDI0aLCwFTgSCiJvFaOYRh6jKJ
	 LFEgR7mVEesMQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 164E96450D;
	Thu, 11 Jun 2026 13:06:54 +0800 (AWST)
Message-ID: <a4f09170d3d618d285f7019c82e63142b268d6ce.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] usb: gadget: aspeed_udc: check endpoint DMA
 allocation
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ruoyu Wang <ruoyuw560@gmail.com>, Neal Liu <neal_liu@aspeedtech.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 11 Jun 2026 14:36:53 +0930
In-Reply-To: <20260610121022.3-1-ruoyuw560@gmail.com>
References: <20260608081948.3-1-ruoyuw560@gmail.com>
	 <20260610121022.3-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-06-10 at 20:10 +0800, Ruoyu Wang wrote:
> ast_udc_probe() allocates a coherent DMA buffer used as the backing store
> for endpoint buffers. ast_udc_init_ep() derives per-endpoint buffer
> pointers from udc->ep0_buf, so a failed allocation is dereferenced during
> probe.
>=20
> Check the allocation before endpoint setup. The existing probe error path
> called ast_udc_remove(), which unregisters the gadget unconditionally and
> is not safe before usb_add_gadget_udc() succeeds. Add a local cleanup
> helper for probe failures so pre-registration failures only unwind the
> resources that were actually initialized.
>=20
> This was found by a local static analysis checker for unchecked allocator
> returns while scanning Linux 6.16. The change was checked by applying it
> to current mainline and by running checkpatch. I do not have access to
> Aspeed UDC hardware, so no runtime testing was performed.
>=20
> Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
