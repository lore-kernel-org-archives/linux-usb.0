Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375CA2C0F84;
	Mon, 25 May 2026 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779688673; cv=none; b=KYQ0v4GidnEnBdVQeOFIldbuq26j/Fl+nzIzUKX0EF63l3dz61ulpoMlquQBISwkPmm5dkqqTm4nWf+XO6Fi1nbGiVToyZ8iC52a9BkbzMRC54uQCCGJO2bBTD6FIaFM+38qdcHsNw35HYogRSbOdjdQqilkmnEm+2jE8Iri16I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779688673; c=relaxed/simple;
	bh=jeo+1g/1eudM/pWDofw+x1WK9vQ5lRNg8DiDlLC0R7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=en6gCwHaH6Cct1Vqwp6R0bL/QvXiLDXLaL4PpoJSTOsxM7qwE87a75w2bLQVpeP5u09Z+NOMvxKksXfV9MFKWOrrESwv0/xHH4Y3+3giFGNrQJOVNXmkxX1MUz5YDuDvwWig8U57Jky0mW06I3Nmr0QM5ipajcIUo0Bnzof8FCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HFkjgPoZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HFkjgPoZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7651F000E9;
	Mon, 25 May 2026 05:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779688671;
	bh=vDOUT7PbbqppuXgg2Z1C/wO0TznuzajnVw+XpnEV+z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HFkjgPoZVp7xoux3byyYdLk8+OzxOe49u8ekXNALHual3RtrJ5AdGGlkbDxmzrigH
	 88Mf/HTZ854vLtRitYcbVB/tf3KIXpdIVtTyLNpfJVa33tVyi1GGwyA1ubtBozfDWr
	 6ugP+xRsH0Yb/CppotLIhNisY48vBZ2pEMs7s6tA=
Date: Mon, 25 May 2026 07:57:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Adrian Korwel <adriank20047@gmail.com>
Cc: linux-usb@vger.kernel.org, johan@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: io_ti: fix heap overflows in
 get_manuf_info() and build_i2c_fw_hdr()
Message-ID: <2026052525-devotee-reclaim-7673@gregkh>
References: <CADgB2mF95N09=gOvBZ+4ePSQ-0wCynx-rbu=aiyQecT=iDdyRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADgB2mF95N09=gOvBZ+4ePSQ-0wCynx-rbu=aiyQecT=iDdyRw@mail.gmail.com>

On Sun, May 24, 2026 at 09:20:51PM -0500, Adrian Korwel wrote:
> Two heap overflows exist in this driver:
> 
> 1. get_manuf_info() reads le16_to_cpu(rom_desc->Size) bytes from the
>    device I2C EEPROM into a buffer allocated with kmalloc_obj(), which
>    is sizeof(struct edge_ti_manuf_descriptor) = 10 bytes.
> 
>    The Size field comes from the device and is only validated to fit
>    within TI_MAX_I2C_SIZE (16384 bytes), not against the destination
>    buffer size. A malicious USB device can therefore set Size to any
>    value up to 16383, causing a heap overflow of up to 16373 bytes
>    when plugged into a host running this driver.
> 
>    valid_csum() is called after read_rom() and also iterates
>    buffer[0..Size-1], compounding the out-of-bounds access.
> 
>    Fix by rejecting descriptors larger than the destination struct
>    before calling read_rom().
> 
> 2. build_i2c_fw_hdr() allocates a fixed-size buffer of
>    (16*1024 - 512) + sizeof(struct ti_i2c_firmware_rec) bytes, then
>    copies le16_to_cpu(img_header->Length) bytes into it without
>    validating that Length fits within the available space after the
>    firmware record header. img_header->Length is a __le16 from the
>    firmware file and can be up to 65535. check_fw_sanity() validates
>    the total firmware size but not img_header->Length specifically.

Should be 2 patches, right?

> 
>    Fix by rejecting images where img_header->Length exceeds the
>    available destination space.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Korwel <adriank20047@gmail.com>

What tool found and fixed these issues?

> ---
>  drivers/usb/serial/io_ti.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
> index cb55370e036f..afe29fdf9536 100644
> --- a/drivers/usb/serial/io_ti.c
> +++ b/drivers/usb/serial/io_ti.c
> @@ -773,6 +773,12 @@ static int get_manuf_info(struct edgeport_serial
> *serial, u8 *buffer)
>         }
> 
>         /* Read the descriptor data */
> +       if (le16_to_cpu(rom_desc->Size) > sizeof(struct
> edge_ti_manuf_descriptor)) {

Your patch is corrupted and can not be applied :(

thanks,

greg k-h
