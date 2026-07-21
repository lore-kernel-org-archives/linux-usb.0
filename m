Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2913D4C9575;
	Tue, 21 Jul 2026 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645949; cv=none; b=b2m+l2lpPmfCEwBIKco//4e6YmrHTHnbu9lgd+jyYRdj/EDO7JnaPrdsL7wLwCXsOacGjX+d4/58tbUvDUMWMeSM1Ag7Xwtml4bli4yKVKXLAy+jttfGWkOEiprQ1Wd90wYJeeYEoL300njDhGCdjetYb76FKbapqELKVrdMe9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645949; c=relaxed/simple;
	bh=/NGdiKxZaD3Py3xrJNAkaK2Yr+dstP+05KArXho0mtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGEGjgXDPkZQ19fGfh4me8xOfI8DBycAEztKP3p33OnQXhiXRE/Ji2eSCtLDbm8O8pDBuHOFxdRApEYtLv4km59TDmimOUSM2s1iZsXO7Wjbd3m0m3XoTWbyVdAR/ub5fuLA/Pj7efCDz2KYchSuDBa5s/6PZmjbCi+MnmmuFhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPx09/oB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPx09/oB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CE81F000E9;
	Tue, 21 Jul 2026 14:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784645947;
	bh=LLn0lUO38fnApxmEx1deyqzkk9eaTKyVI3WiebExEr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nPx09/oB0PfCaEgBYRwv2TS+pXsri0mOGAdFDsnVtg8dAI1F4XiKaJayCW0fd9Gcw
	 D+RG4Lt1A0vzDSX0CXAjiXaFGQ9MC2UT7FUJCb4+z1ou/cWzZgKpACe5d1IvLZgCHv
	 3Y723G31mCGor2eH2Wo3WFxI4kUBnSawqOQzPfxf8of/bYddSHWI2n12wlSspd7BZX
	 ZgLJEwmTQH7V5Mal5mcyrotozg5si/a7b/WveCziLrlhtSoFvDyBMArSSPzLyC3Vb0
	 L8gigQDpGYiXbIkOzxbGFKLAn83A6x30/x9W2MHz7iNA7qxjFnhGGZN48CqFd36zsx
	 ZgnyBgM3e19Lg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wmBw1-000000092mj-1ywn;
	Tue, 21 Jul 2026 16:59:05 +0200
Date: Tue, 21 Jul 2026 16:59:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com
Subject: Re: [PATCH v2 2/4] USB: serial: mxuport: add MUX50U-based device
 support
Message-ID: <al-JOStaDglCBoL1@hovoldconsulting.com>
References: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
 <20260623080138.166398-4-crescentcy.hsieh@moxa.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623080138.166398-4-crescentcy.hsieh@moxa.com>

On Tue, Jun 23, 2026 at 04:01:37PM +0800, Crescent Hsieh wrote:
> Add support for MUX50U-based UPort G2 devices and Platform UARTs.
> 
> Encode the firmware family in the USB device id table so that the table
> remains the single source for both the number of ports and the firmware
> handling policy.
> 
> The MUX50U-based devices use two shared firmware images: UPort G2
> devices use the UP firmware image (moxa-up-mux50u.fw), while Platform
> UARTs use the PF firmware image (moxa-pf-mux50u.fw). Platform UARTs are
> board-level UARTs accessed through the USB bus.
> 
> For MUX50U-based devices, the factory firmware reports versions in a
> different format from the bundled runtime firmware image, so version
> comparison cannot reliably determine whether a firmware download is
> needed. The system-register remap state is used instead to check whether
> the device has already booted the runtime firmware from SRAM.
> 
> Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
> ---
>  drivers/usb/serial/mxuport.c | 174 ++++++++++++++++++++++++++++++++---
>  1 file changed, 162 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> index 5a9dd251ceff..067c8d9752e0 100644
> --- a/drivers/usb/serial/mxuport.c
> +++ b/drivers/usb/serial/mxuport.c
> @@ -7,8 +7,11 @@
>   *
>   *	Supports the following Moxa USB to serial converters:
>   *	 2 ports : UPort 1250, UPort 1250I
> + *		   UPort 1250 G2, UPort 1250I G2
>   *	 4 ports : UPort 1410, UPort 1450, UPort 1450I
> + *		   UPort 1410 G2, UPort 1450 G2, UPort 1450I G2
>   *	 8 ports : UPort 1610-8, UPort 1650-8
> + *		   UPort 1610-8 G2, UPort 1650-8 G2
>   *	16 ports : UPort 1610-16, UPort 1650-16

Should you add the MUx50U ones here as well for completeness? At least
some of them seem to be missing.

But perhaps it's just me not getting how these PIDs map to products.

>   */
>  
> @@ -37,6 +40,24 @@
>  #define MX_UPORT1613_PID	0x1613
>  #define MX_UPORT1653_PID	0x1653
>  
> +#define MX_UPORT1252_PID	0x1252
> +#define MX_UPORT1253_PID	0x1253
> +#define MX_UPORT1411_PID	0x1411
> +#define MX_UPORT1452_PID	0x1452
> +#define MX_UPORT1453_PID	0x1453
> +#define MX_UPORT1619_PID	0x1619
> +#define MX_UPORT1659_PID	0x1659
> +#define MX_UPORT165A_PID	0x165a
> +#define MX_UPORT165B_PID	0x165b

I realise this is how the existing PID defines are named, but would it
not be possible to name the defines after the products they are used
for?

> +
> +#define MX_MU250U_PID		0x0250
> +#define MX_MU450U_PID		0x0450
> +#define MX_MU850U_PID		0x0850
> +#define MX_MU850U_6PORT_PID	0x7002
> +#define MX_MUX50U_3PORT_PID	0x7003
> +#define MX_MU850U_5PORT_PID	0x7004
> +#define MX_MU850U_7PORT_PID	0x7005
> +
>  /* Definitions for USB info */
>  #define HEADER_SIZE		4
>  #define EVENT_LENGTH		8
> @@ -46,6 +67,13 @@
>  #define MX_FW_VER_BYTE1_OFF		0x20
>  #define MX_FW_VER_BYTE2_OFF		0x24
>  #define MX_FW_VER_BYTE3_OFF		0x28
> +#define MX_MUX50U_FW_VER_BYTE1_OFF	0x86
> +#define MX_MUX50U_FW_VER_BYTE2_OFF	0x88
> +#define MX_MUX50U_FW_VER_BYTE3_OFF	0x8a
> +
> +#define MX_SYS_REG_REMAP_OFF		0x20
> +#define MX_PWR_REMAP_MASK		0x03
> +#define MX_REMAP_TO_SRAM		0x02
>  
>  struct mxuport_fw_version {
>  	u8 major;
> @@ -60,6 +88,12 @@ static const u16 mxuport_fw_ver_offsets[] = {
>  	MX_FW_VER_BYTE3_OFF,
>  };
>  
> +static const u16 mxuport_mux50u_fw_ver_offsets[] = {
> +	MX_MUX50U_FW_VER_BYTE1_OFF,
> +	MX_MUX50U_FW_VER_BYTE2_OFF,
> +	MX_MUX50U_FW_VER_BYTE3_OFF,
> +};
> +
>  /* Definitions for USB vendor request */
>  #define RQ_VENDOR_NONE			0x00
>  #define RQ_VENDOR_SET_BAUD		0x01 /* Set baud rate */
> @@ -95,6 +129,7 @@ static const u16 mxuport_fw_ver_offsets[] = {
>  
>  #define RQ_VENDOR_RESET_DEVICE		0x23 /* Try to reset the device */
>  #define RQ_VENDOR_QUERY_FW_CONFIG	0x24
> +#define RQ_VENDOR_GET_SYS_REG		0x34

So here I guess you should have a newline separator before and after
0x34 to follow the existing style (of grouping related registers).

>  #define RQ_VENDOR_GET_VERSION		0x81 /* Get firmware version */
>  #define RQ_VENDOR_GET_PAGE		0x82 /* Read flash page */
>  #define RQ_VENDOR_GET_ROM_PROC		0x83 /* Get ROM process state */
> @@ -169,26 +204,65 @@ struct mxuport_port {
>  #define MX_PORTS_OFFSET			1
>  #define MX_PORTS(n)			(((n) - MX_PORTS_OFFSET) & MX_PORTS_MASK)
>  
> +#define MX_FW_FAMILY_MASK		GENMASK(5, 4)
> +#define MX_FW_UPORT_G1			(0 << 4)
> +#define MX_FW_UPORT_G2			(1 << 4)
> +#define MX_FW_PLATFORM_UART		(2 << 4)
> +#define MX_FW_FAMILY(info)		((info) & MX_FW_FAMILY_MASK)
> +#define MX_DEVICE_INFO(ports, family)	(MX_PORTS(ports) | (family))
> +
>  /* Table of devices that work with this driver */
>  static const struct usb_device_id mxuport_idtable[] = {
>  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1250_PID),
> -	  .driver_info = MX_PORTS(2) },
> +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G1) },
>  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1251_PID),
> -	  .driver_info = MX_PORTS(2) },
> +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G1) },
>  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1410_PID),
> -	  .driver_info = MX_PORTS(4) },
> +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G1) },
>  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1450_PID),
> -	  .driver_info = MX_PORTS(4) },
> +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G1) },
>  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1451_PID),
> -	  .driver_info = MX_PORTS(4) },
> +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G1) },
>  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1618_PID),
> -	  .driver_info = MX_PORTS(8) },
> +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G1) },
>  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1658_PID),
> -	  .driver_info = MX_PORTS(8) },
> +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G1) },
>  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1613_PID),
> -	  .driver_info = MX_PORTS(16) },
> +	  .driver_info = MX_DEVICE_INFO(16, MX_FW_UPORT_G1) },
>  	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1653_PID),
> -	  .driver_info = MX_PORTS(16) },

My initial reaction was that it would be better to just leave the gen1
entries alone (with family implicitly set to MX_FW_UPORT_G1), but I
guess this is fine too.

> +	  .driver_info = MX_DEVICE_INFO(16, MX_FW_UPORT_G1) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1252_PID),
> +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G2) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1253_PID),
> +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_UPORT_G2) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1411_PID),
> +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G2) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1452_PID),
> +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G2) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1453_PID),
> +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_UPORT_G2) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1619_PID),
> +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1659_PID),
> +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT165A_PID),
> +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT165B_PID),
> +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_UPORT_G2) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU250U_PID),
> +	  .driver_info = MX_DEVICE_INFO(2, MX_FW_PLATFORM_UART) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU450U_PID),
> +	  .driver_info = MX_DEVICE_INFO(4, MX_FW_PLATFORM_UART) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_PID),
> +	  .driver_info = MX_DEVICE_INFO(8, MX_FW_PLATFORM_UART) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_6PORT_PID),
> +	  .driver_info = MX_DEVICE_INFO(6, MX_FW_PLATFORM_UART) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MUX50U_3PORT_PID),
> +	  .driver_info = MX_DEVICE_INFO(3, MX_FW_PLATFORM_UART) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_5PORT_PID),
> +	  .driver_info = MX_DEVICE_INFO(5, MX_FW_PLATFORM_UART) },
> +	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_7PORT_PID),
> +	  .driver_info = MX_DEVICE_INFO(7, MX_FW_PLATFORM_UART) },
>  	{}			/* Terminating entry */
>  };

Perhaps the family defines can be shortened to make this a bit more
readable, for example:

	MX_FW_UP_G1
	MX_FW_UP_G2
	MX_FW_PF

or even

	MX_UP_G1
	MX_UP_G2
	MX_PF

I didn't try and see what the result looks like. Perhaps the more
verbose names are preferred.

> @@ -1083,9 +1219,12 @@ static int mxuport_download_fw(struct usb_serial *serial,
>  static int mxuport_probe(struct usb_serial *serial,
>  			 const struct usb_device_id *id)
>  {
> +	unsigned long features = id->driver_info;
> +	const u16 *fw_version_offsets;

Nit: reverse xmas tends to be more readable

>  	u16 productid = le16_to_cpu(serial->dev->descriptor.idProduct);
>  	const struct firmware *fw_p = NULL;
>  	struct mxuport_fw_version version, local_ver;
> +	bool download_fw, from_sram;
>  	char buf[32];
>  	int err;

Johan
