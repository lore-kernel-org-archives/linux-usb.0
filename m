Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEC93B0ADA;
	Mon,  6 Jul 2026 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340474; cv=none; b=uWxWCYVtv/0awbF/GufTJiJTvQanCJjx0pjlDLV3uytOgEJDBoUIT+QnP8rkt4/kdx1xMWCzpULnakXMHfMRa4tPE6u6qBnZmiNLMyW0lnr+MBBjkEVda95SKSA0RaiLMvEZbCORZ2YgT6muDrHFlEQTXSrJmRtiqX3oQJ2n9IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340474; c=relaxed/simple;
	bh=KWZ9UqtjiGuvkp5f+NokaPS4hT+MCSb29XRPGQ976JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbLbweQLJ4L258BiRcQysebkn1m+AbKtoeG0ViXlznqlvvIyLk5tTsTgrxU9JVg2vzYOBjOuyeASvmCRXIiMlvoHDgltDt7SlHN/K8SVqhgPziBqhAgiNXYpQd5j4cKloswcyFqam1tXypl87ksMUppcs6otzG6lKWPTKPA8mKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=meOjPzck; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="meOjPzck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FB11F000E9;
	Mon,  6 Jul 2026 12:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783340473;
	bh=rg1eFU1s2oxAev1fPU4W8++jhnB0VCq5PUqjvjCsuCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=meOjPzckDcoZ5SNnuzc/GgQGMchzbIKSjbdRp80TbqDjmq+gjqITfLvUliR5JN2jX
	 4x8k1v/+Xu8eftwoIz+I2uDcKFALh7znUrTW5QZEagRrre5j/nSRPbEGjInoG5l59w
	 YbNw7yc4LVCCgVyLcLgeoOekG17OCn+hTTVc5iLiBKL1jJ7lQa4V22RvbtQ3sSIjyG
	 Kaj6Vx62joP1PPhbcUdSQ2NJgITXEgSqf+Ez4Bf6xIaaa7h1UHPkL7X5D4xCB5zSb3
	 CzR1xrPL+FnpjQ3NdvALf5ejhLVSNc7tpnq0cU6NiHdRSAMb0CuoILTcrGimZOxu9+
	 qCZlABlu1IoXg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wgiJz-00000001r7m-09Nv;
	Mon, 06 Jul 2026 14:21:11 +0200
Date: Mon, 6 Jul 2026 14:21:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: io_ti: reject oversized boot-mode firmware
 images
Message-ID: <akudt5BoC9MmcF1P@hovoldconsulting.com>
References: <20260701053535.39951-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701053535.39951-1-pengpeng@iscas.ac.cn>

On Wed, Jul 01, 2026 at 01:35:35PM +0800, Pengpeng Hou wrote:
> do_boot_mode() allocates a fixed 15.5 KiB staging buffer plus the I2C
> image header and then copies fw->size - 4 bytes into it.
> check_fw_sanity() validates the firmware's internal record accounting,
> but the boot-mode copy still needs to prove that the raw firmware
> payload fits in the fixed staging buffer.
> 
> Reject firmware images that are shorter than the skipped 4-byte prefix
> or whose remaining payload exceeds the staging buffer before copying the
> data.

check_fw_sanity() already makes sure that the image has a 7-byte header
so the commit message and check below needs to be updated.

Also, how was this issue found?

> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Please add a Fixes tag as well.

> ---
>  drivers/usb/serial/io_ti.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
> index d48819d7..3bdcbd6f 100644
> --- a/drivers/usb/serial/io_ti.c
> +++ b/drivers/usb/serial/io_ti.c
> @@ -1466,6 +1466,12 @@ static int do_boot_mode(struct edgeport_serial *serial,
>  		/* Allocate a 15.5k buffer + 3 byte header */
>  		buffer_size = (((1024 * 16) - 512) +
>  					sizeof(struct ti_i2c_image_header));
> +		if (fw->size < 4 || fw->size - 4 > buffer_size) {

Just drop the < 4 check, or possibly keep it with a comment about it
being redundant because of check_fw_sanity().

> +			dev_err(dev, "%s - firmware image is too large\n",
> +				__func__);
> +			return -EINVAL;
> +		}
> +
>  		buffer = kmalloc(buffer_size, GFP_KERNEL);
>  		if (!buffer)
>  			return -ENOMEM;

Johan
