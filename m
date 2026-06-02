Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D3F9463
	for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2026 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409344; cv=none; b=sdIpqPG0WyJJQoVPjdITj4tZwxHVR4VRABPlEVh7ifeKS3pOPAkDgAYvfjAN/AuJiyQkA+4AANAduxNYbGe4tcKRIB7jv1ssXpi/H7X9QivrsomwzMXfjlhrhK3rtmHxjg1WAjdzVUZCAf9zppPN/rMfxtf3c8ByvhT/JzukSLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409344; c=relaxed/simple;
	bh=HF2sG0xFGKo4ing1+lt8m4eKGzVEsQiU2A3AzfllwGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSy/JTzBF7vSZUNkDR/ljNL/h3m1Vf7xu8yGz7XVVNw1Lnk+SXqnx4yXVnxhRes5OH1MIK6iUPhnZfrs2/ex2hKDhA9maDH++Mrud0++8YroECEHewZJMqooqnhVmx2v/RILp0ptfYhkCXgPQquC8ODCdGgS3tXNTx8/YPEzELI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrWzZh+1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrWzZh+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACAE51F00893;
	Tue,  2 Jun 2026 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780409342;
	bh=TQzm2Gfj8x4+MTRk0xPkJmnom8anAVgoEpMElvD22lY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TrWzZh+1oL9Q9nuoyOEHYAlONr/Pu3hmvKRcLYjoNm4rHUVBXr61L70hhJe6vgte4
	 kgwDDwV8Rbzg9jn8Scw41fLI8M3fJPzyRoffDJ0TXZnJV/4DNue4kq+HEMVTmjYCua
	 t4PY1b5dUafql72VOjnTJfaq0+DZCtclBhozZZZmD7Vui5ALI/lf69dHrEe54frUHB
	 oZEU0LxIVl9qHfCqqXbQhshzteOnnv/YuXlvzLANi0HTLUsK7QPS94rjLVYizyfDjw
	 Pf0RfiJl3UrCE/JhG5a6HwAglGTIvH/uXWBXCJ/dv9tvVkso5xFDFPCEvaRd2E3k5Q
	 KaugzU34HavUg==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wUPng-0000000AONq-1Pe1;
	Tue, 02 Jun 2026 16:09:00 +0200
Date: Tue, 2 Jun 2026 16:09:00 +0200
From: Johan Hovold <johan@kernel.org>
To: Charles Yeh <charlesyeh522@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	charles-yeh@prolific.com.tw
Subject: Re: [PATCH v2] USB: serial: pl2303: add new PID to support PL256X
 (TYPE_MP)
Message-ID: <ah7j_HxoAQA-vZrr@hovoldconsulting.com>
References: <20260326123023.1711-1-charlesyeh522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326123023.1711-1-charlesyeh522@gmail.com>

Hi Charles,

and sorry about the delay.

First, this patch does quite a lot more than add a new PID so please
change the summary to something like:

	USB: serial: pl2303: add support for PL256X multi-port devices

which is more descriptive.

On Thu, Mar 26, 2026 at 08:30:23PM +0800, Charles Yeh wrote:
> Prolific has developed a new USB to Multi-UART chip: PL256X (TYPE_MP)
> PL256X : PL2543,PL2533,PL2565
> The Vendor request used by the PL256X (TYPE_MP) is different from
> the existing PL2303 series (TYPE_HXN / TYPE_HX ).
> Therefore, different Vendor requests are used to issue related commands.
> 
> 1. Added a new TYPE_MP type in pl2303_type, and then executes
>    new Vendor request,new flow control and other related instructions
>    if TYPE_MP is recognized.
> 
> 2. Added a interface_num in pl2303_serial_private, and then executes
>    new USB index request, if TYPE_MP is recognized.
> 
> 3. Because the new PL256X only accept the new Vendor request,
>    the old Vendor request cannot be accepted (the error message
>    will be returned)
>    So first determine the bcdDevice in pl2303_detect_type.
> 
> 4. In pl2303_open: Because TYPE_MP is different from the instruction of reset
>    down/up stream used by TYPE_HXN/TYPE_HX.
>    Therefore, we will also execute different instructions here.
>    pl256x_uart_reset
> 
> 5. In pl2303_set_termios: The UART flow control instructions used by
>    TYPE_MP/TYPE_HXN/TYPE_HX are different.
>    Therefore, we will also execute different instructions here.
> 
> 6. In pl2303_vendor_read & pl2303_vendor_write, since TYPE_MP is different
>    from the vendor request instruction used by TYPE_HXN/TYPE_HX,
>    it will also execute different instructions here.
> 
> 7. In pl2303_update_reg: TYPE_MP used different register for flow control.
>    Therefore, we will also execute different instructions here.
> 
> 8. The max baud rate of TYPE_MP is 24M bps, and don't support divisor encoding.
> 
> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> ---
> v2:
>  - remove unused variable 'dev' in pl2303_update_reg
> ---
>  drivers/usb/serial/pl2303.c | 109 +++++++++++++++++++++++++++++++++---
>  drivers/usb/serial/pl2303.h |   2 +-
>  2 files changed, 103 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index 50dc838e8115..67b78d2fcc92 100644
> --- a/drivers/usb/serial/pl2303.c
> +++ b/drivers/usb/serial/pl2303.c
> @@ -54,6 +54,7 @@ static const struct usb_device_id id_table[] = {
>  	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GL) },
>  	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GE) },
>  	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GS) },
> +	{ USB_DEVICE(PL2303_VENDOR_ID, PL256X_PRODUCT_ID_4P) },

Which devices is this? PL2533 (0x2533)?

What about the other variants you mention above (PL2543, PL2565)? Do
they use separate PIDs?

Also, judging from the Prolfic product page, these appear to be CDC
devices, which means we would need to blacklist them in the cdc-acm
driver.

Can you please post the output of usb-devices (or lsusb -v) for this
device?

>  	{ USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID) },
>  	{ USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID_RSAQ5) },
>  	{ USB_DEVICE(ATEN_VENDOR_ID, ATEN_PRODUCT_ID),
> @@ -144,10 +145,15 @@ MODULE_DEVICE_TABLE(usb, id_table);
>  #define VENDOR_WRITE_REQUEST_TYPE	0x40
>  #define VENDOR_WRITE_REQUEST		0x01
>  #define VENDOR_WRITE_NREQUEST		0x80
> +#define VENDOR_WRITE_MPREQUEST		0x80
>  
>  #define VENDOR_READ_REQUEST_TYPE	0xc0
>  #define VENDOR_READ_REQUEST		0x01
>  #define VENDOR_READ_NREQUEST		0x81
> +#define VENDOR_READ_MPREQUEST		0x80
> +
> +#define PL256X_RESET_REQUEST_TYPE	0x40
> +#define PL256X_RESET_REQUEST		0x96
>  
>  #define UART_STATE_INDEX		8
>  #define UART_STATE_MSR_MASK		0x8b
> @@ -175,6 +181,16 @@ MODULE_DEVICE_TABLE(usb, id_table);
>  #define PL2303_HXN_FLOWCTRL_RTS_CTS	0x18
>  #define PL2303_HXN_FLOWCTRL_XON_XOFF	0x0c
>  
> +#define PL256X_PORT_A_FLOWCTRL_REG	0xC005
> +#define PL256X_PORT_B_FLOWCTRL_REG	0xD005
> +#define PL256X_PORT_C_FLOWCTRL_REG	0xE005
> +#define PL256X_PORT_D_FLOWCTRL_REG	0xF005

nit: please use lowercase hex notation

> +
> +#define PL256X_FLOWCTRL_MASK		0x43

> +#define PL256X_FLOWCTRL_XON_XOFF	0x40
> +#define PL256X_FLOWCTRL_RTS_CTS		0x03

Does the device support having hardware and software flow control
enabled at the same time?

> +#define PL256X_FLOWCTRL_NONE		0x00
> +
>  static int pl2303_set_break(struct usb_serial_port *port, bool enable);
>  
>  enum pl2303_type {
> @@ -184,6 +200,7 @@ enum pl2303_type {
>  	TYPE_TB,
>  	TYPE_HXD,
>  	TYPE_HXN,
> +	TYPE_MP,
>  	TYPE_COUNT
>  };
>  
> @@ -199,6 +216,8 @@ struct pl2303_type_data {
>  struct pl2303_serial_private {
>  	const struct pl2303_type_data *type;
>  	unsigned long quirks;
> +	u16 interface_num;
> +	u16 flowctrl_reg;
>  };
>  
>  struct pl2303_private {
> @@ -239,8 +258,32 @@ static const struct pl2303_type_data pl2303_type_data[TYPE_COUNT] = {
>  		.max_baud_rate		= 12000000,
>  		.no_divisors		= true,
>  	},
> +	[TYPE_MP] = {
> +		.name			= "MP",
> +		.max_baud_rate		= 24000000,
> +		.no_divisors		= true,
> +	},
>  };
>  
> +static int pl256x_uart_reset(struct usb_serial *serial, u16 value, u16 index)

You only call this function from one place and there does not seem to be
any reason for passing in value and index (ifnum) that I can see.

> +{
> +	struct device *dev = &serial->interface->dev;
> +	int res;
> +
> +	dev_dbg(dev, "%s - [%04x] = %02x\n", __func__, value, index);

And then there is no need for this.

> +
> +	res = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
> +			PL256X_RESET_REQUEST, PL256X_RESET_REQUEST_TYPE,
> +			value, index, NULL, 0, 100);
> +	if (res) {
> +		dev_err(dev, "%s - failed to write [%04x]: %d\n", __func__,
> +								value, res);

And here you can just spell out "failed to reset device: %d\n".

> +		return res;
> +	}
> +
> +	return 0;
> +}
> +
>  static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
>  							unsigned char buf[1])
>  {
> @@ -251,6 +294,8 @@ static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
>  
>  	if (spriv->type == &pl2303_type_data[TYPE_HXN])
>  		request = VENDOR_READ_NREQUEST;
> +	else if (spriv->type == &pl2303_type_data[TYPE_MP])
> +		request = VENDOR_READ_MPREQUEST;
>  	else
>  		request = VENDOR_READ_REQUEST;
>  
> @@ -282,6 +327,8 @@ static int pl2303_vendor_write(struct usb_serial *serial, u16 value, u16 index)
>  
>  	if (spriv->type == &pl2303_type_data[TYPE_HXN])
>  		request = VENDOR_WRITE_NREQUEST;
> +	else if (spriv->type == &pl2303_type_data[TYPE_MP])
> +		request = VENDOR_WRITE_MPREQUEST;
>  	else
>  		request = VENDOR_WRITE_REQUEST;
>  
> @@ -307,10 +354,12 @@ static int pl2303_update_reg(struct usb_serial *serial, u8 reg, u8 mask, u8 val)
>  	if (!buf)
>  		return -ENOMEM;
>  
> -	if (spriv->type == &pl2303_type_data[TYPE_HXN])
> +	if (spriv->type == &pl2303_type_data[TYPE_HXN] ||
> +		spriv->type == &pl2303_type_data[TYPE_MP]) {

nit: please indent continuation lines at least two tabs.

>  		ret = pl2303_vendor_read(serial, reg, buf);
> -	else
> +	} else {
>  		ret = pl2303_vendor_read(serial, reg | 0x80, buf);
> +	}
>  
>  	if (ret)
>  		goto out_free;
> @@ -461,6 +510,14 @@ static int pl2303_detect_type(struct usb_serial *serial)
>  		case 0x905:	/* GT-2AB */
>  		case 0x1005:	/* GC-Q20 */
>  			return TYPE_HXN;
> +		case 0x3302:
> +		case 0x3304:
> +		case 0x4302:
> +		case 0x4304:
> +		case 0x6502:
> +		case 0x6504:
> +		case 0x6506:

Can you add a comment here after each number so we know which device
type they map to?

I assume its PL2533-2P, PL2533-4P, etc?

> +			return TYPE_MP;
>  		}
>  		break;
>  	}
> @@ -495,6 +552,7 @@ static int pl2303_startup(struct usb_serial *serial)
>  	enum pl2303_type type;
>  	unsigned char *buf;
>  	int ret;
> +	unsigned int ifnum;

nit: please try to maintain reverse xmas style by moving this one after
buf.

>  
>  	ret = pl2303_detect_type(serial);
>  	if (ret < 0)
> @@ -503,20 +561,42 @@ static int pl2303_startup(struct usb_serial *serial)
>  	type = ret;
>  	dev_dbg(&serial->interface->dev, "device type: %s\n", pl2303_type_data[type].name);
>  
> +	ifnum = serial->interface->altsetting->desc.bInterfaceNumber;
> +
>  	spriv = kzalloc_obj(*spriv);
>  	if (!spriv)
>  		return -ENOMEM;
>  
> +	if (type == TYPE_MP) {
> +		switch (ifnum) {
> +		case 0:
> +			spriv->flowctrl_reg = PL256X_PORT_A_FLOWCTRL_REG;
> +			break;
> +		case 1:
> +			spriv->flowctrl_reg = PL256X_PORT_B_FLOWCTRL_REG;
> +			break;
> +		case 2:
> +			spriv->flowctrl_reg = PL256X_PORT_C_FLOWCTRL_REG;
> +			break;
> +		case 3:
> +			spriv->flowctrl_reg = PL256X_PORT_D_FLOWCTRL_REG;
> +			break;
> +		}

We need a default case here as well. You can just return an error.

> +	}
> +
>  	spriv->type = &pl2303_type_data[type];
>  	spriv->quirks = (unsigned long)usb_get_serial_data(serial);
>  	spriv->quirks |= spriv->type->quirks;
> +	spriv->interface_num = ifnum;
>  
>  	if (type == TYPE_HXD && pl2303_is_hxd_clone(serial))
>  		spriv->quirks |= PL2303_QUIRK_NO_BREAK_GETLINE;
>  
>  	usb_set_serial_data(serial, spriv);
>  
> -	if (type != TYPE_HXN) {
> +	if (type == TYPE_MP)
> +		pl2303_vendor_write(serial, spriv->flowctrl_reg, PL256X_FLOWCTRL_NONE);

Why you need to disable flow control here? The setting should be updated
per termios when the device is later opened.

> +	else if (type != TYPE_HXN) {
>  		buf = kmalloc(1, GFP_KERNEL);
>  		if (!buf) {
>  			kfree(spriv);

Overall, this looks pretty good.

Johan
