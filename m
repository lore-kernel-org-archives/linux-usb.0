Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4D33F597;
	Tue, 21 Jul 2026 14:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644450; cv=none; b=sgy2wvlAKFWL67FUff4YTmbXiKUOAMGEwBLeYArRalnNhqwO4cnZ4dCLNKZm6XAOzFeRWcIS8aq5vqA/pLF0ztiVj2qYyZbVK/fxTiY4LEyoHPcg6DgybphogyYfR2CuXITYj4fQT7Ay3uWgHcKYW95p95uQqRXC22hEtEzViZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644450; c=relaxed/simple;
	bh=pMHeh4zhJ4bYuilf+EbYDdiFeXpQaVHZaT4q/aEUdG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4xccpPCuiV8YowtFDxSdVwkxwjpwpXod2pkrDp0Y5twClWbqY5apZyvYwpP9WaMSb1ujUD3gBVJTwqRwjAM7nciiSuZ2vEF/XzL14TL2v0r0CiK9rA5+gYMYq2k8WopgQQtLX3u04e3W41VWjJXVBSDdEwcDN17wArj8kpDbtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMWYhSl/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMWYhSl/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0291F000E9;
	Tue, 21 Jul 2026 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784644448;
	bh=RO989GIm+lzTtLY0QJT8coHQhLYEBWAeDT/sPoy8hBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BMWYhSl/HOsbs4kjAEJroB2wwv31uGT0dSDmsl1VBDtu6fFrP2ECaXygKLDdQy56k
	 63wfHW4DU6Ls3InTdg58jrulq0aen/1Y0NrlvRo01EuCKNgbTcFBxKbNWx6KAdoYJg
	 RhTfHE0pHbMjnNraMR9rMUa+qmoPcOTYODPlQD0oZ5rvHHKHHLePvJPDGgCv12+WHc
	 Lc8xg9Ak5ZQAbK7dECmqn+OqATIXFw/H41jPxLDdVCMgMdtysPtlCRpK1dcmA0WMot
	 Y72UqSbXZqIi8qx2OoFqrkKcknRDxlKy0QWdSPJBnDC9kM/3WMh6L17vlf8ilb2tEI
	 i/NDfsqkJiumw==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wmBXq-000000092Q4-1MxI;
	Tue, 21 Jul 2026 16:34:06 +0200
Date: Tue, 21 Jul 2026 16:34:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com
Subject: Re: [PATCH v2 1/4] USB: serial: mxuport: clean up firmware version
 handling
Message-ID: <al-DXpI52HuWBNwG@hovoldconsulting.com>
References: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
 <20260623080138.166398-3-crescentcy.hsieh@moxa.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623080138.166398-3-crescentcy.hsieh@moxa.com>

On Tue, Jun 23, 2026 at 04:01:36PM +0800, Crescent Hsieh wrote:
> Add a small helper for parsing firmware versions and use it for the
> bundled firmware image. This avoids open-coded firmware image offsets
> in probe() and validates the image size before reading the version
> bytes.
> 
> Keep the existing version comparison policy unchanged, but store the
> version components explicitly so that the version can be printed
> without unpacking a raw integer.
> 
> Print the firmware version fields in decimal, as these fields represent
> readable version components rather than hexadecimal values.
> 
> Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
> ---

Thanks for the v2. You seem to have addressed all my comments on v1 of
the series, which is unfortunately not as common as I wish it were. :)

> @@ -82,7 +95,6 @@
>  
>  #define RQ_VENDOR_RESET_DEVICE		0x23 /* Try to reset the device */
>  #define RQ_VENDOR_QUERY_FW_CONFIG	0x24
> -

Nit: this is an unrelated change

I see you add another define here in the next patch, but perhaps you
should keep the newline separators before and after that one.

>  #define RQ_VENDOR_GET_VERSION		0x81 /* Get firmware version */
>  #define RQ_VENDOR_GET_PAGE		0x82 /* Read flash page */
>  #define RQ_VENDOR_GET_ROM_PROC		0x83 /* Get ROM process state */
> @@ -970,8 +982,32 @@ static int mxuport_calc_num_ports(struct usb_serial *serial,
>  	return num_ports;
>  }
>  
> +static void mxuport_set_fw_version(struct mxuport_fw_version *version,
> +				   u8 major, u8 minor, u8 build)

The naming is a bit unfortunate as this is not an inverse of
mxuport_get_fw_version() but that should be ok.

> +{
> +	version->major = major;
> +	version->minor = minor;
> +	version->build = build;
> +	version->value = (major << 16) | (minor << 8) | build;
> +}
> +
> +static int mxuport_parse_fw_version(const struct firmware *fw,
> +				    const u16 *offsets,
> +				    struct mxuport_fw_version *version)
> +{
> +	if (fw->size <= offsets[0] || fw->size <= offsets[1] ||
> +	    fw->size <= offsets[2])
> +		return -EINVAL;

I just merged this sanity check:

	https://lore.kernel.org/all/20260715084611.45995-1-pengpeng@iscas.ac.cn/

so you may want to rebase on my usb-linus branch if there is a v3,
otherwise I can fix it up.

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/log/?h=usb-linus

> +
> +	mxuport_set_fw_version(version, fw->data[offsets[0]],
> +			       fw->data[offsets[1]], fw->data[offsets[2]]);
> +
> +	return 0;
> +}
> +
>  /* Get the version of the firmware currently running. */
> -static int mxuport_get_fw_version(struct usb_serial *serial, u32 *version)
> +static int mxuport_get_fw_version(struct usb_serial *serial,
> +				  struct mxuport_fw_version *version)
>  {
>  	u8 *ver_buf;
>  	int err;
> @@ -988,7 +1024,7 @@ static int mxuport_get_fw_version(struct usb_serial *serial, u32 *version)
>  		goto out;
>  	}
>  
> -	*version = (ver_buf[0] << 16) | (ver_buf[1] << 8) | ver_buf[2];
> +	mxuport_set_fw_version(version, ver_buf[0], ver_buf[1], ver_buf[2]);
>  	err = 0;
>  out:
>  	kfree(ver_buf);
> @@ -1049,8 +1085,7 @@ static int mxuport_probe(struct usb_serial *serial,
>  {
>  	u16 productid = le16_to_cpu(serial->dev->descriptor.idProduct);
>  	const struct firmware *fw_p = NULL;
> -	u32 version;
> -	int local_ver;
> +	struct mxuport_fw_version version, local_ver;

Nit: I'd move this line above fw_p to maintain reverse xmas style of the
declarations.

>  	char buf[32];
>  	int err;

Johan
