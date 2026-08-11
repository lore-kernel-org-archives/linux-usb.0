Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B3439DBCC
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433338; cv=pass; b=JFAXSBCJrjkn7uevrrJH/dkl2sifV91b/ybJomS+Qj/fL+kJDb7amrA8qkFrKt1h3/lVabojls57fvi8WuCLAgzXZmyQjajz5VwyEeU1P7RsQjifvooIRlp+ZAYMJCD85zcWLsd9wVCpUCmihwpLJtohh3B+7pV6AR2akSsH2ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433338; c=relaxed/simple;
	bh=ctm3ZAHWWBnEECokGkSLGaVl0GnAtGmmgQtN6ifa3h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NoJi0dI/yGdVkrJD9nGXGALTV7hJmLRQF4VBRF9m/BbNL89XqzH2eKgpdOtMU/qNLU1T2+KqHSLr3jz0MKSHD5ADu/tPWBprPwfVBvGd0Qvrf7CoEDJz1eHDf+1M0PjQEmSOD9c913+p8ugqknoJ7MY6ykkRtFdu3BoBiCAo11A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tMpA5NAx; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tMpA5NAx"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39da69c5ba3so25945791fa.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 00:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786433332; cv=none;
        d=google.com; s=arc-20260327;
        b=ZM+pWB9/7QXSM9XzzL5DwLnmrici7993PEWICCOOhTGMImppTsKF75CnNiGsDXn6Ub
         LYa/uZDdrGGYXzaNGaQSCgvPs6CRwlc68SCuHbH02L3Z37vUTqEi9wqdS5oEhbXID5e9
         1pkOdOBcoLnycnwuFOOkcblygx5mFn+govKM5EUBm0Zlibf2qpidJm0izKhWPWP3JGH6
         uuU3XYaEw2nBouOM2WGUH6H8dKztwU6RYoaE867Mu3W6hedpFkL9+C+2YP6wBrE7Rfp1
         3XlUQC1PagWIMRG4yMT6jQp//q4q2g8KPpue1ZxbVN7vtSCD+mOdBwQ60RuLI6VH67mS
         H8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z/zr7TxKaa0PaUfzeImk0kC+ZU9hE9NO7T6kWVOo2YA=;
        fh=M6OwuEPYIraLR3xuARxJDjhZsmD/qcMeoqqWG3El1Yk=;
        b=TimWrS+zxWaEdch7YejSQFQvIu/D4n2dwxjpY1VNzjZonOoHxUU5iKtYmhTrZBbnRR
         2vyAKq5RDgBxvz2yKfg3r8rPewgm1eEUBBMsRNVS3QLvkVa4ZFefOKKeeAQqcPTcP75b
         kyfzjzTkiolIR6k7bRI1cuSON81KUbQx9G883Qo+dvE3bY3Rzfx/al00D2RGPbUuUxt/
         B0Sg+6mFdY3k6N0eKrPSBAfpXNuSqXICkl7iEs78du5X6MWwcJruwF4zgB71NiEUqDr0
         tgucppVJLjmHu3l3muvKWtk2LN/8iikG2QaVF+6Cn2Qn+1Y8Vv2a2c9KYF62bG0Zgy5q
         td4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786433332; x=1787038132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z/zr7TxKaa0PaUfzeImk0kC+ZU9hE9NO7T6kWVOo2YA=;
        b=tMpA5NAxo86f2uhOXABtA9IbFmxykTsGtRS72WfGwL8asVCaE0kp8Cvxb7473a1Rwj
         Wc4uif5erxbS/cyFzIYJMarJapvTvL4u4x6z9We38pcsLc6YOxcF5UHJMlRN7lAXCTXC
         GIFw8DKGoxqiakHJDm8LJoW+tpzyucDIIA3ed8crXW9JpB8+CwDKpvMQw5jDqcLCu8rR
         ceqBqVlE+PX14zZx/IT+xz5WBV2of10kuEICzuZ01FBFw/qVJ2v68tKhtNWTJCNmszHo
         JuhSTC/5CTdLTxpHyb9BsuyPw2NGtm/8h1HkxRvgD6cy+kHrqcECpNN1XNk6lMFs+cdQ
         UbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433332; x=1787038132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/zr7TxKaa0PaUfzeImk0kC+ZU9hE9NO7T6kWVOo2YA=;
        b=gfZvy2tWF+phFN7B8zYQz1vKKLUYTLrceASYNDCOko59RnPspASttwjoxbEytenye3
         NshhZzQMomH4GQFXNCnY+RHfPXTpUtmFYXZ36rvP4svlcOjlAPQKRfmx49oxHPNhocHy
         sdInWobjkiL0TvkKN5UJ5lHHxJmU75dmCc6YSoyhllC5h9dLzP/QOkv/vT33Of7SGxA3
         NR9N5Cy6zh7yM4L1+W9GwuHd9ThvxLYFahNBG/SBwqppOiw5xcL+WiHaStkWk6L+7E/d
         eKfJK7zk59b57FcABNdZ+WOvNa0Cve1tCJT+4OILptNvFA3eekD3NhBYp07wtH835ia7
         DETg==
X-Forwarded-Encrypted: i=1; AHgh+RopIzphfV3RuADhTKrW7sIJZ7FF2i/4tHjWU7YmfjhTTmo0lXXj3E0ShlOdjlosyNMRUQBwAyLdChc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEw1wspHZM/MtV19knJylGtcQYW5H0Y9D2o1Slnf1DURe1STZU
	ZkWiQP3/0V4DYFMDIGcU+p2z7gPwe+LQ+GfHvSVBQhdLb/38odaElFLr9hdajVj/fdAWXcGyRlU
	1T4kfTNL0HwoGKQneWSK8w/GDLXUUbK8=
X-Gm-Gg: AR+sD10WedDNwdaRKALBZYQ/3WyCJn/2QudQ2oKUcmldl/uyrVUpzyGAjfn2D+JZdrM
	SlJ1XFlUL3Lkb/6re8AeL7/SfvFSLnnec+fwq6hZi0pdNOO21bGgD866FZ907jOJcwfkCJXGxLN
	q1U3eZqAn25QGAja2rmebPBzHZj1tLi6x/KmHl/2JN7ctXW3u66vy9IzsESP4ybUizVsNfC744h
	wO7pMIYt7i6Fz4MKPfFbi7OZlUaF+ZPLphlAF+58Ac7slXtsUFZsWs4SE7WseMmWRE54yzXbUds
	SkWDaQHc8NYm4gfVSWnfzi8WWhA2d8Cv0Nwz+HFjSHuD1oBQoUN286STG5fSe9IQ/WP6pJq17EL
	VvA==
X-Received: by 2002:a2e:ad13:0:b0:39f:ef56:65dd with SMTP id
 38308e7fff4ca-3a0f8dacee6mr1595831fa.24.1786433330913; Tue, 11 Aug 2026
 00:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cb5abe7e-8795-46d0-b5cd-66e1bf34fd49@suse.com>
 <20260317061446.9528-1-syhuang3@nuvoton.com> <afto223bDW2MV3bj@hovoldconsulting.com>
In-Reply-To: <afto223bDW2MV3bj@hovoldconsulting.com>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Tue, 11 Aug 2026 15:28:39 +0800
X-Gm-Features: AUfX_mwP0Ddgp23-7nhKz1GGkEmerU5C2h2loKKMtJJ1Nba1tyLstl0Qw1VqnF8
Message-ID: <CACW=pY69QdcZ8Su0t4e2Ws9kooEkeUV7MG=Z=YSWeLnF9bR+ww@mail.gmail.com>
Subject: Re: [PATCH v6] USB: serial: nct_usb_serial: add support for Nuvoton
 USB adapter
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

Thanks for the review. Please see my replies below.

> You never replied to my previous comments here:
>
> First, can you even control RTS when the device is in hardware flow
> control mode?

Thanks for raising this. I confirmed that the chip does not provide
automatic hardware flow control, so I think the driver still needs to
handle this explicitly. Based on that, I think the existing driver-side
handling should be kept for now.

> Second, I think you're supposed to just stop reading from the device
> here to exert back pressure so that it in turn deasserts RTS.

I am not sure that approach would work here, since the chip does not
provide automatic hardware flow control.

Best regards,
Sheng-Yuan Huang

> Johan Hovold <johan@kernel.org> =E6=96=BC 2026=E5=B9=B45=E6=9C=887=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Mar 17, 2026 at 02:14:46PM +0800, hsyemail2@gmail.com wrote:
> > From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> >
> > Add support for the Nuvoton USB-to-serial adapter, which provides
> > multiple serial ports over a single USB interface.
> >
> > The device exposes one control endpoint, one bulk-in endpoint, and
> > one bulk-out endpoint for data transfer. Port status is reported via
> > an interrupt-in or bulk-in endpoint, depending on device configuration.
> >
> > This driver implements basic TTY operations.
> >
> > Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> > ---
> >
> > v6:
> > - Address review comments from Oliver Neukum
> > - Thanks to Oliver Neukum and Johan Hovold for their review
> > - Narrow the protected scope in nct_tiocmset_helper(): port_lock now
> >   protects only cached HCR updates, while command transmission is
> >   serialized separately.
> > - Serialize the open transaction to prevent concurrent open calls
> >   from returning success before startup completes or before the open
> >   command is sent.
> > - Serialize the close transaction to avoid resource races.
>
> Please include the changelog for all revisions here when resending.
>
> >  drivers/usb/serial/Kconfig          |   10 +
> >  drivers/usb/serial/Makefile         |    1 +
> >  drivers/usb/serial/nct_usb_serial.c | 1455 +++++++++++++++++++++++++++
> >  3 files changed, 1466 insertions(+)
> >  create mode 100644 drivers/usb/serial/nct_usb_serial.c
> >
> > diff --git a/drivers/usb/serial/Kconfig b/drivers/usb/serial/Kconfig
> > index ef8d1c73c754..96a022bb9b21 100644
> > --- a/drivers/usb/serial/Kconfig
> > +++ b/drivers/usb/serial/Kconfig
> > @@ -443,6 +443,16 @@ config USB_SERIAL_NAVMAN
> >         To compile this driver as a module, choose M here: the
> >         module will be called navman.
> >
> > +config USB_SERIAL_NUV_MULTI_UART
> > +     tristate "USB Nuvoton Multi-Ports Serial Driver"
> > +     depends on USB_SERIAL
> > +     help
> > +     Say Y here if you want to use a Nuvoton Multi-Ports USB to
> > +     serial converter device
> > +
> > +     To compile this driver as a module, choose M here: the
> > +     module will be called nct_usb_serial.
> > +
> >  config USB_SERIAL_PL2303
> >       tristate "USB Prolific 2303 Single Port Serial Driver"
> >       help
> > diff --git a/drivers/usb/serial/Makefile b/drivers/usb/serial/Makefile
> > index c7bb1a88173e..c07919a52076 100644
> > --- a/drivers/usb/serial/Makefile
> > +++ b/drivers/usb/serial/Makefile
> > @@ -41,6 +41,7 @@ obj-$(CONFIG_USB_SERIAL_MOS7720)            +=3D mos7=
720.o
> >  obj-$(CONFIG_USB_SERIAL_MOS7840)             +=3D mos7840.o
> >  obj-$(CONFIG_USB_SERIAL_MXUPORT)             +=3D mxuport.o
> >  obj-$(CONFIG_USB_SERIAL_NAVMAN)                      +=3D navman.o
> > +obj-$(CONFIG_USB_SERIAL_NUV_MULTI_UART)              +=3D nct_usb_seri=
al.o
> >  obj-$(CONFIG_USB_SERIAL_OMNINET)             +=3D omninet.o
> >  obj-$(CONFIG_USB_SERIAL_OPTICON)             +=3D opticon.o
> >  obj-$(CONFIG_USB_SERIAL_OPTION)                      +=3D option.o
> > diff --git a/drivers/usb/serial/nct_usb_serial.c b/drivers/usb/serial/n=
ct_usb_serial.c
> > new file mode 100644
> > index 000000000000..89dbfdc92136
> > --- /dev/null
> > +++ b/drivers/usb/serial/nct_usb_serial.c
> > @@ -0,0 +1,1455 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2024-2025 Nuvoton Corp
> > + * Copyright (C) 2024-2025 Sheng-Yuan Huang <syhuang3@nuvoton.com>
> > + *
> > + * Nuvoton USB to serial adapter driver
> > + *
> > + * This device interface consists of one control endpoint for configur=
ation,
> > + * one bulk-out endpoint used for transmitting data for all serial por=
ts,
> > + * and one bulk-in endpoint for receiving data from all serial ports.
> > + * The status of the ports may be reported via either an interrupt end=
point
> > + * or the bulk-in endpoint, depending on the device configuration.
> > + *
> > + * The number of serial ports is configurable in firmware and reported=
 to
> > + * the driver via a vendor command at probe time.
> > + *
> > + * Host-device handshake sequence:
> > + *   1. Host sends SET_INIT to initialize the device.
> > + *   2. Host sends GET_PORTS_SUPPORT to query enabled ports (bitmask).
> > + *   3. For each port open: Host sends SET_OPEN_PORT.
> > + *   4. Host sends SET_CONFIG/SET_BAUD to configure UART parameters.
> > + *   5. For each port close: Host sends SET_CLOSE_PORT.
> > + */
> > +
> > +#include <linux/bitops.h>
>
> I don't think this one is used.
>
> > +#include <linux/errno.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
>
> > +#include <linux/moduleparam.h>
>
> Nor this one.
>
> > +#include <linux/serial.h>
>
> Nor this one?
>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/tty.h>
>
> > +#include <linux/tty_driver.h>
> > +#include <linux/tty_port.h>
>
> These two are typically included via tty.h (and you don't need the first
> one either way).
>
> > +#include <linux/tty_flip.h>
>
> > +#include <linux/uaccess.h>
>
> Same here.
>
> > +#include <linux/usb.h>
> > +#include <linux/usb/serial.h>
> > +#include <linux/kfifo.h>
> > +#include <linux/mutex.h>
> > +
> > +#define NCT_WRITE_FIFO_SIZE 1024
> > +
> > +#define NCT_VENDOR_ID                        0x0416
> > +#define NCT_PRODUCT_ID                       0x200b
> > +#define NCT_USB_CLASS                        0xff
> > +#define NCT_USB_SUBCLASS             0x0
> > +#define NCT_USB_PROTOCOL             0x1
> > +
> > +#define NCT_MAX_VENDOR_READ_SIZE     8
> > +
> > +static const struct usb_device_id id_table[] =3D {
> > +     {USB_DEVICE_AND_INTERFACE_INFO(NCT_VENDOR_ID, NCT_PRODUCT_ID,
> > +                                    NCT_USB_CLASS, NCT_USB_SUBCLASS,
> > +                                    NCT_USB_PROTOCOL)},
>
> I already asked you why you match on the interface class and protocol
> here. Does the device have more than one interface?
>
> Please post the corresponding output of usb-devices.
>
> > +     {} /* Terminating entry */
> > +};
> > +
> > +MODULE_DEVICE_TABLE(usb, id_table);
> > +
> > +#define NCT_MAX_SEND_BULK_SIZE 128
>
> This one is unused. What does it represent and should it be used instead
> of removed?
>
> I also asked you about the meaning of the following defines in v4, but
> you never replied:
>
>         > +#define NCT_MAX_PACKAGE_SIZE         4096 /* The max size of o=
ne
>         > writing package */
>         > +#define NCT_MAX_BULK_IN_SIZE         512
>         > +#define NCT_MAX_BULK_OUT_SIZE        512
>
>         The last three are not used either. Might they become useful? Can=
 you
>         expand on their meaning?
>
> > +/* The port does not exist in FW (for device status). */
> > +#define NCT_EMPTY_PORT       0xff
> > +
> > +/* Hardware configuration */
> > +#define NCT_MAX_NUM_COM_DEVICES              8
> > +
> > +#define NCT_DEFAULT_BAUD             14 /* 115200 */
> > +static const unsigned int NCT_BAUD_SUP[] =3D {
> > +     /* It should be the same as FW's baud-rate table. */
> > +     B0,     B50,    B75,    B150,   B300,   B600,   B1200,
> > +     B1800,  B2400,  B4800,  B9600,  B19200, B38400, B57600,
> > +     B115200, B230400, B460800, B921600, B1500000
> > +};
> > +
> > +/* USB request */
> > +#define NCT_VENDOR_COM_READ_REQUEST_TYPE     0xc0
> > +#define NCT_VENDOR_COM_WRITE_REQUEST_TYPE    0x40
> > +#define NCT_VENDOR_COM_READ_REQUEST          0x01
> > +#define NCT_VENDOR_COM_WRITE_REQUEST         0x01
> > +/* Index definition */
> > +#define NCT_VCOM_INDEX_GLOBAL        0x0f
> > +
> > +/* Command */
> > +#define NCT_VCOM_GET_NUM_PORTS               0
> > +#define NCT_VCOM_GET_PORTS_SUPPORT   1
> > +#define NCT_VCOM_GET_BAUD            2
> > +#define NCT_VCOM_SET_INIT            3
> > +#define NCT_VCOM_SET_CONFIG          4
> > +#define NCT_VCOM_SET_BAUD            5
> > +#define NCT_VCOM_SET_HCR             6
> > +#define NCT_VCOM_SET_OPEN_PORT               7
> > +#define NCT_VCOM_SET_CLOSE_PORT              8
> > +#define NCT_VCOM_SILENT                      9
> > +/* Use bulk-in status instead of interrupt-in status */
> > +#define NCT_VCON_SET_BULK_IN_STATUS  10
> > +
> > +struct nct_vendor_cmd {
> > +     /* bits[3:0]: index, bits[11:4]: cmd, bits[15:12]: reserved */
> > +     __le16 val;
> > +};
>
> Why you need nct_ctrl_msg at all? It looks like you just keep converting
> back forth between host and le16 for no good reason.
>
> Can't you just use host order
>
>         u16 cmd
>
> throughout and pass that to usb_control_msg_recv() in
> nct_vendor_read/write() (and drop conversions in nct_build_cmd(),
> nct_build_ctrl_msg() and nct_vendor_read/write())?
>
> > +
> > +#define NCT_CMD_INDEX_MASK   0x000f
> > +#define NCT_CMD_CMD_MASK     0x0ff0
> > +#define NCT_CMD_CMD_SHIFT    4
> > +
> > +static inline __le16 nct_build_cmd(u8 cmd_code, u8 index)
> > +{
> > +     return cpu_to_le16(((u16)cmd_code << NCT_CMD_CMD_SHIFT) |
> > +                        (index & NCT_CMD_INDEX_MASK));
> > +}
> > +
> > +static inline u8 nct_get_cmd_index(__le16 val)
> > +{
> > +     return le16_to_cpu(val) & NCT_CMD_INDEX_MASK;
> > +}
>
> This one is not used and can be dropped.
>
> > +static inline u8 nct_get_cmd_cmd(__le16 val)
> > +{
> > +     return (le16_to_cpu(val) & NCT_CMD_CMD_MASK) >> NCT_CMD_CMD_SHIFT=
;
> > +}
> > +
> > +#define NCT_HDR_MAGIC                0xa5
> > +#define NCT_HDR_MAGIC2               0x5a
> > +#define NCT_HDR_MAGIC_STATUS 0x5b
> > +
> > +struct nct_packet_header {
> > +     u8 magic;
> > +     u8 magic2;
> > +     __le16 len_and_idx;  /* bits[3:0]: idx, bits[15:4]: len */
> > +} __packed;
> > +
> > +#define NCT_HDR_IDX_MASK     0x000f
> > +#define NCT_HDR_LEN_MASK     0xfff0
> > +#define NCT_HDR_LEN_SHIFT    4
> > +
> > +static inline void nct_set_hdr_idx_len(struct nct_packet_header *hdr,
> > +                                    u8 idx, u16 len)
> > +{
> > +     hdr->len_and_idx =3D cpu_to_le16((len << NCT_HDR_LEN_SHIFT) |
> > +                                    (idx & NCT_HDR_IDX_MASK));
> > +}
> > +
> > +static inline u8 nct_get_hdr_idx(const struct nct_packet_header *hdr)
> > +{
> > +     return le16_to_cpu(hdr->len_and_idx) & NCT_HDR_IDX_MASK;
> > +}
> > +
> > +static inline u16 nct_get_hdr_len(const struct nct_packet_header *hdr)
> > +{
> > +     return (le16_to_cpu(hdr->len_and_idx) & NCT_HDR_LEN_MASK) >>
> > +             NCT_HDR_LEN_SHIFT;
> > +}
> > +
> > +/* The definitions are for the fields of nct_ctrl_msg. */
> > +#define NCT_VCOM_1_STOP_BIT          0
> > +#define NCT_VCOM_2_STOP_BITS         1
> > +#define NCT_VCOM_PARITY_NONE         0
> > +#define NCT_VCOM_PARITY_ODD          1
> > +#define NCT_VCOM_PARITY_EVEN         2
> > +#define NCT_VCOM_DL5                 0
> > +#define NCT_VCOM_DL6                 1
> > +#define NCT_VCOM_DL7                 2
> > +#define NCT_VCOM_DL8                 3
> > +#define NCT_VCOM_DISABLE_FLOW_CTRL   0
> > +#define NCT_VCOM_XOFF                        1
> > +#define NCT_VCOM_RTS_CTS             2
> > +
> > +struct nct_ctrl_msg {
> > +     __le16 val;
> > +};
>
> And similar for nct_ctrl_msg. Why not used host order (u16 msg)
> throughout and only keep the final conversion to LE in
> nct_vendor_write()?
>
> > +#define NCT_CTRL_STOP_BIT_MASK               0x0001
> > +#define NCT_CTRL_PARITY_MASK         0x0006
> > +#define NCT_CTRL_PARITY_SHIFT                1
> > +#define NCT_CTRL_DATA_LEN_MASK               0x0018
> > +#define NCT_CTRL_DATA_LEN_SHIFT              3
> > +#define NCT_CTRL_FLOW_MASK           0x0060
> > +#define NCT_CTRL_FLOW_SHIFT          5
> > +#define NCT_CTRL_SPD_MASK            0x0f80
> > +#define NCT_CTRL_SPD_SHIFT           7
> > +#define NCT_CTRL_RESERVED_MASK               0xf000
> > +#define NCT_CTRL_RESERVED_SHIFT              12
> > +
> > +static inline __le16 nct_build_ctrl_msg(u8 stop_bit, u8 parity, u8 dat=
a_len,
> > +                                     u8 flow, u8 spd)
> > +{
> > +     u16 val =3D 0;
> > +
> > +     val |=3D (stop_bit & NCT_CTRL_STOP_BIT_MASK);
> > +     val |=3D ((parity & (NCT_CTRL_PARITY_MASK >> NCT_CTRL_PARITY_SHIF=
T)) <<
> > +             NCT_CTRL_PARITY_SHIFT);
> > +     val |=3D ((data_len &
> > +              (NCT_CTRL_DATA_LEN_MASK >> NCT_CTRL_DATA_LEN_SHIFT)) <<
> > +             NCT_CTRL_DATA_LEN_SHIFT);
> > +     val |=3D ((flow & (NCT_CTRL_FLOW_MASK >> NCT_CTRL_FLOW_SHIFT)) <<
> > +             NCT_CTRL_FLOW_SHIFT);
> > +     val |=3D ((spd & (NCT_CTRL_SPD_MASK >> NCT_CTRL_SPD_SHIFT)) <<
> > +             NCT_CTRL_SPD_SHIFT);
>
> If you shift the argument before you mask above you can drop the mask
> shift.
>
> > +
> > +     return cpu_to_le16(val);
> > +}
> > +
> > +#define NCT_USR_RDR  0x01
> > +#define NCT_USR_ORR  0x02
> > +#define NCT_USR_PBER 0x04
> > +#define NCT_USR_NSER 0x08
> > +#define NCT_USR_SBD  0x10
> > +#define NCT_USR_TBRE 0x20
> > +#define NCT_USR_TSRE 0x40
> > +#define NCT_USR_RFEI 0x80
> > +#define NCT_HSR_TCTS 0x01
> > +#define NCT_HSR_TDSR 0x02
> > +#define NCT_HSR_FERI 0x04
> > +#define NCT_HSR_TDCD 0x08
> > +#define NCT_HSR_CTS  0x10
> > +#define NCT_HSR_DSR  0x20
> > +#define NCT_HSR_RI   0x40
> > +#define NCT_HSR_DCD  0x80
> > +#define NCT_HCR_DTR  0x01
> > +#define NCT_HCR_RTS  0x02
> > +
> > +#define NCT_UART_STATE_MSR_MASK (NCT_HSR_TCTS | NCT_HSR_TDSR | \
> > +                              NCT_HSR_TDCD | NCT_HSR_DCD)
> > +
> > +struct nct_port_status {
> > +     u8 index;
> > +     u8 usr;
> > +     u8 hsr;
> > +     u8 hcr;
> > +};
> > +
> > +struct nct_serial {
> > +     /* Protects the private data in structure 'nct_serial'. */
>
> As I mentioned before, such comments doesn't really add any value so you
> can drop it.
>
> > +     spinlock_t serial_lock;
> > +     /* Serializes open/close startup-shutdown transactions. */
> > +     struct mutex open_close_mutex;
>
> Just call it 'mutex'. You only have one. Or at least shorten it to
> 'open_mutex'.
>
> > +     unsigned int open_count;
> > +
> > +     /* Reading data information */
> > +     struct nct_tty_port *cur_port;
> > +     int cur_len;
> > +
> > +     bool use_bulk_status;
> > +     u8 en_device_mask;
> > +     u8 last_assigned_hw_idx;
> > +     struct usb_endpoint_descriptor *bulk_out_ep;
> > +     struct usb_serial_port *port_by_hw_idx[NCT_MAX_NUM_COM_DEVICES];
> > +};
> > +
> > +struct nct_tty_port {
> > +     u8 hw_idx;
> > +     u8 usr;
> > +     u8 hsr;
> > +     u8 hcr;
> > +     /*
> > +      * Flow control - stop writing data to device.
> > +      * 0: Write enable, 1: Stop writing
> > +      */
> > +     bool flow_stop_wrt;
> > +
> > +     /* Serializes modem-control transactions sent to the device. */
> > +     struct mutex mctrl_mutex;
> > +     spinlock_t port_lock; /* Protects the port data. */
>
> Please drop the comment, it adds no values.
>
> > +     bool write_urb_in_use;
> > +};
> > +
> > +/* Functions */
> > +
> > +/* Read from USB control pipe */
> > +static int nct_vendor_read(struct usb_interface *intf,
> > +                        struct nct_vendor_cmd cmd, void *buf,
> > +                        int size)
> > +{
> > +     struct usb_device *udev =3D interface_to_usbdev(intf);
> > +     int ret;
> > +
> > +     if (size > NCT_MAX_VENDOR_READ_SIZE)
> > +             return -EINVAL;
> > +
> > +     ret =3D usb_control_msg_recv(udev, 0,
> > +                                NCT_VENDOR_COM_READ_REQUEST,
> > +                                NCT_VENDOR_COM_READ_REQUEST_TYPE,
> > +                                le16_to_cpu(cmd.val),
> > +                                intf->cur_altsetting->desc.bInterfaceN=
umber,
> > +                                buf, size, 100, GFP_KERNEL);
> > +
> > +     return ret;
> > +}
> > +
> > +static int nct_vendor_write(struct usb_interface *intf,
> > +                         struct nct_vendor_cmd cmd, u16 val)
> > +{
> > +     struct device *dev =3D &intf->dev;
> > +     struct usb_device *udev =3D interface_to_usbdev(intf);
> > +     __le16 le_val =3D cpu_to_le16(val);
> > +     int ret;
> > +
> > +     ret =3D usb_control_msg_send(udev, 0,
> > +                                NCT_VENDOR_COM_WRITE_REQUEST,
> > +                                NCT_VENDOR_COM_WRITE_REQUEST_TYPE,
> > +                                le16_to_cpu(cmd.val),
> > +                                intf->cur_altsetting->desc.bInterfaceN=
umber,
> > +                                &le_val, sizeof(le_val), 100, GFP_KERN=
EL);
> > +     if (ret)
> > +             dev_err(dev, "failed to write [%04x]: %d\n",
> > +                     nct_get_cmd_cmd(cmd.val), ret);
> > +
> > +     return ret;
> > +}
> > +
> > +/*
> > + * Prepare write buffer by extracting data from core write FIFO and
> > + * adding header
> > + */
> > +static int nct_prepare_write_buffer(struct usb_serial_port *port,
> > +                                 void *dest, size_t size)
> > +{
> > +     unsigned int count;
> > +     struct nct_packet_header hdr;
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
>
> Nit: Please consider reording these reverse christmas tree style, which
> tends to be easier to read (i.e. put the longest lines first).
>
> > +
> > +     if (size <=3D sizeof(hdr))
> > +             return 0;
>
> The buffer will at least be as large as the endpoint max packet size so
> this is not needed unless something is really broken.
>
> You can specify explicit buffer sizes in the driver structure to avoid
> this check:
>
>         .bulk_in_size
>         .bulk_out_size
>
> and the buffer can be larger than the endpoint (if the device can handle
> it).
>
> If that's not enough, you can add sanity checks to probe.
>
> > +
> > +     /* Leave room for header */
> > +     count =3D kfifo_out_locked(&port->write_fifo, dest + sizeof(hdr),
> > +                              size - sizeof(hdr), &port->lock);
> > +
> > +     if (!count)
> > +             return 0;
>
> Core has already made sure there is data in the fifo.
>
> > +
> > +     hdr.magic =3D NCT_HDR_MAGIC;
> > +     hdr.magic2 =3D NCT_HDR_MAGIC2;
> > +     nct_set_hdr_idx_len(&hdr, tport->hw_idx, count);
> > +
> > +     /*
> > +      * Copy header into buffer (use memcpy to avoid aliasing/unaligne=
d
> > +      * access).
> > +      */
> > +     memcpy(dest, &hdr, sizeof(hdr));
>
> And the buffer alignment is at least 8-byte aligned
> (ARCH_KMALLOC_MINALIGN) so this is not needed either.
>
> > +
> > +     return count + sizeof(hdr);
> > +}
> > +
> > +static u16 nct_set_baud(struct usb_interface *intf, u16 index,
> > +                     unsigned int cflag, bool *found)
> > +{
> > +     struct nct_vendor_cmd cmd;
> > +     struct nct_ctrl_msg msg;
> > +     u16 i;
> > +     u8 spd =3D NCT_DEFAULT_BAUD;
> > +
> > +     *found =3D false;
> > +     cmd.val =3D nct_build_cmd(NCT_VCOM_SET_BAUD, index);
> > +     for (i =3D 0; i < ARRAY_SIZE(NCT_BAUD_SUP); i++) {
> > +             if ((cflag & CBAUD) !=3D NCT_BAUD_SUP[i])
> > +                     continue;
> > +
> > +             spd =3D i;
> > +             /*
> > +              * Create control message
> > +              * Note: The NCT_VCOM_SET_BAUD only set the baud rate
> > +              */
> > +             msg.val =3D nct_build_ctrl_msg(0, 0, 0, 0, spd);
> > +             if (nct_vendor_write(intf, cmd, le16_to_cpu(msg.val)))
> > +                     dev_err(&intf->dev, "set index %d speed error\n",
> > +                             index);
>
> Please add brackets for readability wherever you have multi-line
> statements (as I mentioned before).
>
> In this case you could also just drop the line break as the resulting
> line is short enough.
>
> > +             else
> > +                     *found =3D true;
> > +
> > +             break;
> > +     }
> > +
> > +     return spd;
> > +}
> > +
> > +static void nct_set_termios(struct tty_struct *tty,
> > +                         struct usb_serial_port *port,
> > +                         const struct ktermios *old)
> > +{
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +     struct usb_serial *serial =3D port->serial;
> > +     struct usb_interface *intf =3D serial->interface;
> > +     struct ktermios *termios =3D &tty->termios;
> > +     struct nct_ctrl_msg msg;
> > +     struct nct_vendor_cmd cmd;
> > +     u8 stop_bit;
> > +     u8 parity;
> > +     u8 data_len;
> > +     u8 flow;
> > +     bool baud_found =3D false;
> > +     speed_t old_baud;
> > +
> > +     /* Device does not support CMSPAR. */
> > +     termios->c_cflag &=3D ~CMSPAR;
> > +
> > +     cmd.val =3D nct_build_cmd(NCT_VCOM_SET_CONFIG, tport->hw_idx);
> > +
> > +     /* Set stop bit */
> > +     if (C_CSTOPB(tty))
> > +             stop_bit =3D NCT_VCOM_2_STOP_BITS;
> > +     else
> > +             stop_bit =3D NCT_VCOM_1_STOP_BIT;
> > +
> > +     /* Set parity */
> > +     if (C_PARENB(tty)) {
> > +             if (C_PARODD(tty))
> > +                     parity =3D NCT_VCOM_PARITY_ODD;
> > +             else
> > +                     parity =3D NCT_VCOM_PARITY_EVEN;
> > +     } else {
> > +             parity =3D NCT_VCOM_PARITY_NONE;
> > +     }
>
> As I mentioned before you need to clear CMSPAR in the termios if you
> don't support sticky parity.
>
> > +
> > +     /* Set data bit length */
> > +     switch (C_CSIZE(tty)) {
> > +     case CS5:
> > +             data_len =3D NCT_VCOM_DL5;
> > +             break;
> > +     case CS6:
> > +             data_len =3D NCT_VCOM_DL6;
> > +             break;
> > +     case CS7:
> > +             data_len =3D NCT_VCOM_DL7;
> > +             break;
> > +     case CS8:
> > +     default:
> > +             data_len =3D NCT_VCOM_DL8;
> > +             break;
> > +     }
> > +
> > +     /* Set flow control */
> > +     if (C_CRTSCTS(tty))
> > +             flow =3D NCT_VCOM_RTS_CTS;
> > +     else if (I_IXON(tty))
> > +             flow =3D NCT_VCOM_XOFF;
> > +     else
> > +             flow =3D NCT_VCOM_DISABLE_FLOW_CTRL;
> > +
> > +     tty_port_set_cts_flow(tty->port, C_CRTSCTS(tty));
>
> I don't think you need to set this flag as the device appears to support
> automatic hardware flow control (NCT_VCOM_RTS_CTS). More below.
>
> > +     /* Create control message (spd=3D0: speed set separately via SET_=
BAUD) */
> > +     msg.val =3D nct_build_ctrl_msg(stop_bit, parity, data_len, flow, =
0);
> > +     nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
> > +
> > +     /*
> > +      * Set baud rate if speed changed.
> > +      * Always call tty_encode_baud_rate() to keep kernel's baud rate
> > +      * synchronized with the device, especially during initial open
> > +      * when the device uses its default baud rate.
> > +      */
> > +     if (!old || old->c_ospeed !=3D termios->c_ospeed)
> > +             nct_set_baud(intf, tport->hw_idx, termios->c_cflag, &baud=
_found);
> > +
> > +     if (baud_found) {
> > +             tty_encode_baud_rate(tty, tty_get_baud_rate(tty),
> > +                                  tty_get_baud_rate(tty));
> > +     } else {
> > +             if (old && tty_termios_baud_rate(old))
> > +                     old_baud =3D tty_termios_baud_rate(old);
> > +             else
> > +                     old_baud =3D 115200; /* Sync with device default =
*/
> > +
> > +             tty_encode_baud_rate(tty, old_baud, old_baud);
> > +     }
> > +}
> > +
> > +static int nct_break(struct tty_struct *tty, int break_state)
> > +{
> > +     struct usb_serial_port *port =3D tty->driver_data;
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +     struct usb_serial *serial =3D port->serial;
> > +     struct usb_interface *intf =3D serial->interface;
> > +     struct nct_vendor_cmd cmd;
> > +
> > +     cmd.val =3D nct_build_cmd(NCT_VCOM_SILENT, tport->hw_idx);
> > +
> > +     return nct_vendor_write(intf, cmd, 0);
> > +}
> > +
> > +static int nct_tiocmset_helper(struct tty_struct *tty, unsigned int se=
t,
> > +                            unsigned int clear)
>
> Drop the "_helper" suffix.
>
> > +{
> > +     struct usb_serial_port *port =3D tty->driver_data;
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +     struct usb_serial *serial =3D port->serial;
> > +     struct usb_interface *intf =3D serial->interface;
> > +     struct nct_ctrl_msg msg;
> > +     struct nct_vendor_cmd cmd;
> > +     u8 hcr;
> > +     int ret;
> > +
> > +     mutex_lock(&tport->mctrl_mutex);
> > +
> > +     /*
> > +      * port_lock serializes updates of the cached modem-control bits =
(hcr).
> > +      * The control transfer may sleep, so only the hcr read-modify-wr=
ite is
> > +      * done under the spinlock.
> > +      */
> > +     spin_lock_irq(&tport->port_lock);
> > +     hcr =3D tport->hcr;
> > +
> > +     if (set & TIOCM_RTS)
> > +             hcr |=3D NCT_HCR_RTS;
> > +     if (set & TIOCM_DTR)
> > +             hcr |=3D NCT_HCR_DTR;
> > +     if (clear & TIOCM_RTS)
> > +             hcr &=3D ~NCT_HCR_RTS;
> > +     if (clear & TIOCM_DTR)
> > +             hcr &=3D ~NCT_HCR_DTR;
> > +
> > +     tport->hcr =3D hcr;
> > +     spin_unlock_irq(&tport->port_lock);
> > +
> > +     cmd.val =3D nct_build_cmd(NCT_VCOM_SET_HCR, tport->hw_idx);
> > +     msg.val =3D cpu_to_le16(hcr);
> > +     ret =3D nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
> > +     mutex_unlock(&tport->mctrl_mutex);
> > +
> > +     return ret;
> > +}
> > +
> > +static int nct_tiocmget(struct tty_struct *tty)
> > +{
> > +     struct usb_serial_port *port =3D tty->driver_data;
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +     unsigned int res;
> > +     u8 hcr, hsr;
> > +
> > +     spin_lock_irq(&tport->port_lock);
> > +     hcr =3D tport->hcr;
> > +     hsr =3D tport->hsr;
> > +     spin_unlock_irq(&tport->port_lock);
> > +     res =3D ((hcr & NCT_HCR_DTR) ? TIOCM_DTR : 0) |
> > +           ((hcr & NCT_HCR_RTS) ? TIOCM_RTS : 0) |
> > +           ((hsr & NCT_HSR_CTS) ? TIOCM_CTS : 0) |
> > +           ((hsr & NCT_HSR_DSR) ? TIOCM_DSR : 0) |
> > +           ((hsr & NCT_HSR_RI) ? TIOCM_RI : 0) |
> > +           ((hsr & NCT_HSR_DCD) ? TIOCM_CD : 0);
> > +
> > +     return res;
> > +}
> > +
> > +static void nct_rx_throttle(struct tty_struct *tty)
> > +{
> > +     /* Handle RTS line for RTS/CTS flow control */
> > +     if (C_CRTSCTS(tty))
> > +             nct_tiocmset_helper(tty, 0, TIOCM_RTS);
> > +}
>
> You never replied to my previous comments here:
>
>         First, can you even control RTS when the device is in hardware
>         flow control mode?
>
>         Second, I think you're supposed to just stop reading from the
>         device here to exert back pressure so that it in turn deasserts
>         RTS.
>
> But perhaps the latter does not work here as the bulk-in endpoint is
> shared.
>
> > +static void nct_rx_unthrottle(struct tty_struct *tty)
> > +{
> > +     /* Handle RTS line for RTS/CTS flow control */
> > +     if (C_CRTSCTS(tty))
> > +             nct_tiocmset_helper(tty, TIOCM_RTS, 0);
> > +}
> > +
> > +static int nct_serial_write(struct tty_struct *tty,
> > +                         struct usb_serial_port *port,
> > +                         const unsigned char *buf,
> > +                         int count)
> > +{
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +     unsigned int written;
> > +     int ret;
> > +
> > +     /* Flow control */
> > +     if (tty_port_cts_enabled(tty->port))
> > +             if (tport->flow_stop_wrt)
> > +                     return 0;
>
> Similarly here, you should be able to rely on the device to deassert RTS
> when its buffers fill up, right?
>
> I apparently already asked you this in a comment to v4.
>
> Please make sure to address and/or respond to all comments before
> sending another version.
>
> > +
> > +     if (!port)
> > +             return -ENXIO;
>
> How could port be NULL here?
>
> > +
> > +     /* Copy into core write FIFO */
> > +     written =3D kfifo_in_locked(&port->write_fifo, buf, count, &port-=
>lock);
> > +
>
> Nit: drop the newline
>
> > +     if (written) {
> > +             ret =3D usb_serial_generic_write_start(port, GFP_ATOMIC);
> > +             if (ret && ret !=3D -EBUSY)
> > +                     dev_err(&port->dev,
> > +                             "usb_serial_generic_write_start failed: %=
d\n",
> > +                             ret);
> > +     }
> > +
> > +     return written;
> > +}
>
> Without the flow control bits you should be able to use the generic
> write implementation directly here (or possibly call it after checking).
>
> > +
> > +static unsigned int nct_write_room(struct tty_struct *tty)
> > +{
> > +     struct usb_serial_port *port =3D tty->driver_data;
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +     unsigned long flags;
> > +     unsigned int room;
> > +
> > +     spin_lock_irqsave(&tport->port_lock, flags);
> > +     room =3D kfifo_avail(&port->write_fifo);
> > +     spin_unlock_irqrestore(&tport->port_lock, flags);
> > +     return room;
> > +}
>
> Just use the generic implementation.
>
> > +static unsigned int nct_chars_in_buffer(struct tty_struct *tty)
> > +{
> > +     struct usb_serial_port *port =3D tty->driver_data;
> > +     unsigned int qlen;
> > +
> > +     /* Get queued bytes in core write FIFO */
> > +     qlen =3D kfifo_len(&port->write_fifo);
> > +     return qlen;
> > +}
>
> Here too.
>
> > +/*
> > + *  Starts reads urb on all ports. It is to avoid potential issues cau=
sed by
> > + *  multiple ports being opened almost simultaneously.
> > + *  It must be called AFTER startup, with urbs initialized.
> > + *  Returns 0 if successful, non-zero error otherwise.
> > + */
> > +static int nct_startup_device(struct usb_serial *serial)
> > +{
> > +     int ret =3D 0;
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     struct usb_serial_port *port;
> > +     unsigned long flags;
> > +     bool first_open =3D false;
> > +
> > +     /* Caller must hold serial_priv->open_close_mutex. */
>
> You can use lockdep_assert_held() to document this.
>
> > +
> > +     /* Start URBs on first open */
> > +     spin_lock_irqsave(&serial_priv->serial_lock, flags);
> > +     if (serial_priv->open_count++ =3D=3D 0)
> > +             first_open =3D true;
> > +     spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
>
> Why do you take the serial_lock spinlock for this when you already hold
> the open mutex?
>
> > +     /* Only the first open submits read_urb and, if needed, interrupt=
_in_urb. */
> > +     if (!first_open)
> > +             goto out_return;
>
> Just return directly (and skip ret initialisation above).
>
> > +
> > +     /* Start reading from bulk in endpoint */
> > +     port =3D serial->port[0];
> > +     ret =3D usb_submit_urb(port->read_urb, GFP_KERNEL);
> > +     if (ret) {
> > +             dev_err(&port->dev, "failed to submit read urb: %d\n", re=
t);
> > +             goto err_rollback;
> > +     }
>
> Why not use both URBs which is more efficient (i.e.
> usb_serial_generic_submit_read_urbs())?
>
> > +
> > +     /* For getting status from interrupt-in */
> > +     if (!serial_priv->use_bulk_status) {
> > +             /* Start reading from interrupt pipe */
> > +             port =3D serial->port[0];
> > +             ret =3D usb_submit_urb(port->interrupt_in_urb, GFP_KERNEL=
);
> > +             if (ret) {
> > +                     dev_err(&port->dev,
> > +                             "failed to submit interrupt urb: %d\n",
> > +                             ret);
> > +                     goto err_kill_read;
> > +             }
> > +     }
> > +
> > +     ret =3D 0;
> > +     goto out_return;
>
> Just return explicit zero here.
>
> > +
> > +err_kill_read:
> > +     usb_kill_urb(serial->port[0]->read_urb);
> > +err_rollback:
> > +     spin_lock_irqsave(&serial_priv->serial_lock, flags);
> > +     if (serial_priv->open_count)
> > +             serial_priv->open_count--;
> > +     if (!serial_priv->open_count) {
> > +             serial_priv->cur_port =3D NULL;
> > +             serial_priv->cur_len =3D 0;
> > +     }
> > +     spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> > +
> > +out_return:
> > +     return ret;
> > +}
> > +
> > +static void nct_shutdown_device(struct usb_serial *serial)
> > +{
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     unsigned long flags;
> > +     bool last_close =3D false;
> > +
> > +     /* Caller must hold serial_priv->open_close_mutex. */
> > +
> > +     spin_lock_irqsave(&serial_priv->serial_lock, flags);
> > +     if (serial_priv->open_count) {
> > +             serial_priv->open_count--;
> > +             if (!serial_priv->open_count) {
> > +                     last_close =3D true;
> > +                     serial_priv->cur_port =3D NULL;
> > +                     serial_priv->cur_len =3D 0;
> > +             }
> > +     }
> > +     spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> > +
> > +     if (!last_close)
> > +             return;
> > +
> > +     usb_kill_urb(serial->port[0]->read_urb);
> > +     if (!serial_priv->use_bulk_status)
> > +             usb_kill_urb(serial->port[0]->interrupt_in_urb);
> > +}
> > +
> > +static int nct_open(struct tty_struct *tty, struct usb_serial_port *po=
rt)
> > +{
> > +     struct nct_vendor_cmd cmd;
> > +     struct nct_ctrl_msg msg;
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +     struct usb_serial *serial =3D port->serial;
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     struct usb_interface *intf =3D serial->interface;
> > +     int ret;
> > +
> > +     if (!port->serial)
> > +             return -ENXIO;
>
> How could this happen?
>
> > +     mutex_lock(&serial_priv->open_close_mutex);
> > +
> > +     /* Be sure the device is started up */
> > +     ret =3D nct_startup_device(port->serial);
> > +     if (ret)
> > +             goto out_unlock;
> > +
> > +     cmd.val =3D nct_build_cmd(NCT_VCOM_SET_OPEN_PORT, tport->hw_idx);
> > +     msg.val =3D cpu_to_le16(0);
> > +     ret =3D nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
> > +     if (ret) {
> > +             dev_err(&port->dev, "Failed to open port: %d\n", ret);
> > +             nct_shutdown_device(serial);
> > +             goto out_unlock;
>
> Nit: I prefer "err_unlock" to make it clear that this path is only used
> on errors.
>
> > +     }
> > +
> > +     mutex_unlock(&serial_priv->open_close_mutex);
> > +
> > +     wake_up_interruptible(&port->port.open_wait);
>
> This one should only be called on carrier detect changes.
>
> > +
> > +     /*
> > +      * Delay 1ms for firmware to configure hardware after opening the=
 port.
> > +      * (Especially at high speed)
> > +      */
> > +     usleep_range(1000, 2000);
>
> Nit: add a newline here.
>
> > +     return 0;
> > +
> > +out_unlock:
> > +     mutex_unlock(&serial_priv->open_close_mutex);
>
> Nit: and here.
>
> > +     return ret;
> > +}
> > +
> > +static void nct_close(struct usb_serial_port *port)
> > +{
> > +     struct nct_tty_port *tport =3D usb_get_serial_port_data(port);
> > +     struct usb_serial *serial =3D port->serial;
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     struct usb_interface *intf =3D serial->interface;
> > +     struct nct_ctrl_msg msg;
> > +     struct nct_vendor_cmd cmd;
> > +
> > +     mutex_lock(&port->serial->disc_mutex);
> > +     mutex_lock(&serial_priv->open_close_mutex);
> > +     /* If disconnected, don't send the close-command to the firmware =
*/
> > +     if (port->serial->disconnected)
> > +             goto exit;
>
> Nit: "out_unlock" is more descriptive.
>
> > +
> > +     /* Send 'Close Port' to the device */
> > +     cmd.val =3D nct_build_cmd(NCT_VCOM_SET_CLOSE_PORT, tport->hw_idx)=
;
> > +     msg.val =3D cpu_to_le16(0);
> > +     nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
> > +
> > +exit:
> > +     nct_shutdown_device(port->serial);
> > +     mutex_unlock(&serial_priv->open_close_mutex);
> > +     mutex_unlock(&port->serial->disc_mutex);
> > +}
> > +
> > +static void nct_update_status(struct usb_serial *serial, unsigned char=
 *data)
> > +{
> > +     struct nct_port_status *nps =3D (struct nct_port_status *)data;
> > +     struct usb_interface *intf =3D serial->interface;
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     struct nct_tty_port *tport;
> > +     struct tty_struct *tty;
> > +     struct usb_serial_port *port;
> > +     unsigned long flags;
> > +
> > +     if (nps->index >=3D NCT_MAX_NUM_COM_DEVICES) {
> > +             if (nps->index !=3D NCT_EMPTY_PORT) /* Un-used port */
> > +                     dev_warn(&intf->dev, "receive wrong H/W index\n")=
;
> > +             return;
> > +     }
> > +     if (!(nps->hsr & (NCT_UART_STATE_MSR_MASK | NCT_HSR_CTS)))
> > +             return; /* No state changes */
> > +
> > +     port =3D serial_priv->port_by_hw_idx[nps->index];
> > +     if (!port)
> > +             return;
> > +
> > +     tport =3D usb_get_serial_port_data(port);
> > +     if (!tport)
> > +             return;
> > +
> > +     spin_lock_irqsave(&tport->port_lock, flags);
> > +     tport->usr =3D nps->usr;
> > +     tport->hsr =3D nps->hsr;
> > +     tport->hcr =3D nps->hcr;
> > +     spin_unlock_irqrestore(&tport->port_lock, flags);
> > +
> > +     if (serial->disconnected) {
> > +             dev_err(&intf->dev,
> > +                     "device disconnected, skip status update\n");
> > +             return;
> > +     }
> > +
> > +     tty =3D tty_port_tty_get(&port->port);
> > +     if (!tty)
> > +             return; /* The port has been closed. */
> > +
> > +     if (nps->hsr & NCT_UART_STATE_MSR_MASK) {
> > +             if (nps->hsr & NCT_HSR_DCD) {
> > +                     struct tty_ldisc *ld =3D tty_ldisc_ref(tty);
> > +
> > +                     if (ld) {
> > +                             if (ld->ops->dcd_change)
> > +                                     ld->ops->dcd_change(tty, 0x01);
> > +                             tty_ldisc_deref(ld);
> > +                     }
> > +                     wake_up_interruptible(&tty->port->open_wait);
> > +             }
>
> Can't you use usb_serial_handle_dcd_change() here?
>
> > +     }
> > +
> > +     /* Flow control */
> > +     if (tty_port_cts_enabled(&port->port)) {
> > +             if ((nps->hsr & NCT_HSR_CTS)) {
> > +                     if (tport->flow_stop_wrt)
> > +                             tport->flow_stop_wrt =3D false;
> > +             } else {
> > +                     tport->flow_stop_wrt =3D true;
> > +             }
> > +     }
>
> So this may be needed either if the device stops transmitting when CTS
> is deasserted.
>
> > +
> > +     tty_kref_put(tty);
> > +}
> > +
> > +/*
> > + * nct_usb_serial_read - process incoming bulk-in data.
> > + *
> > + * The device multiplexes all UART ports over a single bulk-in endpoin=
t.
> > + * Each data segment is prefixed with a 4-byte header:
> > + *
> > + *   byte 0: magic (0xa5)
> > + *   byte 1: magic2
> > + *           0x5a =3D data packet
> > + *           0x5b =3D status packet
> > + *   bytes 2-3: length and index (little-endian 16-bit)
> > + *           bits [3:0]  =3D port index (1-based, valid range 1-7; 0 i=
s reserved)
> > + *           bits [15:4] =3D payload length in bytes
> > + *
> > + * Multiple packets for different ports may be concatenated within a
> > + * single URB. The driver allows a packet's payload to span across URB
> > + * boundaries. In that case, the driver records the remaining length (=
cur_len)
> > + * and target port (cur_port) to reassemble the data on subsequent URB=
s.
> > + *
> > + * Status packets (magic2 =3D 0x5b) carry an array of 4-byte per-port
> > + * status structures instead of UART data:
> > + *
> > + *   byte 0: port index (1-based; 0 =3D reserved, 0xff =3D unused entr=
y)
> > + *   byte 1: UART status (USR)
> > + *           bit0: RX data ready
> > + *           bit1: overrun error
> > + *           bit2: parity error
> > + *           bit3: framing error
> > + *           bit4: break detected
> > + *           bit5: TX buffer empty
> > + *           bit6: TX shift register empty
> > + *           bit7: RX FIFO error
> > + *   byte 2: modem status (MSR)
> > + *           bit0: CTS change
> > + *           bit1: DSR change
> > + *           bit2: RI change
> > + *           bit3: DCD change
> > + *           bit4: CTS level
> > + *           bit5: DSR level
> > + *           bit6: RI level
> > + *           bit7: DCD level
> > + *   byte 3: modem control (MCR)
> > + *           bit0: DTR level
> > + *           bit1: RTS level
> > + */
>
> Thanks for adding this.
>
> > +static void nct_usb_serial_read(struct urb *urb)
> > +{
> > +     struct usb_serial_port *port =3D urb->context;
> > +     struct usb_serial *serial =3D port->serial;
> > +     struct usb_interface *intf =3D serial->interface;
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     struct nct_tty_port *tport;
> > +     struct nct_packet_header *hdr =3D NULL;
> > +     unsigned char *data =3D urb->transfer_buffer;
> > +     int i, j;
> > +     int actual_len =3D urb->actual_length;
> > +     int len =3D 0;
> > +     u8 hdr_idx;
> > +     struct nct_port_status *nps;
> > +     unsigned long flags;
> > +
> > +     if (!urb->actual_length)
> > +             return;
> > +
> > +again:
> > +     spin_lock_irqsave(&serial_priv->serial_lock, flags);
> > +     tport =3D serial_priv->cur_port;
> > +     if (!tport) {
> > +             /*
> > +              * Handle a new data packet (i.e., it is not
> > +              * the remaining data without a header).
> > +              * The packet does not need reassembly at this point.
> > +              */
> > +             for (i =3D 0; i < urb->actual_length; i++) {
> > +                     if (i + sizeof(struct nct_packet_header) >
> > +                         urb->actual_length) {
> > +                             /* Not enough data for a header */
> > +                             spin_unlock_irqrestore(&serial_priv->seri=
al_lock,
> > +                                                    flags);
> > +                             return;
> > +                     }
> > +
> > +                     hdr =3D (struct nct_packet_header *)data;
> > +                     /* Decode the header */
> > +
> > +                     /*
> > +                      * Status data is also transmitted via bulk-in
> > +                      * pipe.
> > +                      * Current FW reports a fixed 24-byte status payl=
oad.
> > +                      */
> > +                     if (serial_priv->use_bulk_status &&
> > +                         hdr->magic =3D=3D NCT_HDR_MAGIC &&
> > +                         hdr->magic2 =3D=3D NCT_HDR_MAGIC_STATUS &&
> > +                         nct_get_hdr_len(hdr) =3D=3D 24 &&
> > +                         actual_len >=3D 28) {
> > +                             /*
> > +                              * Notice: actual_len will be decreased,
> > +                              * it is equal to urb->actual_length
> > +                              * only at the beginning.
> > +                              */
> > +
> > +                             /*
> > +                              * Status report.
> > +                              * It should be a standalone package in
> > +                              * one URB.
> > +                              */
> > +                             data +=3D sizeof(struct nct_packet_header=
);
> > +                             actual_len -=3D sizeof(struct nct_packet_=
header);
> > +
> > +                             nps =3D (struct nct_port_status *)data;
> > +                             if ((actual_len % sizeof(*nps)) !=3D 0) {
> > +                                     dev_err(&intf->dev,
> > +                                             "bad status len: %d\n",
> > +                                             actual_len);
> > +                                     spin_unlock_irqrestore(
> > +                                             &serial_priv->serial_lock=
,
> > +                                             flags);
> > +                                     return;
> > +                             }
> > +
> > +                             for (j =3D 0; j < (actual_len / sizeof(*n=
ps));
> > +                                  j++) {
> > +                                     nct_update_status(serial,
> > +                                                       (unsigned char =
*)nps);
>
> Why do you cast to unsigned char * only to cast back in
> nct_update_status() again?
>
> > +                                     nps++;
> > +                             }
>
> Looks like you fixed the bug I pointed out here (but it's not mentioned
> in the change log) and tried to limit the line lengths by adding line
> breaks (which doesn't necessarily improve readability), but the
> indentation is still six levels.
>
> Did you try to look into adding helper functions to break the parsing up
> and make it more readable?
>
> > +
> > +                             spin_unlock_irqrestore(&serial_priv->seri=
al_lock,
> > +                                                    flags);
> > +                             return;
> > +                     }
> > +
> > +                     hdr_idx =3D nct_get_hdr_idx(hdr);
> > +                     if (hdr->magic =3D=3D NCT_HDR_MAGIC &&
> > +                         hdr->magic2 =3D=3D NCT_HDR_MAGIC2 &&
> > +                         hdr_idx > 0 &&
> > +                         hdr_idx < NCT_MAX_NUM_COM_DEVICES &&
> > +                         nct_get_hdr_len(hdr) <=3D 512)
> > +                             break;
> > +
> > +                     data++;
> > +                     actual_len--;
> > +                     if (!actual_len) {
> > +                             dev_err(&intf->dev,
> > +                                     "decode serial packet size failed=
\n");
> > +                             spin_unlock_irqrestore(&serial_priv->seri=
al_lock,
> > +                                                    flags);
> > +                             return;
> > +                     }
> > +             }
> > +             /*
> > +              * Resolve TTY port by the idx in header and ensure it is=
 valid.
> > +              * Record it for two purposes:
> > +              *   (1) If the current packet payload is incomplete, the=
 next URB
> > +              *       continues payload bytes without a new header.
> > +              *   (2) Route received bytes to the correct TTY port.
> > +              */
> > +             port =3D serial_priv->port_by_hw_idx[nct_get_hdr_idx(hdr)=
];
> > +             if (!port) {
> > +                     dev_err(&intf->dev,
> > +                             "decode serial packet index failed\n");
> > +                     spin_unlock_irqrestore(&serial_priv->serial_lock,=
 flags);
> > +                     return;
> > +             }
> > +
> > +             tport =3D usb_get_serial_port_data(port);
> > +             if (!tport) {
> > +                     spin_unlock_irqrestore(&serial_priv->serial_lock,=
 flags);
> > +                     return;
> > +             }
> > +             /*
> > +              * Calculate the data length.
> > +              * Then, check if the length specified in the header matc=
hes
> > +              * the data length. If not, it indicates that the data we
> > +              * received spans across two (or more) packets.
> > +              */
> > +             actual_len -=3D sizeof(struct nct_packet_header);
> > +             data +=3D sizeof(struct nct_packet_header);
> > +             /* actual_len: the data length of the data we got this ti=
me */
> > +             if (nct_get_hdr_len(hdr) > actual_len) {
> > +                     /*
> > +                      * It means the length specified in the header (t=
he
> > +                      * custom header) is greater than the length of t=
he
> > +                      * data we received.
> > +                      * Therefore, the data received this time belongs=
 to a
> > +                      * single packet payload segment (i.e. no next he=
ader in this URB).
> > +                      */
> > +                     len =3D actual_len;
> > +                     /*
> > +                      * cur_len: Record how many data does not handle =
yet
> > +                      */
> > +                     serial_priv->cur_len =3D nct_get_hdr_len(hdr) - l=
en;
> > +                     /*
> > +                      * Record the current port. When we receive the
> > +                      * remaining data for this packet next time
> > +                      */
> > +                     serial_priv->cur_port =3D tport;
> > +             } else {
> > +                     /*
> > +                      * The received data crosses packet boundaries (d=
oes not belong
> > +                      * to the same header). We only handle data by
> > +                      * the length in header. And we will handle
> > +                      * another packet when 'goto "again" '.
> > +                      */
> > +                     len =3D nct_get_hdr_len(hdr);
> > +             }
> > +     } else { /* Handling remaining data that crosses packet boundarie=
s */
> > +             if (serial_priv->cur_len > actual_len) {
> > +                     /*
> > +                      * The unhandled part of the data exceeds the dat=
a we
> > +                      * received this time. We only handle the data we
> > +                      * have, expecting more data to be received later=
.
> > +                      */
> > +                     len =3D actual_len;
> > +             } else {
> > +                     /*
> > +                      * This means the packet has been fully handled.
> > +                      * Clear 'cur_port' as no additional data needs t=
o be
> > +                      * attached to the current packet.
> > +                      */
> > +                     len =3D serial_priv->cur_len;
> > +                     serial_priv->cur_port =3D NULL;
> > +             }
> > +             serial_priv->cur_len -=3D len;
> > +     }
> > +     spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> > +     tty_insert_flip_string(&port->port, data, len);
> > +     data +=3D len;
> > +     /*
> > +      * Send data to the tty device (according to the port identified =
above).
> > +      */
> > +     tty_flip_buffer_push(&port->port);
> > +     actual_len -=3D len;
> > +
> > +     /*
> > +      * It means that the data we received this time contains two or
> > +      * more data packets, so it needs to continue processing the next
> > +      * data packets.
> > +      */
> > +     if (actual_len > 0)
> > +             goto again;
> > +}
> > +
> > +static void nct_process_read_bulk(struct urb *urb)
> > +{
> > +     struct usb_serial_port *port =3D  urb->context;
>
> nit:                                   ^ double space
>
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(port->seri=
al);
> > +     bool stopped =3D false;
> > +     int status =3D urb->status;
> > +     int ret;
> > +
> > +     switch (status) {
> > +     case 0:
> > +             nct_usb_serial_read(urb);
> > +             break;
> > +     case -ENOENT:
> > +     case -ECONNRESET:
> > +     case -ESHUTDOWN:
> > +             if (!(status =3D=3D -ENOENT
> > +                   && serial_priv
>
> serial_priv is not NULL here
>
> > +                   && serial_priv->open_count
> > +                   && !port->serial->disconnected)) {
> > +                     dev_dbg(&port->dev, "urb halted, status=3D%d\n", =
status);
> > +                     stopped =3D true;
>
> Why did you add this? It should not be needed.
>
> > +             }
> > +             break;
> > +     case -EPIPE:
> > +             dev_err(&port->dev, "urb stalled (EPIPE)\n");
> > +             stopped =3D true;
> > +             break;
> > +     default:
> > +             dev_dbg(&port->dev, "nonzero urb status: %d\n", status);
> > +             break;
> > +     }
> > +
> > +     if (stopped)
> > +             return;
> > +
> > +     ret =3D usb_submit_urb(urb, GFP_ATOMIC);
> > +     if (ret !=3D 0 && ret !=3D -EPERM)
> > +             dev_err(&port->dev,
> > +                     "failed resubmitting urb, ret=3D%d\n",
> > +                     ret);
>
> Again, please use bracket around all blocks with multi-line statements
> (throughout).
>
> And please use the following format consistently for errors
>
>         "failed to ...: %d\n", ret
>
> (i.e. ": " instead of ", ret=3D").
>
> > +}
> > +
> > +static void nct_read_bulk_callback(struct urb *urb)
> > +{
> > +     struct usb_serial_port *port =3D urb->context;
> > +
> > +     /* Do not resubmit if the urb is being killed */
> > +     if (urb->status =3D=3D -ESHUTDOWN)
> > +             return;
>
> Why check -ESHUTDOWN twice?
>
> I apparently already pointed this out.
>
> > +
> > +     if (!port || !port->serial)
> > +             return;
>
> Neither will be NULL.
>
> I already said this.
>
> Please don't ignore feedback, no one likes repeating themselves (and
> especially not kernel maintainers).
>
> > +
> > +     if (port->serial->disconnected)
> > +             return;
>
> This should not be needed either.
>
> > +
> > +     /* Processing data */
> > +     nct_process_read_bulk(urb);
> > +}
> > +
> > +static int nct_calc_num_ports(struct usb_serial *serial,
> > +                           struct usb_serial_endpoints *epds)
> > +{
> > +     struct nct_vendor_cmd cmd;
> > +     u8 buf[8];
>
> Move these after the following struct declarations.
>
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     struct usb_interface *intf =3D serial->interface;
> > +     struct usb_host_interface *iface_desc =3D intf->cur_altsetting;
> > +     struct usb_endpoint_descriptor *bulk_in =3D NULL;
> > +     struct usb_endpoint_descriptor *bulk_out =3D NULL;
> > +     struct usb_endpoint_descriptor *int_in =3D NULL;
> > +     int ret;
> > +     int i;
> > +     int num_ports;
> > +
> > +     /* Send init command */
> > +     cmd.val =3D nct_build_cmd(NCT_VCOM_SET_INIT, NCT_VCOM_INDEX_GLOBA=
L);
> > +     ret =3D nct_vendor_write(intf, cmd, 0);
> > +     if (ret) {
> > +             dev_err(&intf->dev, "set COM init error\n");
> > +             return ret;
> > +     }
> > +
> > +     /* Get ports' index supported by the device(/FW) */
> > +     cmd.val =3D nct_build_cmd(NCT_VCOM_GET_PORTS_SUPPORT, NCT_VCOM_IN=
DEX_GLOBAL);
> > +     ret =3D nct_vendor_read(intf, cmd, buf, 1);
> > +     if (ret) {
> > +             dev_err(&intf->dev,
>
> Line break not needed.
>
> > +                     "get COM port index error\n");
> > +             return ret;
> > +     }
> > +
> > +     if (!serial_priv) {
> > +             serial_priv =3D kzalloc_obj(*serial_priv, GFP_KERNEL);
> > +             if (!serial_priv)
> > +                     return -ENOMEM;
> > +             spin_lock_init(&serial_priv->serial_lock);
> > +             mutex_init(&serial_priv->open_close_mutex);
> > +             usb_set_serial_data(serial, serial_priv);
> > +     }
>
> This does not belong here in calc_num_ports(), but if you really must
> allocate memory you currently need to use devm_kzalloc() as otherwise it
> may not be freed in all error paths.
>
> But its better to avoid that and defer allocation to attach() if
> you can.
>
> > +     serial_priv->en_device_mask =3D buf[0];
>
> Can't you just store the mask in the serial port driver data
> temporarily, and retrieve it in attach when you setup the driver data
> (or just query the device again)?
>
> > +     serial_priv->last_assigned_hw_idx =3D 0; /* Note: hw_idx is based=
 on 1 */
> > +
> > +     for (i =3D 0, num_ports =3D 0; i < NCT_MAX_NUM_COM_DEVICES; i++) =
{
> > +             if (!(buf[0] & BIT(i)))
> > +                     continue;       /* The port is disabled */
> > +
> > +             num_ports++;
> > +     }
> > +
> > +     for (i =3D 0; i < iface_desc->desc.bNumEndpoints; i++) {
> > +             struct usb_endpoint_descriptor *endpoint =3D
> > +                     &iface_desc->endpoint[i].desc;
> > +
> > +             if (!bulk_in && usb_endpoint_is_bulk_in(endpoint))
> > +                     bulk_in =3D endpoint;
> > +             if (!bulk_out && usb_endpoint_is_bulk_out(endpoint))
> > +                     bulk_out =3D endpoint;
> > +             if (!int_in && usb_endpoint_is_int_in(endpoint))
> > +                     int_in =3D endpoint;
> > +     }
>
> Use may be able to use usb_find_common_endpoints() here, but I don't
> think you need it either since core will already have stored them in
> epds->bulk_in[0], etc.
>
> > +
> > +     if (!bulk_in || !bulk_out)
> > +             return -ENODEV;
>
> You already set the driver num_bulk_out and num_bulk_in fields so core
> would already have rejected any device which doesn't have at least that
> many endpoints.
>
> > +
> > +     for (i =3D 0; i < num_ports; i++) {
> > +             epds->bulk_in[i] =3D bulk_in;
>
> The in endpoints do not need to be set for each port, just the bulk_out
> one so that the write urbs are allocated.
>
> > +             epds->bulk_out[i] =3D bulk_out;
>
> > +             if (int_in && i =3D=3D 0)
> > +                     epds->interrupt_in[i] =3D int_in;
>
> No need for this either.
>
> > +     }
> > +     epds->num_bulk_out =3D num_ports;
> > +
> > +     return num_ports;
> > +}
> > +
> > +static int nct_attach(struct usb_serial *serial)
> > +{
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +
> > +     if (!serial_priv)
> > +             return -ENODEV;
> > +
> > +     serial_priv->use_bulk_status =3D true;
> > +     if (serial->port[0] && serial->port[0]->interrupt_in_urb)
>
> No need to check that port[0] exists (e.g. since you require at least
> one endpoint).
>
> > +             serial_priv->use_bulk_status =3D false;
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct_port_probe(struct usb_serial_port *port)
> > +{
> > +     struct nct_tty_port *tport;
> > +     struct usb_serial *serial =3D port->serial;
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     unsigned long flags;
> > +     int i, ret;
> > +     unsigned int fifo_state;
> > +
> > +     tport =3D kzalloc_obj(*tport, GFP_KERNEL);
> > +     if (!tport)
> > +             return -ENOMEM;
> > +
> > +     /* Assign hw_idx */
> > +     mutex_init(&tport->mctrl_mutex);
> > +     spin_lock_init(&tport->port_lock);
> > +
> > +     spin_lock_irqsave(&serial_priv->serial_lock, flags);
> > +     for (i =3D serial_priv->last_assigned_hw_idx + 1;
> > +          i < NCT_MAX_NUM_COM_DEVICES; i++) {
> > +             if ((serial_priv->en_device_mask & (1 << i)) =3D=3D 0)
> > +                     continue; /* The port is disabled */
> > +
> > +             tport->hw_idx =3D i;
> > +             serial_priv->last_assigned_hw_idx =3D i;
> > +             break;
> > +     }
> > +     spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
>
> It seems better to set up the port mapping for all ports once at
> attach().
>
> > +
> > +     usb_set_serial_port_data(port, tport);
> > +
> > +     spin_lock_irqsave(&serial_priv->serial_lock, flags);
> > +     serial_priv->port_by_hw_idx[tport->hw_idx] =3D port;
> > +     spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
>
> > +     fifo_state =3D kfifo_initialized(&port->write_fifo);
> > +
> > +     /*
> > +      * Keep the FIFO if it is already initialized.
> > +      */
> > +     if (fifo_state)
> > +             return 0;
> > +     ret =3D kfifo_alloc(&port->write_fifo, NCT_WRITE_FIFO_SIZE, GFP_K=
ERNEL);
> > +     if (ret) {
> > +             kfree(tport);
> > +             return ret;
> > +     }
>
> This should not be needed either as core allocates the write_fifo for
> all ports with a bulk_out endpoint (which you just set up in
> calc_num_ports()).
>
> > +
> > +     return 0;
> > +}
> > +
> > +static void nct_interrupt_in_callback(struct urb *urb)
> > +{
> > +     struct usb_serial_port *port =3D urb->context;
> > +     int status =3D urb->status;
> > +     struct usb_serial *serial =3D port->serial;
> > +     unsigned char *data =3D urb->transfer_buffer;
> > +     int retval;
> > +     int i;
> > +     int actual_len =3D urb->actual_length;
> > +     struct nct_port_status *nps;
>
> Again, please try to approximate reverse xmas style declarations.
>
> > +
> > +     switch (status) {
> > +     case 0:
> > +             /* Success */
> > +             if ((actual_len % sizeof(*nps)) !=3D 0)
> > +                     return;
> > +
> > +             nps =3D (struct nct_port_status *)data;
> > +             for (i =3D 0; i < (actual_len / sizeof(*nps)); i++) {
> > +                     nct_update_status(serial, (unsigned char *)nps);
> > +                     nps++;
> > +             }
>
> Looks like this could share a helper function with the bulk_status
> parsing?
>
> > +             break;
> > +
> > +     case -ECONNRESET:
> > +     case -ENOENT:
> > +     case -ESHUTDOWN:
> > +             /* This urb is terminated, clean up */
> > +             return;
> > +     default:
> > +             break;
> > +     }
>
> Nit: add a newline
>
> > +     retval =3D usb_submit_urb(urb, GFP_ATOMIC);
> > +     if (retval)
> > +             dev_err(&port->dev, "submit intr URB failed, ret=3D%d\n",
> > +                     retval);
> > +}
> > +
> > +static void nct_disconnect(struct usb_serial *serial)
> > +{
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     unsigned long flags;
> > +
> > +     /* Reset status */
> > +     spin_lock_irqsave(&serial_priv->serial_lock, flags);
> > +     serial_priv->open_count =3D 0;
> > +     serial_priv->cur_port =3D NULL;
> > +     serial_priv->cur_len =3D 0;
> > +     spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
>
> The device is going away so there's no need to reset any state (and all
> ports would already have been closed).
>
> > +
> > +}
> > +
> > +static void nct_port_remove(struct usb_serial_port *port)
> > +{
> > +     struct nct_tty_port *priv =3D usb_get_serial_port_data(port);
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(port->seri=
al);
> > +     unsigned long flags;
> > +
> > +     if (priv) {
>
> priv is non-NULL here
>
> > +             spin_lock_irqsave(&serial_priv->serial_lock, flags);
> > +             if (priv->hw_idx < NCT_MAX_NUM_COM_DEVICES)
>
> hw_idx should never be invalid here, right?
>
> > +                     serial_priv->port_by_hw_idx[priv->hw_idx] =3D NUL=
L;
> > +             spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> > +     }
> > +     kfree(priv);
> > +}
> > +
> > +static void nct_release(struct usb_serial *serial)
> > +{
> > +     struct nct_serial *serial_priv;
> > +
> > +     serial_priv =3D usb_get_serial_data(serial);
> > +     kfree(serial_priv);
> > +}
> > +
> > +static int nct_suspend(struct usb_serial *serial, pm_message_t message=
)
> > +{
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     int i;
> > +
> > +     /* Stop all URBs */
> > +     usb_kill_urb(serial->port[0]->read_urb);
> > +     for (i =3D 0; i < serial->type->num_ports; i++)
> > +             usb_kill_urb(serial->port[i]->write_urb);
>
> The generic implementation uses both write urbs.
>
> > +
> > +     if (!serial_priv->use_bulk_status)
> > +             usb_kill_urb(serial->port[0]->interrupt_in_urb);
>
> But you strictly don't need to implement suspend as you only use URBs
> allocated by core, which core will kill for you on suspend.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct_resume(struct usb_serial *serial)
> > +{
> > +     struct nct_serial *serial_priv =3D usb_get_serial_data(serial);
> > +     struct usb_interface *intf =3D serial->interface;
> > +     unsigned long flags;
> > +     int ret;
> > +
> > +     /* Reset driver internal state */
> > +     spin_lock_irqsave(&serial_priv->serial_lock, flags);
> > +     serial_priv->cur_port =3D NULL;
> > +     serial_priv->cur_len =3D 0;
> > +     spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> > +
> > +     /* Resubmit URBs */
> > +     if (!serial_priv->open_count)
> > +             return 0;
> > +
> > +     ret =3D usb_submit_urb(serial->port[0]->read_urb, GFP_KERNEL);
> > +     if (ret)
> > +             dev_err(&intf->dev, "submit read URB failed, ret=3D%d\n",
> > +                     ret);
> > +
> > +     if (!serial_priv->use_bulk_status) {
> > +             ret =3D usb_submit_urb(serial->port[0]->interrupt_in_urb,
> > +                                  GFP_KERNEL);
> > +             if (ret)
> > +                     dev_err(&intf->dev,
> > +                             "submit interrupt URB failed, ret=3D%d\n"=
,
> > +                             ret);
> > +     }
>
> You may be able to use usb_serial_generic_resume() here instead of open
> coding, which also takes care of restarting writes in case there is
> still data in the fifos.
>
> At least if you are going to use both read urbs back to back.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static struct usb_serial_driver nct_usb_serial_device =3D {
> > +     .driver =3D {
> > +             .name =3D         "nct_mtuart",
> > +     },
> > +     .description =3D          "Nuvoton USB to serial adapter",
> > +     .id_table =3D             id_table,
> > +     .num_bulk_in =3D          1,
> > +     .num_bulk_out =3D         1,
> > +     .open =3D                 nct_open,
> > +     .close =3D                nct_close,
> > +     .write =3D                nct_serial_write,
> > +     .write_room =3D           nct_write_room,
> > +     .write_bulk_callback =3D  usb_serial_generic_write_bulk_callback,
> > +     .prepare_write_buffer =3D nct_prepare_write_buffer,
> > +     .read_bulk_callback =3D   nct_read_bulk_callback,
> > +     .read_int_callback =3D    nct_interrupt_in_callback,
> > +     .chars_in_buffer =3D      nct_chars_in_buffer,
> > +     .throttle =3D             nct_rx_throttle,
> > +     .unthrottle =3D           nct_rx_unthrottle,
> > +     .attach =3D               nct_attach,
> > +     .calc_num_ports =3D       nct_calc_num_ports,
> > +     .set_termios =3D          nct_set_termios,
> > +     .break_ctl =3D            nct_break,
> > +     .tiocmget =3D             nct_tiocmget,
> > +     .tiocmset =3D             nct_tiocmset_helper,
> > +     .disconnect =3D           nct_disconnect,
> > +     .release =3D              nct_release,
> > +     .port_probe =3D           nct_port_probe,
> > +     .port_remove =3D          nct_port_remove,
> > +     .suspend =3D              nct_suspend,
> > +     .resume =3D               nct_resume,
> > +};
> > +
> > +static struct usb_serial_driver * const nct_serial_drivers[] =3D {
> > +     &nct_usb_serial_device, NULL
> > +};
> > +
> > +module_usb_serial_driver(nct_serial_drivers, id_table);
> > +MODULE_DESCRIPTION("Nuvoton USB to serial adaptor driver");
> > +MODULE_AUTHOR("Sheng-Yuan Huang <syhuang3@nuvoton.com>");
> > +MODULE_LICENSE("GPL v2");
>
> > +
>
> Nit: stray newline
>
> Again, I think this looks pretty good over all.
>
> Johan

<https://www.avast.com/sig-email?utm_medium=3Demail&utm_source=3Dlink&utm_c=
ampaign=3Dsig-email&utm_content=3Dwebmail>
=E4=B9=BE=E6=B7=A8=E7=84=A1=E7=97=85=E6=AF=92=E3=80=82www.avast.com
<https://www.avast.com/sig-email?utm_medium=3Demail&utm_source=3Dlink&utm_c=
ampaign=3Dsig-email&utm_content=3Dwebmail>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
