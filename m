Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362002DB7BE
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528223; cv=none; b=nBcanOuDzBCwD9eDjry+BfRqXh6lgGomSwo91J5bMahZsjZMC+3O2JhHAh0nd/a6jFmYAc0y+gmdD/b3ufJWd38IveRxGrEyxcYbh02kU+h7mY7MDKGifVY8Ty5/NNZGM7LpYXvftgO/Lx1TBJMKIMBc0nl1FrZ6CJ41M+F6Fn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528223; c=relaxed/simple;
	bh=pS2QdYmdp5RC4FZj3Y3re90U1JyvtNPsvAV40y6WHS0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EaiERZ6B+JGOi+I0CluCKO1T5OyNG9VtIwN+ZzeumAuG8m9Hn0ZAmGC9BlaYHXrl+OmMs0XQBqEYMOuOhlUHechBsDEE1FRO6TOaKeAHOH9zJLwPWD/KtXEgAqltM5g1fijo2s3OZ4gH7xIXX5noPi/WERihtqylQwy37AGf4XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJ7IHLzj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJ7IHLzj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DDF1F000FF;
	Fri,  9 Oct 2026 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791528221;
	bh=GBaH3Brenufa8g5cUMcQ3yUJBCOhfGcjl+kkWp/pHac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJ7IHLzjRDfDJGHG7ub10/BS0qA3oARb2AG/Ylrc1DqsQh2hTkUMg8xccT+VktS+Q
	 3GMgiZu7WsC5cY1muNjppvQzOjD7iE2LuIlSDdFoLSllQQRgfkCKWCwxEJqOMWBAwD
	 dqShdg0E/EmRsXhIPurL5mHcK4YoBIpJa+GTHfhhuYZ84r8enjB2AX4VMu1D0kjPhH
	 kD20NLhYRTLLjeSAn8ZHoNhs9wdmr5M7Mmws6lKjzNy9LPGd1rjbrorRaFPcfgBkAo
	 zV/jwIIM0HwOxjwxmHgoBZMJX6X7vtjHOMFNy6pwXlK7ilN8OqKyZ8MolqBGLwiIji
	 nPNGzaCbeHQAA==
Message-ID: <sashiko-outbox-164957@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] usb: gadget: composite: Support eUSB2v2 bulk MPS
 update
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak" <pawell@cadence.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009-eusb2v2-packet-size-v4-2-a505ee17b460@cadence.com>
References: <20261009-eusb2v2-packet-size-v4-0-a505ee17b460@cadence.com>
 <20261009-eusb2v2-packet-size-v4-2-a505ee17b460@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 06:43:41 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] usb: composite: Data race on bitfields in struct usb_gadget
- [High] usb: composite: eUSB2v2 capability check breaks SuperSpeed device =
descriptors
- [Medium] usb: composite: Missing capability check before accepting eUSB2v=
2 feature
- [Medium] usb: composite: Missing fallback for unhandled SET_FEATURE reque=
sts breaks delegation
--

commit 6017c856bde8d3fefac3ad153909a02705baae1f
Author: Pawel Laszczak <pawell@cadence.com>

usb: gadget: composite: Support eUSB2v2 bulk MPS update

This commit adds support for eUSB2v2 1024-byte Bulk MPS negotiation to the
Gadget Composite framework.

> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composit=
e.c
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
[ ... ]
> @@ -1807,7 +1808,11 @@ composite_setup(struct usb_gadget *gadget, const s=
truct usb_ctrlrequest *ctrl)
>  				count_configs(cdev, USB_DT_DEVICE);
>  			cdev->desc.bMaxPacketSize0 =3D
>  				cdev->gadget->ep0->maxpacket;
> -			if (gadget_is_superspeed(gadget)) {
> +
> +			if (gadget->is_eusb2v2) {
> +				cdev->desc.bcdUSB =3D cpu_to_le16(0x0230);
> +				cdev->desc.bMaxPacketSize0 =3D 64;
> +			} else if (gadget_is_superspeed(gadget)) {

[Severity: High]
Does this static capability check unconditionally override the descriptor
fields and ignore the current negotiated link speed?

is_eusb2v2 is a static capability flag set by dual-speed UDC drivers at
probe time. If a dual-speed device is plugged into a USB 3.0 port and
enumerates at SuperSpeed:

composite_setup()
    switch (w_value >> 8) {
    case USB_DT_DEVICE:
        if (gadget->is_eusb2v2) {
            ...
        } else if (gadget_is_superspeed(gadget)) {
            ...
        }

The code will incorrectly report bMaxPacketSize0 =3D 64 instead of the
strictly required value of 9 (representing 2^9 =3D 512 bytes for SuperSpeed=
).
Can this break USB 3.x host enumeration for any UDC supporting eUSB2v2?

[ ... ]
> @@ -2006,12 +2011,20 @@ composite_setup(struct usb_gadget *gadget, const =
struct usb_ctrlrequest *ctrl)
>  	 */
>  	case USB_REQ_CLEAR_FEATURE:
>  	case USB_REQ_SET_FEATURE:
> -		if (!gadget_is_superspeed(gadget))
> -			goto unknown;
> -		if (ctrl->bRequestType !=3D (USB_DIR_OUT | USB_RECIP_INTERFACE))
> -			goto unknown;
>  		switch (w_value) {

[Severity: Medium]
Does this switch block miss a fallback for unhandled SET_FEATURE requests?

Standard requests with w_value that are not explicitly handled in the
switch (for example USB_DEVICE_REMOTE_WAKEUP, USB_DEVICE_TEST_MODE, or
USB_DEVICE_U1_ENABLE) will fall through the switch, hit the outer break,
and return -EOPNOTSUPP directly.

Could this bypass the goto unknown delegation block entirely, breaking
userspace gadget drivers like FunctionFS that rely on intercepting
device-level feature requests by setting the FUNCTIONFS_ALL_CTRL_RECIP flag?

> +		case USB_DEVICE_BULK_MAX_PACKET_UPDATE:
> +			if (ctrl->bRequestType !=3D (USB_DIR_OUT | USB_RECIP_DEVICE))
> +				goto unknown;
> +			if (ctrl->bRequest !=3D USB_REQ_SET_FEATURE)
> +				goto unknown;

[Severity: Medium]
Is a capability check missing before accepting the eUSB2v2 feature?

If a host incorrectly sends this eUSB2-specific feature to a standard
USB 2.0 or 3.0 gadget, the gadget will inappropriately ACK the feature
here instead of STALLing it, because there is no verification of
if (gadget->is_eusb2v2).

Can this cause the host to incorrectly assume 1024-byte bulk packets are
supported and transmit them, leading to hardware babble errors or DMA
overflows on standard UDCs configured for 512-byte max packet sizes?

> +			gadget->eusb2v2_mps_active =3D 1;
> +			value =3D 0;
> +			break;

[Severity: High]
Does this bitfield write in interrupt context introduce a data race?

composite_setup() runs in the UDC endpoint 0 interrupt context, and
gadget->eusb2v2_mps_active =3D 1 is written here without taking a lock that
serializes with process-context writers.

In include/linux/usb/gadget.h, eusb2v2_mps_active shares a bitfield word
with other flags like connected and deactivated:

struct usb_gadget {
    ...
    unsigned connected:1;
    ...
    unsigned is_eusb2v2:1;
    unsigned eusb2v2_mps_active:1;
};

Those other fields are written in process context (for example, in
usb_gadget_connect()) while holding the connect_lock mutex, which does
not disable interrupts.

Since bitfield updates compile down to non-atomic Read-Modify-Write (RMW)
operations on the full word, an interrupt occurring during a process-context
RMW will cause the interrupt's bitfield write to be silently overwritten and
lost, or vice versa. Can this randomly drop the gadget's fundamental
connection state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-eusb2v2-pa=
cket-size-v4-0-a505ee17b460@cadence.com?part=3D2
